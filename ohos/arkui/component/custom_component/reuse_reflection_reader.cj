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

import std.reflect.{ClassTypeInfo}
import std.collection.HashMap
import ohos.base.{ReuseParams, BASE_LOG}

/**
 * Reflection reader for reuse params and handle registration.
 *
 * This module mirrors the profiler_reflection.cj pattern:
 * - The macro emits `public static var __REUSE_PARAMS__` on user component classes.
 * - The SDK reads it via ClassTypeInfo.getStaticVariable at runtime.
 *
 * On arm32 / macOS where std.reflect is disabled, a stub version
 * (reuse_reflection_reader_stub.cj) is compiled instead.
 */

/**
 * Per-class reflection cache for __REUSE_PARAMS__.
 *
 * Key: qualified class name (from ClassTypeInfo.qualifiedName, includes package prefix).
 * Value: Some(registry) if the class has __REUSE_PARAMS__, None if it does not
 *        (negative cache — avoids repeated reflection + warning logs for old apps).
 *
 * This mirrors profiler_reflection.cj's componentMetaRegistry pattern.
 * Without this cache, traverseChildDoRecycleOrReuse with N children would
 * perform N identical ClassTypeInfo.of + getStaticVariable calls.
 */
private let registryCache = HashMap<String, Option<HashMap<Int64, () -> ReuseParams>>>()

/**
 * Try to read the reuse params generator for a child component from its
 * parent's __REUSE_PARAMS__ static table.
 *
 * Uses per-class caching: the first call for a given parent class performs
 * full reflection; subsequent calls for the same class are O(1) HashMap lookups.
 * Old app classes (without __REUSE_PARAMS__) are cached as negative results,
 * avoiding repeated reflection attempts and warning logs.
 *
 * @param parent - The parent CustomView whose class carries __REUSE_PARAMS__
 * @param childId - The id() of the child component
 * @return Some(params) if found and invoked, None if not available
 */
func tryGetReuseParamsFromParent(parent: CustomView, childId: Int64): Option<ReuseParams> {
    // Step 1: get qualified class name for cache key (ClassTypeInfo.of is O(1))
    // Use qualifiedName (includes package prefix) to avoid collision between
    // same-named classes in different packages.
    let cacheKey = try {
        ClassTypeInfo.of(parent).qualifiedName
    } catch (e: Exception) {
        return Option<ReuseParams>.None
    }

    // Step 2: check cache
    match (registryCache.get(cacheKey)) {
        case Some(Some(registry)) =>
            // Positive cache hit: class has __REUSE_PARAMS__, just do HashMap lookup
            match (registry.get(childId)) {
                case Some(gen) => return Option<ReuseParams>.Some(gen())
                case None => return Option<ReuseParams>.None
            }
        case Some(None) =>
            // Negative cache hit: class does not have __REUSE_PARAMS__ (old app)
            return Option<ReuseParams>.None
        case None =>
            // Cache miss: do full reflection
            ()
    }

    // Step 3: full reflection (cache miss)
    try {
        let classInfo = ClassTypeInfo.of(parent)
        let registryVar = classInfo.getStaticVariable("__REUSE_PARAMS__")
        match (registryVar.getValue()) {
            case registry: HashMap<Int64, () -> ReuseParams> =>
                // Positive result: cache the registry
                registryCache[cacheKey] = Option<HashMap<Int64, () -> ReuseParams>>.Some(registry)
                match (registry.get(childId)) {
                    case Some(gen) => return Option<ReuseParams>.Some(gen())
                    case None => return Option<ReuseParams>.None
                }
            case _ =>
                // Negative result: class doesn't have __REUSE_PARAMS__ — cache it
                registryCache[cacheKey] = Option<HashMap<Int64, () -> ReuseParams>>.None
                return Option<ReuseParams>.None
        }
    } catch (e: Exception) {
        // Reflection failed — cache as negative to avoid repeated attempts
        registryCache[cacheKey] = Option<HashMap<Int64, () -> ReuseParams>>.None
        BASE_LOG.warn("tryGetReuseParamsFromParent: reflection failed for ${cacheKey}, caching as negative")
        return Option<ReuseParams>.None
    }
}

/**
 * Cleanup: remove a child's entry from its parent's __REUSE_PARAMS__ table.
 * Called from aboutToBeDeletedInternal to prevent memory leaks.
 *
 * Uses the per-class cache to avoid redundant reflection on cleanup.
 *
 * @param parent - The parent CustomView whose __REUSE_PARAMS__ should be cleaned
 * @param childId - The id() of the child being deleted
 */
func cleanupReuseParamsEntry(parent: CustomView, childId: Int64): Unit {
    let cacheKey = try {
        ClassTypeInfo.of(parent).qualifiedName
    } catch (e: Exception) {
        return
    }
    match (registryCache.get(cacheKey)) {
        case Some(Some(registry)) =>
            registry.remove(childId)
            if (registry.size == 0) {
                registryCache.remove(cacheKey)
            }
        case _ => ()
    }
}
