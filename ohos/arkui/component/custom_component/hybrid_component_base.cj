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

package ohos.arkui.component.custom_component

import ohos.hilog.{Hilog}
import ohos.ark_interop.{SharedObject, JSContext, JSCallInfo, JSModule, JSObject, JSType, JSInteropType}
import ohos.business_exception.BusinessException
import std.collection.{HashMap, ArrayList}
import ohos.base.{launch, ReuseParams}
import ohos.labels.{APILevel, Hide}
import ohos.arkui.state_management.{ViewStackProcessor}

/**
 * CJPageEntry for register hybrid component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public class CJPageEntry {
    init() {}
    private static let INSTANCE_ = CJPageEntry()
    /**
     * Get CJPageEntry instance.
     *
     * @return { CJPageEntry }.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func getInstance(): CJPageEntry {
        return INSTANCE_
    }

    private let entries_ = HashMap<String, CustomView>()

    /**
     * Register hybrid component.
     *
     * @param { String } name.
     * @param { CustomView } cjPage.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func registerHybridPage(name: String, cjPage: CustomView): Unit {
        entries_.add(name, cjPage)
    }

    /**
     * Remove hybrid component.
     *
     * @param { String } name.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func removeHybridPage(name: String): Unit {
        entries_.remove(name)
    }

    protected func forceRerenderByName(name: String): Unit {
        if (entries_.contains(name)) {
            entries_[name].forceCompleteRerender(true)
        } else {
            Hilog.info(0, "cangjieCJPageEntryPage", "find func by ${name} failed.")
        }
    }

    protected func forceRerenderAllEntry(): Unit {
        for (page in entries_.values()) {
            launch {
                page.forceCompleteRerender(true)
            }
        }
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func removeHybridPageById(id: Int64): Unit {
        for ((name, page) in entries_) {
            if (page.id() == id) {
                entries_.remove(name)
                return
            }
        }
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func recycleHybridPage(id: Int64, compName: String): Unit {
        for ((_, page) in entries_) {
            if (page.id() == id) {
                page.hasBeenRecycled_ = true
                page.aboutToRecycleInternal()
                return
            }
        }
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func reuseHybridPage(id: Int64, compName: String, params: ReuseParams): Unit {
        for ((_, page) in entries_) {
            if (page.id() == id) {
                page.hasBeenRecycled_ = false
                page.aboutToReuseInternal(params)
                return
            }
        }
    }
}

/**
 * Base class for hybrid component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public open class HybridComponentBase <: SharedObject {
    static func registerLoadHandle(handleName: String, handle: () -> CPointer<Unit>) {
        let hd = {
            context: JSContext, _: JSCallInfo =>
            Hilog.info(0, "cangjiePage", "registerLoadHandle start handleName: ${handleName}")
            let handlePointer = unsafe { handle() }
            let buffer = LibC.malloc<CPointer<Unit>>(count: 1)
            if (buffer.isNull()) {
                unsafe { LibC.free(handlePointer) }
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            unsafe {
                buffer.write(handlePointer)
            }
            let a = unsafe {
                context.arrayBuffer(CPointer<UInt8>(buffer), 8, {
                    _ => LibC.free(buffer)
                })
            }
            return a.toJSValue()
        }
        JSModule.registerFunc(handleName, hd)
    }

    static func registerUnloadHandle(handleName: String, handle: () -> Unit) {
        let hd = {context: JSContext, _: JSCallInfo =>
            Hilog.warn(0, "cangjiePage", "registerUnloadHandle start handleName: ${handleName}")
            unsafe { handle() }

            let result = context.undefined().toJSValue()
            return result
        }
        JSModule.registerFunc(handleName, hd)
    }

    /**
     * Register hybrid component.
     *
     * @param { String } compName.
     * @param { () -> CPointer<Unit> } loadHandle.
     * @param { () -> Unit } unloadHandle.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func registerHybridComponent(compName: String, loadHandle: () -> CPointer<Unit>,
        unloadHandle: () -> Unit): Unit {
        registerLoadHandle(compName + "_load", loadHandle)
        registerUnloadHandle(compName + "_unload", unloadHandle)
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func registerHybridComponentV2(compName: String, loadHandle: () -> Int64,
        unloadHandle: (Int64) -> Unit): Unit {
        registerLoadHandleV2(compName + "_load", loadHandle)
        registerUnloadHandleV2(compName + "_unload", unloadHandle)
    }

    static func registerLoadHandleV2(handleName: String, handle: () -> Int64) {
        let hd = {context: JSContext, _: JSCallInfo =>
            let id = unsafe { handle() }
            return Float64(id).toJSValue(context)
        }
        JSModule.registerFunc(handleName, hd)
    }

    static func registerUnloadHandleV2(handleName: String, handle: (Int64) -> Unit) {
        let hd = {context: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 0) {
                let id = Int64(callInfo[0].toNumber())
                unsafe { handle(id) }
            }
            return context.undefined().toJSValue()
        }
        JSModule.registerFunc(handleName, hd)
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func registerReuseHandle(handleName: String, handle: (Int64, ReuseParams) -> Unit): Unit {
        let hd = {context: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 1) {
                let id = Int64(callInfo[0].toNumber())
                let paramsObj = callInfo[1].asObject()
                let rp = buildReuseParamsFromJSObject(context, paramsObj)
                unsafe { handle(id, rp) }
            }
            return context.undefined().toJSValue()
        }
        JSModule.registerFunc(handleName, hd)
    }

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func registerRecycleHandle(handleName: String, handle: (Int64) -> Unit): Unit {
        let hd = {context: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 0) {
                let id = Int64(callInfo[0].toNumber())
                unsafe { handle(id) }
            }
            return context.undefined().toJSValue()
        }
        JSModule.registerFunc(handleName, hd)
    }

    private static func buildReuseParamsFromJSObject(ctx: JSContext, paramsObj: JSObject): ReuseParams {
        let keys = paramsObj.keys()
        var pairs = ArrayList<(String, Any)>()
        for (key in keys) {
            let jsVal = paramsObj[key]
            let ty = jsVal.typeof()
            if (ty == JSType.NUMBER) {
                pairs.add((key, Float64.fromJSValue(ctx, jsVal)))
            } else if (ty == JSType.STRING) {
                pairs.add((key, String.fromJSValue(ctx, jsVal)))
            } else if (ty == JSType.BOOLEAN) {
                pairs.add((key, Bool.fromJSValue(ctx, jsVal)))
            } else {
                pairs.add((key, jsVal))
            }
        }
        return ReuseParams(pairs.toArray())
    }
}
