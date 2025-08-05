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

macro package ohos.state_macro_manage

import std.ast.*
import std.collection.*

public macro Builder(input: Tokens): Tokens {
    let decl = parseDecl(input)

    if ((decl as FuncDecl).isNone()) {
        diag.fatal(input, "@Builder should decorate function.")
    }
    let funcDecl = (decl as FuncDecl).getOrThrow()

    // check whether the return type is Unit or default
    try {
        let retType = funcDecl.declType
        if (retType.toTokens().toString() != "Unit") {
            diag.fatal(input, "The declaration type of the @Builder function should be Unit")
        }
    } catch (e: ASTException) {}

    let modifier = funcDecl.modifiers
    let funcIdent = funcDecl.identifier
    var funcBody = funcDecl.block.nodes
    var generics = None<Tokens>
    try {
        let gen = funcDecl.genericParam
        generics = Some(quote($gen))
    } catch (e: ASTException) {}
    let params = funcDecl.funcParams
    let genConstraints = if (funcDecl.genericConstraint.size != 0) {
        var genCons = Tokens()
        for (i in 0..funcDecl.genericConstraint.size) {
            if (i == 0) {
                genCons += (funcDecl.genericConstraint)[0].toTokens()
            } else {
                genCons += quote(,) + (funcDecl.genericConstraint)[i].toTokens()
            }
        }
        Some(genCons)
    } else {
        None<Tokens>
    }

    // create inner function identifier
    let innerFuncIdent: Token = generateInnerFuncIdent(funcIdent.value)

    // create entry and inner function params
    var entryParam = Tokens()
    var innerParam = Tokens()
    if (params.size != 0) {
        innerParam += quote(thisView: CustomView, )
        entryParam += quote(thisView: CustomView, )
    } else {
        innerParam += quote(thisView: CustomView)
        entryParam += quote(thisView: CustomView)
    }
    for (item in params) {
        innerParam += quote($item)
        entryParam += generateBuilderParam(item)
    }

    // create inner function call's concrete parameters
    var concretes = quote(thisView)
    for (item in params) {
        concretes += generateInnerValues(item)
    }

    // create entry function body
    let entryBody = if (let Some(gen) <- generics) {
        quote(
            ViewBuilder { $innerFuncIdent$gen($concretes) }
        )
    } else {
        quote(
            ViewBuilder { $innerFuncIdent($concretes) }
        )
    }

    stateManageHandler.builderSingleInfo.add(funcIdent.value)

    funcBody = bindBuilderCtx(funcBody, quote(thisView))
    let innerFunc = createMethodDeclaration(
        identifier: quote($innerFuncIdent),
        generics: generics,
        params: quote(($innerParam)),
        genConstraints: genConstraints,
        retType: quote(Unit),
        body: generateFuncBody(funcBody, quote(thisView))
    )

    createMethodDeclaration(
        modifiers: quote($modifier),
        identifier: quote($funcIdent),
        generics: generics,
        params: quote(($entryParam)),
        genConstraints: genConstraints,
        retType: quote(ViewBuilder),
        body: innerFunc + quote(
            ) + entryBody
    )
}

func generateBuilderParam(param: FuncParam): Tokens {
    let paramType = param.paramType
    param.paramType = RefType(quote(ObservedProperty<$paramType>))
    try {
        let expr = param.expr
        param.expr = CallExpr(quote(ObservedProperty<$paramType>("", $expr)))
    } catch (e: ASTException) {}
    param.toTokens()
}

func generateInnerValues(param: FuncParam): Tokens {
    let paramId = param.identifier
    if (param.not.value == "!") {
        quote(, $paramId: $paramId.get())
    } else {
        quote(, $paramId.get())
    }
}

func generateInnerFuncIdent(name: String): Token {
    Token(TokenKind.IDENTIFIER, "${name}" + "__inner__")
}

/**
 * Supporting @Builder function as parameters in some common properties
 */
let bindFunctions: HashMap<String, Int64> = HashMap<String, Int64>(
    [("bindContentCover", 1), ("bindSheet", 1), ("description", 0)])
let bindFunctionsNamedParam: HashMap<String, Int64> = HashMap<String, Int64>([("bindMenu", 0), ("bindContextMenu", 0)])

class VisitBuilder <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    let thisView: Tokens

    init(thisView: Tokens) {
        this.thisView = thisView
    }

    protected override func visit(curNode: CallExpr) {
        if (!(curNode.callFunc is MemberAccess)) {
            return
        }
        var ma = (curNode.callFunc as MemberAccess).getOrThrow()
        if (let Some(index) <- bindFunctions.get(ma.field.value)) {
            var builder = curNode.arguments[index].expr
            var callBind = CallExpr(quote(bind($builder, $thisView)))
            curNode.arguments[index].expr = callBind
        } else if (let Some(index) <- bindFunctionsNamedParam.get(ma.field.value)) {
            if (getArgumentIdentifier(curNode.arguments[index]).value == "builder") {
                var builder = curNode.arguments[index].expr
                var callBind = CallExpr(quote(bind($builder, $thisView)))
                curNode.arguments[index].expr = callBind
            }
        }
    }

    protected override func visit(curNode: VarDecl) {
        ident.add(curNode.identifier.value)
    }
}

func bindBuilderCtx(input: ArrayList<Node>, thisView: Tokens): ArrayList<Node> {
    if (input.isEmpty()) {
        return input
    }
    input[0] = match (input[0]) {
        case value: Expr =>
            value.traverse(VisitBuilder(thisView))
            value
        case _ => input[0]
    }
    return input
}
