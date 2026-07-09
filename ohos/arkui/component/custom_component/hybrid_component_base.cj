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
import ohos.base.{launch, ReuseParams}
import ohos.labels.{APILevel, Hide}
import std.collection.{HashMap, ArrayList, HashSet}

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
    private let entriesById_ = HashMap<Int64, CustomView>()
    private let registeredReuseComponents_ = HashSet<Int64>()
    private var jsContext_: ?JSContext = None

    func saveJSContext(ctx: JSContext): Unit {
        jsContext_ = ctx
    }

    private func getJSContext(): JSContext {
        return jsContext_.getOrThrow()
    }

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
        entriesById_.add(cjPage.id(), cjPage)
        registerReuseHandles(name, cjPage)
    }

    /**
     * Register _getId / _unloadById / _reuse / _recycle under globalThis.__cj_hybrid__.
     */
    private func registerReuseHandles(name: String, cjPage: CustomView): Unit {
        let pageId = cjPage.id()
        if (registeredReuseComponents_.contains(pageId)) {
            return
        }
        registeredReuseComponents_.add(pageId)

        let ctx = getJSContext()
        let nsObj = getOrCreateNamespace(ctx)

        // _getId: returns this instance's pageId
        nsObj[name + "_getId"] = ctx.function({ ctx: JSContext, _: JSCallInfo =>
            pageId.toJSValue(ctx)
        }).toJSValue()

        // _unloadById: removeHybridPageById(id)
        nsObj[name + "_unloadById"] = ctx.function({ ctx: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 0) {
                let id = Int64(callInfo[0].toNumber())
                removeHybridPageById(id)
            }
            ctx.undefined().toJSValue()
        }).toJSValue()

        // _reuse: reuseHybridPage(id, ReuseParams)
        nsObj[name + "_reuse"] = ctx.function({ ctx: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 0) {
                let id = Int64(callInfo[0].toNumber())
                if (callInfo.count > 1 && callInfo[1].typeof() == JSType.OBJECT) {
                    let paramsObj = callInfo[1].asObject()
                    let rp = buildReuseParamsFromJSObject(ctx, paramsObj)
                    reuseHybridPage(id, rp)
                } else {
                    Hilog.warn(0, "CJPageEntry", "reuse: parameter missing or not object, reuse with empty ReuseParams")
                    reuseHybridPage(id, ReuseParams([]))
                }
            }
            ctx.undefined().toJSValue()
        }).toJSValue()

        // _recycle: recycleHybridPage(id)
        nsObj[name + "_recycle"] = ctx.function({ ctx: JSContext, callInfo: JSCallInfo =>
            if (callInfo.count > 0) {
                let id = Int64(callInfo[0].toNumber())
                recycleHybridPage(id)
            }
            ctx.undefined().toJSValue()
        }).toJSValue()
    }

    private func getOrCreateNamespace(ctx: JSContext): JSObject {
        let globalObj = ctx.global
        let nsVal = globalObj["__cj_hybrid__"]
        if (nsVal.typeof() == JSType.OBJECT) {
            return nsVal.asObject()
        }
        let nsObj = ctx.object()
        globalObj["__cj_hybrid__"] = nsObj.toJSValue()
        return nsObj
    }

    private func buildReuseParamsFromJSObject(ctx: JSContext, paramsObj: JSObject): ReuseParams {
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

    func removeHybridPageById(id: Int64): Unit {
        match (entriesById_.remove(id)) {
            case Some(page) =>
                for ((name, p) in entries_) {
                    if (p.id() == id) {
                        entries_.remove(name)
                        break
                    }
                }
            case None => ()
        }
    }

    func recycleHybridPage(id: Int64): Unit {
        match (entriesById_.get(id)) {
            case Some(page) =>
                page.hasBeenRecycled_ = true
                page.aboutToRecycleInternal()
            case None => ()
        }
    }

    func reuseHybridPage(id: Int64, params: ReuseParams): Unit {
        match (entriesById_.get(id)) {
            case Some(page) =>
                page.hasBeenRecycled_ = false
                page.aboutToReuseInternal(params)
            case None => ()
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
            CJPageEntry.getInstance().saveJSContext(context)
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
}
