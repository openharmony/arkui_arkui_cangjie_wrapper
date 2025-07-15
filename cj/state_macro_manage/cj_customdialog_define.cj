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
import std.unicode.*
import std.unicode.*
import std.regex.*

public macro CustomDialog(input: Tokens): Tokens {
    checkCustomDialogSyntax(input)
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let classModifier = classDecl.modifiers
    let classKeyWord = classDecl.keyword
    let classIdent = classDecl.identifier
    let classBody = classDecl.body

    let classBodyAfterExpand = handleClassBody(classBody.decls)
    let initFunc = generateInitFunc(classDecl)
    let aboutTbDeleteFunc = generateAboutToBeDelete(classDecl)
    let updateParamFunc = generateUpdateParam(classDecl)
    let rerenderFunc = handleRerender()
    let purgeVariableFunc = handlePurgeVariable(classDecl)
    let setDialogControllerFunc = handleSetDialogControllerFunc()

    // record state with component and state kind
    stateManageHandler.compWithStateInfo.add(classIdent.value, stateManageHandler.stateInformation.clone())

    // reset global var declaration in macro
    stateManageHandler.clearGlobalInComponent()

    // emit all error in component
    diag.emit()

    // generate class after expand.
    createClassDeclaration(
        modifiers: quote($classModifier),
        identifier: quote($classIdent),
        superTypes: quote($CUSTOM_VIEW),
        body: quote(
            $classBodyAfterExpand
            $initFunc
            $aboutTbDeleteFunc
            $updateParamFunc
            $rerenderFunc
            $purgeVariableFunc
            $setDialogControllerFunc
        )
    )
}

class CustomDialogVarVisitor <: Visitor {
    var hasController = false
    protected func visit(varDecl: VarDecl): Unit {
        match (varDecl) {
            case varDecl: VarDecl where isNeeadGenerateCustomDialogOption(varDecl) =>
                stateManageHandler.customDialogControllerVarName = varDecl.identifier.value
                hasController = true
                breakTraverse()
            case _ => ()
        }
        breakTraverse()
        return
    }
}

func checkCustomDialogController(classDecl: ClassDecl) {
    let visitor = CustomDialogVarVisitor()
    classDecl.traverse(visitor)
    if (!visitor.hasController) {
        diag.error(quote($classDecl),
            "CustomDialog class must contain a property of the Option<CustomDialogController> type.")
    }
}

func handleSetDialogControllerFunc(): Tokens {
    let varName = Token(TokenKind.IDENTIFIER, stateManageHandler.customDialogControllerVarName)
    return quote(
        public func setController(value: CustomDialogController) {
            this.$varName = value
        }
    )
}

func checkCustomDialogSyntax(input: Tokens) {
    let decl = parseDecl(input)
    let classDecl = match (decl as ClassDecl) {
        case Some(v) => v
        case None => throw IllegalArgumentException("Only class is supported in @CustomDialog.")
    }
    checkInitFunc(classDecl)
    if (classDecl.superTypes.size > 0) {
        diag.error(input, "CustomDialog class should not inherit other class or interface.")
    }
    checkCustomDialogController(classDecl)
}

func isCustomdialogController(typeName: String): Bool {
    let regexString = ##"^(CustomDialogController|ObservedProperty\s<\sCustomDialogController\s>)$"##
    let regex = Regex(regexString)
    match (regex.find(typeName)) {
        case None => return false
        case _ => return true
    }
}

func isCustomdialogControllerOption(typeName: String): Bool {
    let regexString = ##"^(Option\s<\sCustomDialogController\s>|ObservedProperty\s<\sOption\s<\sCustomDialogController\s>\s>)$"##
    let regex = Regex(regexString)
    match (regex.find(typeName)) {
        case None => return false
        case _ => return true
    }
}

func isNeeadGenerateCustomDialogOption(varDecl: VarDecl): Bool {
    try {
        return isCustomdialogControllerOption(varDecl.declType.toTokens().toString().trim())
    } catch (e: Exception) {
        return false
    }
}

func isNeeadGenerateCustomDialog(varDecl: VarDecl): Bool {
    try {
        return isCustomdialogController(varDecl.declType.toTokens().toString().trim())
    } catch (e: Exception) {
        return false
    }
}
