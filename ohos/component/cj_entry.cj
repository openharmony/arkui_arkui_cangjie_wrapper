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

package ohos.component

/**
 * CJEntry is a singleton class, it provides global functions to be accessed by native.
 *
 *  current usages:
 *   1. pass all cj @C functions to native.
 *   2. keep the application entry registered by application developer, and provide them to native
 *   3. provide native methods to control lifecycle of FFIData objects
 *   4. provide native method to throw CJ error
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CJEntry {
    /**
     * used to compare local api version with native api version, different version may occur error.
     */
    static let VERSION: Int64 = 10000
    private static let instance_ = CJEntry()
    public static func getInstance(): CJEntry {
        return instance_
    }

    private let entries_ = HashMap<String, () -> Bool>()
    public func registerEntry(name: String, call: () -> Bool): Unit {
        entries_.add(name, call)
    }

    func initialize(_: Int16, version: Int64, packagePtr: CPointer<AtCPackage>): Bool {
        if (version != VERSION) {
            AceLog.info(
                "cj entry initialize fail, version not match, required '" + VERSION.toString() + "' yet get ''" +
                    version.toString() + "'")
            return false
        }
        unsafe {
            packagePtr.write(AtCPackage())
        }
        return true
    }

    func loadEntry(name: String): Bool {
        let optEntry = entries_.get(name)
        match (optEntry) {
            case None =>
                AceLog.error("LoadEntry fail, no such entry: " + name)
                false
            case Some(entryFunc) => entryFunc()
        }
    }
}

/**
 * AtCPackage holds all the @C functions defined by framework, that would be passed to native when initialize CJEntry.
 *
 *  when native side call cj @C functions, native must have the address of the cj function, the brutal way is using
 *  dlsym to find the address by function name, that is not convenient and not effective. so we packed all @C functions
 *  and pass them to native, then native can visit those functions both conveniently and effectively.
 */
@C
struct AtCPackage {
    let cjEntryInitialize: CFunc<(CPointer<OHOSAceFrameworkCJInstanceInitializeParams>) -> Int64> = OHOSAceFrameworkCJInstanceInitialize
    let cjEntryLoadEntry: CFunc<(CPointer<OHOSAceFrameworkCJInstanceLoadEntryParams>) -> Int64> = OHOSAceFrameworkCJInstanceLoadEntry
    let remoteViewRender: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewRender
    let remoteViewRerender: CFunc<(Int64) -> Unit> = OHOSAceFrameworkRemoteViewRerender
    let remoteViewRelease: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewRelease
    let remoteViewOnAppear: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnAppear
    let remoteViewOnShow: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnShow
    let remoteViewOnHide: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnHide
    let remoteViewOnBackPress: CFunc<(Int64) -> Bool> = OHOSAceFrameworkRemoteViewOnBackPress
    let remoteViewUpdateWithJson: CFunc<(Int64, CString) -> Unit> = OHOSAceFrameworkRemoteViewUpdateWithJson
    let remoteViewOnTransition: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnTransition
    let remoteViewOnAboutToRender: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnAboutToRender
    let remoteViewOnAfterRender: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnAfterRender
    let remoteViewOnDisappear: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnDisappear
    let remoteViewOnAboutToBeDeleted: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnAboutToBeDeleted
    let remoteViewForceCompleteRerender: CFunc<(Int64, Bool) -> Unit> = OHOSAceFrameworkRemoteViewForceCompleteRerender
    let lazyForEachFuncsGenerateKey: CFunc<(Int64, Int64) -> ExternalString> = OHOSAceFrameworkLazyForEachFuncsGenerateKey
    let lazyForEachFuncsGenerateItem: CFunc<(Int64, Int64) -> Int64> = OHOSAceFrameworkLazyForEachFuncsGenerateItem
    let lazyForEachFuncsGetTotalCount: CFunc<(Int64) -> Int64> = OHOSAceFrameworkLazyForEachFuncsGetTotalCount
    let lazyForEachFuncsMarkLazy: CFunc<(Int64, CString) -> Unit> = OHOSAceFrameworkLazyForEachFuncsMarkLazy
    let lazyForEachFuncsResetLazy: CFunc<(Int64) -> Unit> = OHOSAceFrameworkLazyForEachFuncsResetLazy
    let lazyForEachFuncsRemoveChildGroup: CFunc<(Int64, CString) -> Unit> = OHOSAceFrameworkLazyForEachFuncsRemoveChildGroup
    let lazyForEachFuncsDataChangeListenerRegister: CFunc<(Int64, Int64) -> Int64> = OHOSAceFrameworkLazyForEachFuncsDataChangeListenerRegister
    let lazyForEachFuncsDataChangeListenerUnregister: CFunc<(Int64, Int64) -> Int64> = OHOSAceFrameworkLazyForEachFuncsDataChangeListenerUnregister
}

@C
struct AtCPackageV2 {
    var remoteViewOnDidBuild: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewOnDidBuild
    var remoteViewAboutToReuse: CFunc<(Int64, CString) -> Int64> = OHOSAceFrameworkRemoteViewAboutToReuse
    var remoteViewAboutToRecycle: CFunc<(Int64) -> Int64> = OHOSAceFrameworkRemoteViewAboutToRecycle
    var remoteViewRecycleSelf: CFunc<(Int64, CString) -> Int64> = OHOSAceFrameworkRemoteViewRecycleSelf
}

@C
struct OHOSAceFrameworkCJInstanceInitializeParams {
    OHOSAceFrameworkCJInstanceInitializeParams(
        let runtimeId: Int16,
        let version: Int64,
        let funcs: CPointer<AtCPackage>,
        let result: CPointer<Bool>
    ) {}
}

@C
struct OHOSAceFrameworkCJInstanceLoadEntryParams {
    OHOSAceFrameworkCJInstanceLoadEntryParams(
        let name: CString,
        let result: CPointer<Bool>
    ) {}
}

@C
struct OHOSAceFrameworkCJInstanceExistParams {
    OHOSAceFrameworkCJInstanceExistParams(
        let id: Int64,
        let result: CPointer<Bool>
    ) {}
}

@C
func OHOSAceFrameworkCJInstanceInitialize(paramsPtr: CPointer<OHOSAceFrameworkCJInstanceInitializeParams>): Int64 {
    unsafe {
        let params = paramsPtr.read()
        params.result.write(CJEntry.getInstance().initialize(params.runtimeId, params.version, params.funcs))
    }
    0
}

@C
func OHOSAceFrameworkCJInstanceLoadEntry(paramsPtr: CPointer<OHOSAceFrameworkCJInstanceLoadEntryParams>): Int64 {
    unsafe {
        let params = paramsPtr.read()
        params.result.write(CJEntry.getInstance().loadEntry(params.name.toString()))
    }
    0
}

foreign func FfiOHOSAceFrameworkRegisterCJFuncs(cjFuncs: AtCPackage): Unit

foreign func FfiOHOSAceFrameworkRegisterCJFuncsV2(cjFuncs: CFunc<(CPointer<AtCPackageV2>) -> Unit>): Unit

func injectFrameworkCJFuncs(): Unit {
    unsafe {
        FfiOHOSAceFrameworkRegisterCJFuncs(AtCPackage())
        let wrapper: CFunc<(CPointer<AtCPackageV2>) -> Unit> = {
            val: CPointer<AtCPackageV2> =>
            if (val.isNull()) {
                throw NoneValueException("AtCPackageV2 is null.")
            }
            var cpkg: AtCPackageV2 = val.read()
            cpkg.remoteViewOnDidBuild = OHOSAceFrameworkRemoteViewOnDidBuild
            cpkg.remoteViewAboutToReuse = OHOSAceFrameworkRemoteViewAboutToReuse
            cpkg.remoteViewAboutToRecycle = OHOSAceFrameworkRemoteViewAboutToRecycle
            cpkg.remoteViewRecycleSelf = OHOSAceFrameworkRemoteViewRecycleSelf
            val.write(cpkg)
        }
        FfiOHOSAceFrameworkRegisterCJFuncsV2(wrapper)
    }
}

let INJECT_FRAMEWORK_CJ_FUNCS_RESULT_ = injectFrameworkCJFuncs()
