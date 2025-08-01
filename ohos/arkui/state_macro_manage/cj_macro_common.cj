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
 * record state and init declaration
 * example:
 * @LocalStorageLink["test"] var a: Int64 = 20
 * Tokens1: stateVarDecl_a_
 * Tokens2: this.getLocalStorage().setAndLink < Int64 >("Count", 0)...
 */
var localStorageStateInfo: ArrayList<(Tokens, Tokens)> = ArrayList([])

func generateNewId(): Int64 {
    let ret = stateManageHandler.uuid
    stateManageHandler.uuid++
    return ret
}

func generateNewEntryId(): Int64 {
    let ret = stateManageHandler.entryId
    stateManageHandler.entryId++
    return ret
}

func getArgumentIdentifier(arg: Argument): Token {
    return try {
        arg.identifier
    } catch (e: ASTException) {
        Token(TokenKind.IDENTIFIER, "")
    }
}

enum StateKind <: ToString {
    | ConsumeTy
    | LinkTy
    | PropTy
    | ProvideTy
    | PublishTy
    | StateTy
    | AppStorageLinkTy
    | AppStoragePropTy
    | LocalStorageLinkTy
    | LocalStoragePropTy
    | LocalStorageLinkInterOpTy
    | LocalStoragePropInterOpTy

    public func toString() {
        match (this) {
            case StateTy => return "State"
            case PublishTy => return "Publish"
            case ProvideTy => return "Provide"
            case PropTy => return "Prop"
            case LinkTy => return "Link"
            case ConsumeTy => return "Consume"
            case AppStorageLinkTy => return "StorageLink"
            case AppStoragePropTy => return "StorageProp"
            case LocalStorageLinkTy => return "LocalStorageLink"
            case LocalStoragePropTy => return "LocalStorageProp"
            case LocalStorageLinkInterOpTy => return "LocalStorageLinkInterOp"
            case LocalStoragePropInterOpTy => return "LocalStoragePropInterOp"
        }
    }
}

enum VariableKind {
    | StateTy
    | LinkTy
    | PropTy
    | CommonTy
    | ProvideTy
    | ConsumeTy
    | AppStorageLinkTy
    | AppStoragePropTy
    | LocalStorageLinkTy
    | LocalStoragePropTy
    | LocalStorageLinkInterOpTy
    | LocalStoragePropInterOpTy

    func getIndex() {
        match (this) {
            case StateTy => 0
            case LinkTy => 1
            case PropTy => 2
            case CommonTy => 3
            case ProvideTy => 4
            case ConsumeTy => 5
            case AppStorageLinkTy => 6
            case AppStoragePropTy => 7
            case LocalStorageLinkTy => 8
            case LocalStoragePropTy => 9
            case LocalStorageLinkInterOpTy => 10
            case LocalStoragePropInterOpTy => 11
        }
    }
}

func needInitializer(stateKind: StateKind): Bool {
    match (stateKind) {
        case StateTy => return true
        case PublishTy => return true
        case ProvideTy => return true
        case PropTy => return false
        case LinkTy => return false
        case ConsumeTy => return false
        case AppStorageLinkTy => return true
        case AppStoragePropTy => return true
        case LocalStorageLinkTy => return true
        case LocalStoragePropTy => return true
        case LocalStorageLinkInterOpTy => return true
        case LocalStoragePropInterOpTy => return true
    }
}

func genProp(varDecl: VarDecl, stateKind: StateKind): Tokens {
    let varDeclModifiers = varDecl.modifiers

    var isPublish: Bool = match (stateKind) {
        case PublishTy => true
        case _ => false
    }
    if (!isPublish && varDeclModifiers.size != 0) {
        diag.error(quote($varDecl),
            "The variables modified by status macros such as @State, @Link, etc," +
                "should not have modifiers like public, private, protected and static.")
    }
    let varDeclKeyWord = varDecl.keyword

    let identTok: Token = varDecl.identifier
    let identTokStr: String = identTok.value
    let identTokenAssociated: Token = generateAssociatedToken(identTokStr)
    let valType = varDecl.getTypeByInitializer()

    var res = Tokens()
    let propDecl = genPropDecl(varDecl, stateKind)
    let info = mangle(identTokStr)
    var initValue = Tokens()
    try {
        let v = varDecl.expr
        initValue = match (stateKind) {
            case AppStorageLinkTy =>
                let attrStr = getAppStorageAttrByIdent(identTokenAssociated.value)
                quote( = AppStorage.setAndLink<$valType>($attrStr, $v))
            case AppStoragePropTy =>
                let attrStr = getAppStorageAttrByIdent(identTokenAssociated.value)
                quote( = AppStorage.setAndProp<$valType>($attrStr, $v))
            case LocalStorageLinkTy =>
                let attrStr = getLocalStorageAttrByIdent(identTokenAssociated.value)
                localStorageStateInfo.add(
                    (quote($identTokenAssociated), quote(getLocalStorage().setAndLink<$valType>($attrStr, $v))))
                quote()
            case LocalStoragePropTy =>
                let attrStr = getLocalStorageAttrByIdent(identTokenAssociated.value)
                localStorageStateInfo.add(
                    (quote($identTokenAssociated), quote(getLocalStorage().setAndProp<$valType>($attrStr, $v))))
                quote()
            case LocalStorageLinkInterOpTy =>
                let attrStr = getLocalStorageAttrByIdent(identTokenAssociated.value)
                quote( = LocalStorageInterOp.getOrCreate().setAndLink<$valType>($attrStr, $v))
            case LocalStoragePropInterOpTy =>
                let attrStr = getLocalStorageAttrByIdent(identTokenAssociated.value)
                quote( = LocalStorageInterOp.getOrCreate().setAndProp<$valType>($attrStr, $v))
            case _ => quote( = $OBSERVED_PROPERTY<$valType>($info, $v))
        }
    } catch (e: Exception) {
        ()
    }

    return quote(
        private $varDeclKeyWord $identTokenAssociated: $OBSERVED_PROPERTY<$valType> $initValue
        $propDecl
    )
}

func getAppStorageAttrByIdent(identTok: String) {
    stateManageHandler.appStorageVarAttrInfo.get(identTok)
        .getOrThrow({
            => NoneValueException("AppStorage: can not found value by key: ${identTok}")
        })
}

func getLocalStorageAttrByIdent(identTok: String) {
    stateManageHandler.localStorageVarAttrInfo.get(identTok)
        .getOrThrow({
            => NoneValueException("LocalStorage: can not found value by key: ${identTok}")
        })
}

func genPropDecl(varDecl: VarDecl, stateKind: StateKind): Tokens {
    let varDeclModifiers = varDecl.modifiers
    let varDeclKeyWord = varDecl.keyword
    var identTok: Token = varDecl.identifier
    var identTokStr: String = identTok.value
    var identTokenAssociated: Token = generateAssociatedToken(identTokStr)
    var valType = varDecl.getTypeByInitializer()

    var setBody = Tokens()

    setBody = setBody + quote(
        this.$identTokenAssociated.set(v)
    )

    var modifier = quote(private)

    match (stateKind) {
        case PublishTy => modifier = quote($varDeclModifiers)
        case _ => ()
    }

    var setFunc = match (stateKind) {
        case AppStoragePropTy => Tokens()
        case LocalStoragePropTy => Tokens()
        case LocalStoragePropInterOpTy => Tokens()
        case _ => quote(
            set(v) {
                $setBody
            }
        )
    }

    if (varDeclKeyWord.value == "var") {
        quote(
            $modifier mut prop $identTok: $valType
            {
                get() {
                    return this.$identTokenAssociated.get()
                }
                $setFunc
            }
        )
    } else {
        quote(
            $modifier prop $identTok: $valType
            {
                get() {
                    return this.$identTokenAssociated.get()
                }
                $setFunc
            }
        )
    }
}

func mangle(name: String): String {
    "stateVarDecl_" + name + "_"
}

func generateAssociatedToken(identTokStr: String): Token {
    Token(TokenKind.IDENTIFIER, mangle(identTokStr))
}

func checkStorageAttr(input: Expr): Unit {
    if (!isLiteral(input) || !isStringType(input)) {
        diag.fatal(quote($input), "invalid type, attribute must be a string literal.")
    }
}

func isLiteral(expr: Expr): Bool {
    return expr is LitConstExpr
}

func isStringType(expr: Expr): Bool {
    return match (expr) {
        case v: LitConstExpr where v.literal.kind == TokenKind.STRING_LITERAL => true
        case _ => false
    }
}

func checkStateKindAndInit(input: Tokens, stateKind: StateKind): Unit {
    let decl = parseDecl(input)
    if (!(decl is VarDecl)) {
        diag.fatal(input, "${stateKind} can only modify varDecl.")
    }

    let varDecl = (decl as VarDecl).getOrThrow()

    match (stateKind) {
        case PublishTy => return ()
        case _ => ()
    }

    if (needInitializer(stateKind)) {
        try {
            varDecl.expr
        } catch (e: Exception) {
            diag.fatal(input, "You should have an initial value for ${stateKind}.")
        }
    } else {
        try {
            varDecl.expr
            diag.fatal(input, "${stateKind} declaration should not have an initial value.")
        } catch (e: Exception) {
            ()
        }
    }
}

func unSupportedException(): Unit {
    throw IllegalArgumentException(
        "State type only support `String`, numeral type, `Bool`, `Char`, `Array<T>` and class type."
            + "If it is a class type, the class should be modified by @Observed when defined.")
}

class ComponentVarDeclVisitor <: Visitor {
    var varDecls: ArrayList<VarDecl> = ArrayList<VarDecl>()

    protected func visit(classDecl: ClassDecl): Unit {
        for (decl in classDecl.body.decls) {
            match (decl) {
                case v: PrimaryCtorDecl => diag.error(quote($decl),
                    "primary constructor is not allowed in @Component class.")
                case funcDecl: FuncDecl =>
                    if (funcDecl.identifier.value == "init") {
                        diag.error(quote($decl), "init constructor is not allowed in @Component class.")
                    }
                case varDecl: VarDecl => varDecls.add(varDecl)
                case _ => breakTraverse()
            }
            breakTraverse()
        }
    }
}

func getVarDecls(classDecl: ClassDecl): ArrayList<VarDecl> {
    let visitor = ComponentVarDeclVisitor()
    classDecl.traverse(visitor)
    return visitor.varDecls
}

func joinListToTokens(buffer: ArrayList<Tokens>, gap: Tokens): Tokens {
    if (buffer.isEmpty()) {
        return Tokens()
    }
    var ret = Tokens()
    let size = buffer.size - 1
    for (item in buffer.slice(0..size)) {
        ret = ret + item + gap
    }
    ret = ret + buffer[size]
    return ret
}

func isLocalStorageInterOp(attr: Tokens): Bool {
    return !(attr.size == 1)
}

func checkLocalStorageInterOpAttr(attr: Tokens): Unit {
    var e: Expr
    var p: Int64
    (e, p) = parseExprFragment(attr)
    if (!isLiteral(e) || !isStringType(e) || attr[p].kind != TokenKind.COMMA || attr[p + 1].value != "InterOp") {
        diag.fatal(quote($attr), "attribute invalid, must be like [\"name\", \"InterOp\"].")
    }
}
