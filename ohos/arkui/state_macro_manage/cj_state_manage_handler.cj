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

import std.collection.*
import std.ast.*

class StateManageHandler {
    /*
     * record state with component and state kind
     * key is component name, and value is a hashMap of declarations with state kind in the component.
     * examples:
     * [(componentName, stateInformation)*]
     * stateInformation:
     * [(varDeclName, stateKind*varDecl)*]
     */
    var compWithStateInfo: HashMap<String, HashMap<String, (VariableKind, VarDecl)>> = HashMap<String, HashMap<String, (VariableKind, 
            VarDecl)>>()
    var stateInformation: HashMap<String, (VariableKind, VarDecl)> = HashMap<String, (VariableKind, VarDecl)>()

    /*
     * record publish variables with Observed name
     * key is observed class name, and value is a hashMap of declarations in the observed class.
     * examples:
     * [(observedName, publishInformation)*]
     * publishInformation:
     * [(varDeclName, varDecl)*]
     */
    var observedWithPublishInfo: HashMap<String, HashMap<String, VarDecl>> = HashMap<String, HashMap<String, VarDecl>>()
    var publishInformation: HashMap<String, VarDecl> = HashMap<String, VarDecl>()

    /**
     * record attribute and value map
     * key is varDeclName, value is attrName
     * example:
     * @StorageLink["test"] var a: Int64 = 20
     * varDeclName: stateVarDecl_a_
     * attrName: test
     */
    var appStorageVarAttrInfo: HashMap<String, String> = HashMap<String, String>()

    /**
     * record attribute and value map
     * key is varDeclName, value is attrName
     * example:
     * @LocalStorageLink["test"] var a: Int64 = 20
     * varDeclName: stateVarDecl_a_
     * attrName: test
     */
    var localStorageVarAttrInfo: HashMap<String, String> = HashMap<String, String>()

    /**
     * record attribute and type map
     * key is attrName, value is type
     * example:
     * @StorageLink["test"] var a: Int64 = 20
     * attrName: test
     * type: Int64
     */
    var appStorageAttrTypeInfo: HashMap<String, String> = HashMap<String, String>()

    /**
     * record attribute and type map
     * key is attrName, value is type
     * example:
     * @LocalStorageLink["test"] var a: Int64 = 20
     * attrName: test
     * type: Int64
     */
    var localStorageAttrTypeInfo: HashMap<String, String> = HashMap<String, String>()

    /**
     * record CustomDialogController and builder
     * key is varName, value is builder
     * example:
     * var dialogController : CustomDialogController = CustomDialogController ( CustomDialogControllerOptions ( MyDialog() ) )
     * varName: dialogController
     * builder: MyDialog
     */
    var customDialogInfo: ArrayList<(Token, CallExpr)> = ArrayList<(Token, CallExpr)>()

    func isInMacroComponents(str: String): Bool {
        return compWithStateInfo.keys().contains(str)
    }

    private init() {}

    private static let instance = StateManageHandler()

    static func getInstance() {
        return instance
    }

    // Component id, each Component has an unique id.
    var uuid = 1

    // Entry id, each is unique
    var entryId = 0

    // CustomDialogController var name, for expend setController func of @CustomDialog
    var customDialogControllerVarName: String = ""

    // Record builder function name and if the builder function has single component.
    let builderSingleInfo: HashSet<String> = HashSet<String>()
    let builderParamInfo: HashSet<String> = HashSet<String>()

    func isContainerComponent(value: String): Bool {
        if (CONTAINER_EXPAND_COMPONENTS.contains(value)) {
            return true
        }
        return false
    }

    func isInBuilderComponents(str: String): Bool {
        if (builderSingleInfo.contains(str)) {
            return true
        }
        return false
    }

    func isInBuilderParams(str: String): Bool {
        if (builderParamInfo.contains(str)) {
            return true
        }
        return false
    }

    var watchDeclare = ArrayList<(Tokens, Tokens, Tokens)>()

    let consumeVarDeclsMap = HashMap<String, String>()
    let provideVarDeclsMap = HashMap<String, String>()

    public func clearGlobalInComponent() {
        watchDeclare.clear()
        stateInformation.clear()
        builderSingleInfo.clear()
        builderParamInfo.clear()
        consumeVarDeclsMap.clear()
        provideVarDeclsMap.clear()
        customDialogInfo.clear()
    }

    public let entryFileId = HashSet<UInt32>()
}

let stateManageHandler = StateManageHandler.getInstance()
