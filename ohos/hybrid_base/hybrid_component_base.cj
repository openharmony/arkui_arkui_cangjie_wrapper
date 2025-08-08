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

package ohos.hybrid_base

internal import ohos.hilog.*
internal import ohos.ark_interop.*
internal import ohos.component.*
internal import std.collection.HashMap
internal import ohos.concurrency.*

public class CJPageEntry {
    private static let instance_ = CJPageEntry()
    public static func getInstance(): CJPageEntry {
        return instance_
    }

    private let entries_ = HashMap<String, CustomView>()
    public func registerHybridPage(name: String, cjPage: CustomView): Unit {
        entries_.add(name, cjPage)
    }

    public func removeHybridPage(name: String): Unit {
        entries_.remove(name)
    }

    public func forceRerenderByName(name: String): Unit {
        if (entries_.contains(name)) {
            entries_[name].forceCompleteRerender(true)
        } else {
            Hilog.info(0, "cangjieCJPageEntryPage", "find func by ${name} failed.")
        }
    }

    public func forceRerenderAllEntry(): Unit {
        for (page in entries_.values()) {
            launch {
                page.forceCompleteRerender(true)
            }
        }
    }
}

public open class HybridComponentBase <: SharedObject {
    static func registerLoadHandle(handleName: String, handle: () -> CPointer<Unit>) {
        let hd = {
            context: JSContext, _: JSCallInfo =>
            Hilog.info(0, "cangjiePage", "registerLoadHandle start handleName: ${handleName}")
            let handlePointer = unsafe { handle() }
            let buffer = LibC.malloc<CPointer<Unit>>(count: 1)
            if (buffer.isNull()) {
                unsafe { LibC.free(handlePointer) }
                throw IllegalMemoryException("malloc memory")
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

    public static func registerHybridComponent(compName: String, loadHandle: () -> CPointer<Unit>,
        unloadHandle: () -> Unit) {
        registerLoadHandle(compName + "_load", loadHandle)
        registerUnloadHandle(compName + "_unload", unloadHandle)
    }
}
