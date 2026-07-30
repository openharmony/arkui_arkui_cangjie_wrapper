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
 * Reads child's `__paramsGenerator__inner__` (simple property, write-child path)
 * and parent's `__childParamsGetter__inner__` (function chain, write-parent path).
 * Stub: reuse_reflection_reader_stub.cj (arm32 / macOS).
 */

/**
 * Per-class cache of InstanceVariableInfo descriptor for child field.
 * Some(iv) — member exists, skip getInstanceVariable on subsequent calls.
 * None — member not found, skip all reflection.
 */
private let childMemberCache = HashMap<String, ?InstanceVariableInfo>()

/**
 * Per-class cache of InstanceVariableInfo descriptor for parent field.
 * Separate from childMemberCache because the two fields have different types.
 */
private let parentMemberCache = HashMap<String, ?InstanceVariableInfo>()

/**
 * Read reuse params from child's __paramsGenerator__inner__.
 * Returns None if child class lacks the member, reflection fails,
 * or the generator returns an empty array (params not written).
 */
func tryGetReuseParamsFromChild(child: CustomView): Option<ReuseParams> {
    let classInfo = try {
        ClassTypeInfo.of(child)
    } catch (e: Exception) {
        return Option<ReuseParams>.None
    }

    let cacheKey = classInfo.qualifiedName

    match (childMemberCache.get(cacheKey)) {
        case Some(Some(iv)) =>
            match (iv.getValue(child) as () -> Array<(String, Any)>) {
                case Some(gen) =>
                    let arr = gen()
                    if (arr.size == 0) {
                        return Option<ReuseParams>.None
                    }
                    return Option<ReuseParams>.Some(ReuseParams(arr))
                case None =>
                    return Option<ReuseParams>.None
            }
        case Some(None) =>
            return Option<ReuseParams>.None
        case None =>
            ()
    }

    try {
        let iv = classInfo.getInstanceVariable("__paramsGenerator__inner__")
        childMemberCache[cacheKey] = Option<InstanceVariableInfo>.Some(iv)

        match (iv.getValue(child) as () -> Array<(String, Any)>) {
            case Some(gen) =>
                let arr = gen()
                if (arr.size == 0) {
                    return Option<ReuseParams>.None
                }
                return Option<ReuseParams>.Some(ReuseParams(arr))
            case None =>
                BASE_LOG.warn("tryGetReuseParamsFromChild: type mismatch for ${cacheKey}")
                return Option<ReuseParams>.None
        }
    } catch (e: Exception) {
        childMemberCache[cacheKey] = Option<InstanceVariableInfo>.None
        BASE_LOG.warn("tryGetReuseParamsFromChild: reflection failed for ${cacheKey}")
        return Option<ReuseParams>.None
    }
}

/**
 * Read reuse params from parent's __childParamsGetter__inner__ by childId.
 * The function chain stores params for all children indexed by compId.
 * Returns None if parent class lacks the member, reflection fails,
 * or the getter returns an empty array for the given childId.
 */
func tryGetReuseParamsFromParent(parent: CustomView, childId: Int64): Option<ReuseParams> {
    let classInfo = try {
        ClassTypeInfo.of(parent)
    } catch (e: Exception) {
        return Option<ReuseParams>.None
    }

    let cacheKey = classInfo.qualifiedName

    match (parentMemberCache.get(cacheKey)) {
        case Some(Some(iv)) =>
            match (iv.getValue(parent) as (Int64) -> Array<(String, Any)>) {
                case Some(getter) =>
                    let arr = getter(childId)
                    if (arr.size == 0) {
                        return Option<ReuseParams>.None
                    }
                    return Option<ReuseParams>.Some(ReuseParams(arr))
                case None =>
                    return Option<ReuseParams>.None
            }
        case Some(None) =>
            return Option<ReuseParams>.None
        case None =>
            ()
    }

    try {
        let iv = classInfo.getInstanceVariable("__childParamsGetter__inner__")
        parentMemberCache[cacheKey] = Option<InstanceVariableInfo>.Some(iv)

        match (iv.getValue(parent) as (Int64) -> Array<(String, Any)>) {
            case Some(getter) =>
                let arr = getter(childId)
                if (arr.size == 0) {
                    return Option<ReuseParams>.None
                }
                return Option<ReuseParams>.Some(ReuseParams(arr))
            case None =>
                BASE_LOG.warn("tryGetReuseParamsFromParent: getter type mismatch for ${cacheKey}")
                return Option<ReuseParams>.None
        }
    } catch (e: Exception) {
        parentMemberCache[cacheKey] = Option<InstanceVariableInfo>.None
        BASE_LOG.warn("tryGetReuseParamsFromParent: reflection failed for ${cacheKey}")
        return Option<ReuseParams>.None
    }
}
