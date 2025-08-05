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

// !! Do not use the following variables as match-case conditions
const LENGTH_PX: Int32 = 0
const LENGTH_VP: Int32 = 1
const LENGTH_FP: Int32 = 2
const LENGTH_PERCENT: Int32 = 3
const LENGTH_LPX: Int32 = 4
let MEMORY_OP_ERR: Int32 = 9800001

func normalizeValue(value: Length, targetValue: Float64) {
    var value_ = value.value
    if (value_ < targetValue) {
        return targetValue
    }
    return value_
}

func transValueToTarget(value: Length, compareValue: Float64, targetValue: Float64) {
    var value_ = value.value
    if (value_ < compareValue) {
        return targetValue
    }
    return value_
}

func transAppResourceToLength(value: Length): Length {
    if (value is AppResource) {
        return getResourceLength((value as AppResource).getOrThrow())
    }
    return value
}

func transAppResourceToResourceColor(value: ResourceColor): UInt32 {
    if (value is AppResource) {
        var value_ = getResourceColor((value as AppResource).getOrThrow())
        return value_.toUInt32()
    }
    return value.toUInt32()
}

func getLengthUnitOrFp(value: Length): LengthType {
    if (value is Float64) {
        LengthType.fp((value as Float64).getOrThrow())
    } else if (value is Int64) {
        LengthType.fp(Float64((value as Int64).getOrThrow()))
    } else {
        value.unitType
    }
}
