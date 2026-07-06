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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

macro package ohos.arkui.state_macro_manage

import std.ast.{Tokens, Argument, Token, ASTException, VarDecl, Expr, LitConstExpr, ClassDecl, PrimaryCtorDecl, FuncDecl, TokenKind, ToTokens, parseDecl, Visitor}
import std.collection.{ArrayList}
// re-export HashMap for macro-generated code (public static var __REUSE_PARAMS__)
public import std.collection.{HashMap}

/**
 * record state and init declaration
 * example:
 * @LocalStorageLink["test"] var a: Int64 = 20
 * Tokens1: stateVarDecl_a_
 * Tokens2: this.getLocalStorage().setAndLink < Int64 >("Count", 0)...
 */
var localStorageStateInfo: ArrayList<(Tokens, Tokens)> = ArrayList([])

func generateNewId(): Int64 {
    let ret = STATE_MANAGE_HANDLER.uuid
    STATE_MANAGE_HANDLER.uuid++
    return ret
}

func generateNewEntryId(): Int64 {
    let ret = STATE_MANAGE_HANDLER.entryId
    STATE_MANAGE_HANDLER.entryId++
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

    public func toString(): String {
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

    func getDecorator(): String {
        match (this) {
            case StateTy => "@State"
            case LinkTy => "@Link"
            case PropTy => "@Prop"
            case ProvideTy => "@Provide"
            case ConsumeTy => "@Consume"
            case PublishTy => "@Publish"
            case AppStorageLinkTy => "@StorageLink"
            case AppStoragePropTy => "@StorageProp"
            case LocalStorageLinkTy => "@LocalStorageLink"
            case LocalStoragePropTy => "@LocalStorageProp"
            case LocalStorageLinkInterOpTy => "@LocalStorageLink"
            case LocalStoragePropInterOpTy => "@LocalStorageProp"
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

    func getDecorator(): String {
        match (this) {
            case StateTy => "@State"
            case LinkTy => "@Link"
            case PropTy => "@Prop"
            case ProvideTy => "@Provide"
            case ConsumeTy => "@Consume"
            case AppStorageLinkTy => "@StorageLink"
            case AppStoragePropTy => "@StorageProp"
            case LocalStorageLinkTy => "@LocalStorageLink"
            case LocalStoragePropTy => "@LocalStorageProp"
            case LocalStorageLinkInterOpTy => "@LocalStorageLink"
            case LocalStoragePropInterOpTy => "@LocalStorageProp"
            case CommonTy => ""
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
        DIAG.error(quote($varDecl),
            "The variables modified by status macros such as @State, @Link, etc," +
                "should not have modifiers like public, private, protected and static.")
    }
    let varDeclKeyWord = varDecl.keyword

    let identTok: Token = varDecl.identifier
    let identTokStr: String = identTok.value
    let identTokenAssociated: Token = generateMangledToken(identTokStr)
    let valType = varDecl.getTypeByInitializer()

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
    STATE_MANAGE_HANDLER.appStorageVarAttrInfo.get(identTok)
        .getOrThrow({
            => NoneValueException("AppStorage: can not found value by key: ${identTok}")
        })
}

func getLocalStorageAttrByIdent(identTok: String) {
    STATE_MANAGE_HANDLER.localStorageVarAttrInfo.get(identTok)
        .getOrThrow({
            => NoneValueException("LocalStorage: can not found value by key: ${identTok}")
        })
}

func genPropDecl(varDecl: VarDecl, stateKind: StateKind): Tokens {
    var identTok: Token = varDecl.identifier
    var identTokStr: String = identTok.value
    var identTokenAssociated: Token = generateMangledToken(identTokStr)
    var valType = varDecl.getTypeByInitializer()

    var setBody = Tokens()

    setBody = setBody + quote(
        this.$identTokenAssociated.set(v)
    )

    var modifier = quote(private)

    let varDeclModifiers = varDecl.modifiers
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

    let varDeclKeyWord = varDecl.keyword
    if (varDeclKeyWord.value == "var") {
        quote(
            $modifier mut prop $identTok: $valType
            {
                get() {
                    this.$identTokenAssociated.get()
                }
                $setFunc
            }
        )
    } else {
        quote(
            $modifier prop $identTok: $valType
            {
                get() {
                    this.$identTokenAssociated.get()
                }
                $setFunc
            }
        )
    }
}

func mangle(name: String): String {
    "stateVarDecl_" + name + "_"
}

/**
 * Compile-time record of a single property declaration's profiler metadata.
 * Each @Component/@Observed var decl produces one entry during macro expansion.
 * The collected entries are consumed by generateStaticProfilerArrays
 * that std.reflect reads at runtime to populate the profiler metadata registry.
 *
 * Fields:
 *   mangledKey       — Internal mangled identifier (e.g. "stateVarDecl_message_").
 *                      Used as the lookup key in fieldMetaMap at runtime.
 *   decorator        — Decorator label (e.g. "@State", "@Link", "@Prop", "@Publish").
 *                      Stored in __PROFILER_DECS__ and used as the default decorator
 *                      in collectProfilerBindings when no override is registered.
 *   fieldName        — Original variable name from user source (e.g. "message").
 *                      Stored in __PROFILER_FNAMES__ and reported as "propertyName"
 *                      in the profiler JSON output.
 *   overrideDecorator — Non-empty when the decorator should override the default
 *                      at runtime (e.g. "@Link" or "@Consume" vs. self-decorator).
 *                      Stored in __PROFILER_OVERRIDE_DECS__ and consumed by
 *                      registerComponentOverrides → profilerRegisterDecoratorOverride.
 *   runtimeKey       — Alternate key for runtime lookup, typically the AppStorage /
 *                      LocalStorage key when it differs from the mangledKey.
 *                      Stored in __PROFILER_RUNTIME_KEYS__.
 */
struct ProfilerPropertyMetaInfo {
    let mangledKey: String
    let decorator: String
    let fieldName: String
    let overrideDecorator: String
    let runtimeKey: String

    init(mangledKey: String, decorator: String, fieldName: String, overrideDecorator: String, runtimeKey: String) {
        this.mangledKey = mangledKey
        this.decorator = decorator
        this.fieldName = fieldName
        this.overrideDecorator = overrideDecorator
        this.runtimeKey = runtimeKey
    }
}

private var currentComponentProfilerMetas = ArrayList<ProfilerPropertyMetaInfo>()
private var currentObservedProfilerMetas = ArrayList<ProfilerPropertyMetaInfo>()

func resetComponentProfilerMetas(): Unit {
    currentComponentProfilerMetas.clear()
}

/**
 * Append a profiler metadata entry to currentComponentProfilerMetas.
 * Called during macro expansion from var-init functions (varInitAssign,
 * generateStorageInit, generateLinkInit, generateConsumeInit).
 *
 * Example call site (varInitAssign in cj_generate_var_decl.cj):
 *   let info = mangle("message")  // "stateVarDecl_message_"
 *   addProfilerPropertyMeta(info, "@State", "message", "", info)
 *
 * For @Link the overrideDecorator is non-empty so the runtime can override
 * the default decorator during reporting:
 *   addProfilerPropertyMeta("stateVarDecl_message_", "@Link", "message", "@Link", "stateVarDecl_message_")
 */
func addProfilerPropertyMeta(mangledKey: String, decorator: String, fieldName: String, overrideDecorator: String, runtimeKey: String): Unit {
    currentComponentProfilerMetas.add(ProfilerPropertyMetaInfo(mangledKey, decorator, fieldName, overrideDecorator, runtimeKey))
}

/**
 * Convert a list of ProfilerPropertyMetaInfo into 5 parallel Token arrays
 * for embedding into the class body as static let declarations.
 * Uses append (not +) for macro-expansion performance.
 *
 * Input example:
 *   metas = [
 *     { mangledKey="stateVarDecl_message_", decorator="@State", fieldName="message", overrideDecorator="",  runtimeKey="stateVarDecl_message_" },
 *     { mangledKey="stateVarDecl_count_",   decorator="@Link",  fieldName="count",   overrideDecorator="@Link", runtimeKey="stateVarDecl_count_" },
 *   ]
 *
 * Output 5-tuple (each element is a token sequence):
 *   [0]: ["stateVarDecl_message_", "stateVarDecl_count_"]   // __PROFILER_KEYS__
 *   [1]: ["@State",                "@Link"]                 // __PROFILER_DECS__
 *   [2]: ["message",               "count"]                 // __PROFILER_FNAMES__
 *   [3]: ["",                      "@Link"]                 // __PROFILER_OVERRIDE_DECS__
 *   [4]: ["stateVarDecl_message_", "stateVarDecl_count_"]   // __PROFILER_RUNTIME_KEYS__
 */
func buildProfilerPropertyArrays(metas: ArrayList<ProfilerPropertyMetaInfo>): (Tokens, Tokens, Tokens, Tokens, Tokens) {
    var mangledKeysTok = Tokens()
    var decoratorsTok = Tokens()
    var fieldNamesTok = Tokens()
    var overrideDecsTok = Tokens()
    var runtimeKeysTok = Tokens()
    if (metas.isEmpty()) {
        return (mangledKeysTok, decoratorsTok, fieldNamesTok, overrideDecsTok, runtimeKeysTok)
    }
    let sep = quote(, ) + Token(TokenKind.NL)
    for (i in 0..metas.size) {
        if (i > 0) {
            mangledKeysTok.append(sep)
            decoratorsTok.append(sep)
            fieldNamesTok.append(sep)
            overrideDecsTok.append(sep)
            runtimeKeysTok.append(sep)
        }
        let meta = metas[i]
        mangledKeysTok.append(quote($(meta.mangledKey)))
        decoratorsTok.append(quote($(meta.decorator)))
        fieldNamesTok.append(quote($(meta.fieldName)))
        overrideDecsTok.append(quote($(meta.overrideDecorator)))
        runtimeKeysTok.append(quote($(meta.runtimeKey)))
    }
    (mangledKeysTok, decoratorsTok, fieldNamesTok, overrideDecsTok, runtimeKeysTok)
}

/**
 * Emit public static let array declarations into the class body from the
 * given profiler metadata list. Called for both @Component and @Observed.
 *
 * At runtime std.reflect.ClassTypeInfo.getStaticVariable(name) reads them.
 *
 * User source:
 *   @Component
 *   class Page {
 *       @State var message: String = "hello world"
 *   }
 *
 * Macro expands to insert into the class body:
 *   class Page {
 *       public static let __PROFILER_KEYS__:        Array<String> = ["stateVarDecl_message_"]
 *       public static let __PROFILER_DECS__:        Array<String> = ["@State"]
 *       public static let __PROFILER_FNAMES__:      Array<String> = ["message"]
 *       public static let __PROFILER_OVERRIDE_DECS__: Array<String> = [""]
 *       public static let __PROFILER_RUNTIME_KEYS__: Array<String> = ["stateVarDecl_message_"]
 *       // ... other members
 *   }
 */
func generateStaticProfilerArrays(metas: ArrayList<ProfilerPropertyMetaInfo>): Tokens {
    let arrays = buildProfilerPropertyArrays(metas)
    if (arrays[0].size == 0) {
        return Tokens()
    }
    return quote(
        public static let __PROFILER_KEYS__: Array<String> = [$(arrays[0])]
        public static let __PROFILER_DECS__: Array<String> = [$(arrays[1])]
        public static let __PROFILER_FNAMES__: Array<String> = [$(arrays[2])]
        public static let __PROFILER_OVERRIDE_DECS__: Array<String> = [$(arrays[3])]
        public static let __PROFILER_RUNTIME_KEYS__: Array<String> = [$(arrays[4])]
    )
}

func generateComponentStaticProfilerArrays(): Tokens {
    generateStaticProfilerArrays(currentComponentProfilerMetas)
}

func generateObservedStaticProfilerArrays(): Tokens {
    generateStaticProfilerArrays(currentObservedProfilerMetas)
}

func resetObservedProfilerMetas(): Unit {
    currentObservedProfilerMetas.clear()
}

func addObservedProfilerPropertyMeta(mangledKey: String, decorator: String, fieldName: String, runtimeKey: String): Unit {
    currentObservedProfilerMetas.add(ProfilerPropertyMetaInfo(mangledKey, decorator, fieldName, "", runtimeKey))
}

func generateMangledToken(identTokStr: String): Token {
    Token(TokenKind.IDENTIFIER, mangle(identTokStr))
}

func checkStorageAttr(input: Expr): Unit {
    if (!isLiteral(input) || !isStringType(input)) {
        DIAG.fatal(quote($input), "invalid type, attribute must be a string literal.")
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
        DIAG.fatal(input, "${stateKind} can only modify varDecl.")
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
            DIAG.fatal(input, "You should have an initial value for ${stateKind}.")
        }
    } else {
        try {
            varDecl.expr
            DIAG.fatal(input, "${stateKind} declaration should not have an initial value.")
        } catch (e: Exception) {
            ()
        }
    }
}

func unSupportedException(): Unit {
    throw IllegalArgumentException(
        "State type only support `String`, numeral type, `Bool`, `Char`, `Array<T>` and class type." +
            "If it is a class type, the class should be modified by @Observed when defined.")
}

class ComponentVarDeclVisitor <: Visitor {
    var varDecls: ArrayList<VarDecl> = ArrayList<VarDecl>()

    protected func visit(classDecl: ClassDecl): Unit {
        for (decl in classDecl.body.decls) {
            match (decl) {
                case v: PrimaryCtorDecl => DIAG.error(quote($decl),
                    "primary constructor is not allowed in @Component class.")
                case funcDecl: FuncDecl =>
                    if (funcDecl.identifier.value == "init") {
                        DIAG.error(quote($decl), "init constructor is not allowed in @Component class.")
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
