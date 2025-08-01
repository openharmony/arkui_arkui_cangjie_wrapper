/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

macro package ohos.arkui.state_macro_manage

import std.ast.*
import std.collection.*

/**
 * example:
 * @Observed
 * class Book {
 *     @Publish var title: String = "English"
 * }
 * will expand to
 * class Book <: ObservedObject {
 *     private var stateVarDecl_title_: ObservedProperty<String>
 *     prop var title: String {
 *         get() {
 *             return this.stateVarDecl_title_.get()
 *         }
 *         set(v) {
 *             this.stateVarDecl_title_.set(v)
 *         }
 *     }
 *     init(title!: String = "English") {
 *         this.stateVarDecl_title_ = ObservedProperty<String>("title", title)
 *         this.addPublishVar(this.stateVarDecl_title_)
 *     }
 *     func set(newValue: ObservedComplexAbstract) {
 *         let realValue = (newValue as Book).getOrThrow()
 *         this.title = realValue.title
 *     }
 *     func get(): Book {
 *         return this
 *     }
 * }
 */
public macro Observed(input: Tokens): Tokens {
    checkObserved(input)
    let decl = parseDecl(input)
    let observedClass = (decl as ClassDecl).getOrThrow()
    let classModifier = observedClass.modifiers
    let classKeyWord = observedClass.keyword
    let classIdent = observedClass.identifier
    let classBody = observedClass.body.decls

    stateManageHandler.observedWithPublishInfo.add(classIdent.value, stateManageHandler.publishInformation)

    // generate set function, it will assign new value to all publish declarations.
    let memberSetFunc = generateSetFunc(quote($classIdent))

    // generate init function
    let initFunc = generateObservedInitFunc(observedClass)

    // reset global var declaration in macro
    stateManageHandler.publishInformation.clear()

    // emit all error in macro
    diag.emit()

    createClassDeclaration(
        modifiers: quote($classModifier),
        identifier: quote($classIdent),
        superTypes: quote($OBSERVED_OBJECT),
        body: quote(
            $classBody
            $initFunc
            $memberSetFunc
        )
    )
}

func checkObserved(input: Tokens) {
    let decl = parseDecl(input)
    if (!(decl is ClassDecl)) {
        diag.fatal(input, "Only class is supported in @Observed.")
    }
    let classDecl = (decl as ClassDecl).getOrThrow()
    checkInitFunc(classDecl)
    var superTypes = classDecl.superTypes

    if (superTypes.size > 0) {
        diag.error(input, "Observed class should not inherit other class or interface.")
    }
}

func generateSetFunc(classIdent: Tokens): Tokens {
    var body = quote(
        let realValue = (newValue as $classIdent).getOrThrow()
    )

    // Assign new values to publish declarations
    for (item in stateManageHandler.publishInformation.values()) {
        let memberItem = item.identifier
        body = body + quote(
            this.$memberItem = realValue.$memberItem
        )
    }

    createMethodDeclaration(
        modifiers: quote(public),
        identifier: quote(set),
        params: quote((newValue: $OBSERVED_COMPLEX_ABSTRACT)),
        body: body
    )
}

func generatePublishVarDecl(varDecl: VarDecl, varExpand: VarDecl): (Tokens, Tokens, Tokens) {
    let identifierAssociated = varExpand.identifier
    let identifier = varDecl.identifier
    let info = mangle(identifier.value)
    let varDeclType = varDecl.getTypeByInitializer()
    let valTypeExpand = varExpand.getTypeByInitializer()
    var hasInitializer = false
    try {
        let v = varDecl.expr
        hasInitializer = true
    } catch (e: Exception) {
        hasInitializer = false
    }
    let initParams = match (hasInitializer) {
        case true => quote($identifier!: Option<$varDeclType> = Option.None)
        case _ => quote($identifier!: $varDeclType)
    }

    let commonAssign = match (hasInitializer) {
        case true => quote(
            match ($identifier) {
                case Some(v) => this.$identifierAssociated = $valTypeExpand($info, v)
                case _ => ()
            }
        )
        case _ => quote(
            this.$identifierAssociated = $valTypeExpand($info, $identifier)
        )
    }
    let initBodySubscribe = quote(
        this.addPublishVar(this.$identifierAssociated)
        this.addPropsInfo($info)
    )

    return (initParams, commonAssign, initBodySubscribe)
}

func generateNormalVarDecl(varDecl: VarDecl): MacroExpandInitInfo {
    let commonVarKeyword = varDecl.keyword
    var hasInitializer = false
    try {
        varDecl.expr
        hasInitializer = true
    } catch (e: Exception) {
        hasInitializer = false
    }
    if (commonVarKeyword.value == "let" && hasInitializer) {
        return (Tokens(), Tokens(), Tokens())
    }
    let commonVarDeclIdent = varDecl.identifier
    let commonVarDeclType = varDecl.getTypeByInitializer()

    let initBody = match (hasInitializer) {
        case true => quote(
                match ($commonVarDeclIdent) {
                    case Some(v) => this.$commonVarDeclIdent = v
                    case _ => ()
                }
            )
        case _ => quote(
                this.$commonVarDeclIdent = $commonVarDeclIdent
            )
    }

    let initParam = match (hasInitializer) {
        case true => quote($commonVarDeclIdent!: Option<$commonVarDeclType> = Option.None)
        case _ => quote($commonVarDeclIdent!: $commonVarDeclType)
    }
    return (initParam, initBody, Tokens())
}

func genSingleInitParamAndAssign(varDecl: VarDecl): (Tokens, Tokens, Tokens) {
    let ident = varDecl.identifier
    match (stateManageHandler.publishInformation.get(ident.value)) {
        case None => generateNormalVarDecl(varDecl)
        case Some(v) => generatePublishVarDecl(v, varDecl)
    }
}

/**
 * variable declarations in observed class will generate named parameters to init function.
 * @returns (Tokens, Tokens). First Tokens is initParams, Second is commonAssign.
 */
func getInitParamAndAssign(varDecls: ArrayList<VarDecl>) {
    var initParams = Tokens()
    var commonAssign = Tokens()
    var initBodySubscribe = Tokens()
    if (varDecls.size == 0) {
        return (initParams, commonAssign, initBodySubscribe)
    }
    let paramList = ArrayList<Tokens>()
    for (item in varDecls) {
        let singleInitParamAndAssign = genSingleInitParamAndAssign(item)
        if (singleInitParamAndAssign[0].size != 0) {
            paramList.add(singleInitParamAndAssign[0])
        }
        commonAssign = commonAssign + singleInitParamAndAssign[1]
        initBodySubscribe = initBodySubscribe + singleInitParamAndAssign[2]
    }
    initParams = joinListToTokens(paramList, quote(, ))
    return (initParams, commonAssign, initBodySubscribe)
}

func generateObservedInitFunc(classDecl: ClassDecl): Tokens {
    let varDecls = getVarDecls(classDecl)
    // record the params and common variable assignments of init function
    let initParamAndAssign = getInitParamAndAssign(varDecls)
    let initParams = initParamAndAssign[0]
    let initAssignments = initParamAndAssign[1]
    // record the subscribe expression in init function body
    let initBodySubscribe = initParamAndAssign[2]

    return quote(
        public init($initParams) {
            $initAssignments
            $initBodySubscribe
        }
    )
}
