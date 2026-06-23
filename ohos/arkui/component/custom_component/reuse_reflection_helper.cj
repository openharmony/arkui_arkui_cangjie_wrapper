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

import std.reflect.{ClassTypeInfo}
import ohos.base.{ReuseParams, BASE_LOG}
import ohos.labels.{Hide}

/**
 * Reflection helpers for forward-compatible reuse API calls.
 *
 * These helpers use std.reflect to dynamically invoke methods that may not
 * exist on older system images. If the method is not found (e.g., running
 * a new app on an old system), the call is gracefully skipped and the caller
 * falls back to the old behavior.
 *
 * This pattern is already used in the SDK: see profiler_reflection.cj which
 * uses ClassTypeInfo.getStaticVariable with try/catch for the same purpose.
 *
 * Note: On arm32 where std.reflect is disabled, a stub version of these
 * functions (returning false/None) is compiled instead.
 */

/**
 * Try to call cv.setParamsGenerator(gen) via reflection.
 *
 * @param cv - The CustomView instance.
 * @param gen - The params generator lambda.
 * @return true if the method was found and invoked, false if not available.
 */
@!Hide
public func trySetParamsGenerator(cv: CustomView, gen: () -> ReuseParams): Bool {
    try {
        let classInfo = ClassTypeInfo.of(cv)
        let funcInfo = classInfo.getInstanceFunction("setParamsGenerator")
        funcInfo.apply(cv, [gen])
        return true
    } catch (e: Exception) {
        BASE_LOG.warn("trySetParamsGenerator: method not available, skipping")
        return false
    }
}

/**
 * Try to call HybridComponentBase.registerReuseHandle via reflection.
 *
 * @return true if the method was found and invoked, false if not available.
 */
@!Hide
public func tryRegisterReuseHandle(handleName: String, handle: (Int64, ReuseParams) -> Unit): Bool {
    try {
        let classInfo = ClassTypeInfo.get("ohos.arkui.component.custom_component.HybridComponentBase")
        let funcInfo = classInfo.getStaticFunction("registerReuseHandle")
        funcInfo.apply(classInfo, [handleName, handle])
        return true
    } catch (e: Exception) {
        BASE_LOG.warn("tryRegisterReuseHandle: method not available, skipping")
        return false
    }
}

/**
 * Try to call HybridComponentBase.registerRecycleHandle via reflection.
 *
 * @return true if the method was found and invoked, false if not available.
 */
@!Hide
public func tryRegisterRecycleHandle(handleName: String, handle: (Int64) -> Unit): Bool {
    try {
        let classInfo = ClassTypeInfo.get("ohos.arkui.component.custom_component.HybridComponentBase")
        let funcInfo = classInfo.getStaticFunction("registerRecycleHandle")
        funcInfo.apply(classInfo, [handleName, handle])
        return true
    } catch (e: Exception) {
        BASE_LOG.warn("tryRegisterRecycleHandle: method not available, skipping")
        return false
    }
}

/**
 * Try to call CJPageEntry.reuseHybridPage via reflection.
 *
 * @return true if the method was found and invoked, false if not available.
 */
@!Hide
public func tryReuseHybridPage(id: Int64, compName: String, params: ReuseParams): Bool {
    try {
        let entry = CJPageEntry.getInstance()
        let classInfo = ClassTypeInfo.of(entry)
        let funcInfo = classInfo.getInstanceFunction("reuseHybridPage")
        funcInfo.apply(entry, [id, compName, params])
        return true
    } catch (e: Exception) {
        BASE_LOG.warn("tryReuseHybridPage: method not available, skipping")
        return false
    }
}

/**
 * Try to call CJPageEntry.recycleHybridPage via reflection.
 *
 * @return true if the method was found and invoked, false if not available.
 */
@!Hide
public func tryRecycleHybridPage(id: Int64, compName: String): Bool {
    try {
        let entry = CJPageEntry.getInstance()
        let classInfo = ClassTypeInfo.of(entry)
        let funcInfo = classInfo.getInstanceFunction("recycleHybridPage")
        funcInfo.apply(entry, [id, compName])
        return true
    } catch (e: Exception) {
        BASE_LOG.warn("tryRecycleHybridPage: method not available, skipping")
        return false
    }
}
