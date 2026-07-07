/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import std.reflect.{ClassTypeInfo, InstanceVariableInfo}
import std.collection.HashMap
import ohos.base.{ReuseParams, BASE_LOG}

/**
 * Reflection reader for reuse params.
 * Reads child's `paramsGenerator_inner__` instance member via std.reflect.
 * Stub: reuse_reflection_reader_stub.cj (arm32 / macOS).
 */

/**
 * Per-class cache of InstanceVariableInfo descriptor.
 * Some(iv) — member exists, skip getInstanceVariable on subsequent calls.
 * None — member not found, skip all reflection.
 */
private let memberCache = HashMap<String, ?InstanceVariableInfo>()

/**
 * Read reuse params from child's paramsGenerator_inner__.
 * Returns None if child class lacks the member or reflection fails.
 */
func tryGetReuseParamsFromChild(child: CustomView): Option<ReuseParams> {
    let classInfo = try {
        ClassTypeInfo.of(child)
    } catch (e: Exception) {
        return Option<ReuseParams>.None
    }

    let cacheKey = classInfo.qualifiedName

    match (memberCache.get(cacheKey)) {
        case Some(Some(iv)) =>
            match (iv.getValue(child) as () -> Array<(String, Any)>) {
                case Some(gen) =>
                    return Option<ReuseParams>.Some(ReuseParams(gen()))
                case None =>
                    return Option<ReuseParams>.None
            }
        case Some(None) =>
            return Option<ReuseParams>.None
        case None =>
            ()
    }

    try {
        let iv = classInfo.getInstanceVariable("paramsGenerator_inner__")
        memberCache[cacheKey] = Option<InstanceVariableInfo>.Some(iv)

        match (iv.getValue(child) as () -> Array<(String, Any)>) {
            case Some(gen) =>
                return Option<ReuseParams>.Some(ReuseParams(gen()))
            case None =>
                BASE_LOG.warn("tryGetReuseParamsFromChild: type mismatch for ${cacheKey}")
                return Option<ReuseParams>.None
        }
    } catch (e: Exception) {
        memberCache[cacheKey] = Option<InstanceVariableInfo>.None
        BASE_LOG.warn("tryGetReuseParamsFromChild: reflection failed for ${cacheKey}")
        return Option<ReuseParams>.None
    }
}
