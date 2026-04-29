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
package ohos.arkui.state_management

import ohos.base.{Color, LengthMetrics, LengthUnit}
import std.collection.{ArrayList, HashMap, HashSet}
import std.core.{Hashable, Equatable, ToString}
import std.convert.*

private func mapValueToString<K, V>(elements: Iterator<(K, V)>, size: Int64): String {
    var parts = ArrayList<String>(size)
    for ((k, v) in elements) {
        parts.add(valueToString(k) + ":" + valueToString(v))
    }
    "{" + String.join(parts.toArray(), delimiter: ",") + "}"
}

private func collectionValueToString<T>(elements: Iterator<T>, size: Int64): String {
    var parts = ArrayList<String>(size)
    for (e in elements) {
        parts.add(valueToString(e))
    }
    "[" + String.join(parts.toArray(), delimiter: ",") + "]"
}

func valueToString<T>(v: T): String {
    match (v) {
        case s: ToString => s.toString()
        case _ => "<value>"
    }
}

func valueToString(v: LengthMetrics): String {
    v.value.toString() + lengthUnitSuffix(v.unitType)
}

func valueToString(v: Color): String {
    "Color(" + v.toUInt32().format("#08x") + ")"
}

func lengthUnitSuffix(unit: LengthUnit): String {
    match (unit) {
        case Px => "px"
        case Vp => "vp"
        case Fp => "fp"
        case Percent => "%"
        case Lpx => "lpx"
        case _ => "?"
    }
}

func valueToString<T>(v: Array<T>): String {
    if (v.size == 0) {
        return "[]"
    }
    collectionValueToString(v.iterator(), v.size)
}

func valueToString<T>(v: ObservedArrayList<T>): String {
    valueToString(v.get())
}

func valueToString<T>(v: ArrayList<T>): String {
    if (v.isEmpty()) {
        return "[]"
    }
    collectionValueToString(v.iterator(), v.size)
}

func valueToString<K, V>(v: HashMap<K, V>): String where K <: Hashable & Equatable<K> {
    if (v.isEmpty()) {
        return "{}"
    }
    mapValueToString(v.iterator(), v.size)
}

func valueToString<T>(v: HashSet<T>): String where T <: Hashable & Equatable<T> {
    if (v.isEmpty()) {
        return "{}"
    }
    collectionValueToString(v.iterator(), v.size)
}
