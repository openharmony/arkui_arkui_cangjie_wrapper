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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

protected package ohos.arkui.component.util

import ohos.base.{Length, ResourceColor, LengthUnit, ResourceStr}
import ohos.resource.{AppResource, getResourceLength, getResourceColor, getResourceString, getResourceMedia}

// !! Do not use the following variables as match-case conditions

protected const LENGTH_PX: Int32 = 0
protected const LENGTH_VP: Int32 = 1
protected const LENGTH_FP: Int32 = 2
protected const LENGTH_PERCENT: Int32 = 3
protected const LENGTH_LPX: Int32 = 4
let EPSILON: Float64 = -0.001
let MEMORY_OP_ERR: Int32 = 9800001

protected func normalizeValue(value: Length, targetValue: Float64) {
    var value_ = value.value
    if (value_ < targetValue) {
        return targetValue
    }
    return value_
}

protected func transValueToTarget(value: Length, compareValue: Float64, targetValue: Float64) {
    var value_ = value.value
    if (value_ < compareValue) {
        return targetValue
    }
    return value_
}

protected func transAppResourceToLength(value: Length): Length {
    if (let Some(v) <- (value as AppResource)) {
        return getResourceLength(v)
    }
    return value
}

protected func transAppResourceToResourceColor(value: ResourceColor): UInt32 {
    if (let Some(v) <- (value as AppResource)) {
        return getResourceColor(v).toUInt32()
    }
    return value.toUInt32()
}

protected func getLengthUnitOrFp(value: Length): LengthUnit {
    if (value is Float64) {
        LengthUnit.Fp
    } else if (value is Int64) {
        LengthUnit.Fp
    } else {
        value.unitType
    }
}

protected func transResourceStrToString(value: ResourceStr): String {
    match (value) {
        case res: AppResource => getResourceString(res)
        case str: String => str
        case _ => ""
    }
}

protected func transResourceMediaToString(value: ResourceStr): String {
    match (value) {
        case res: AppResource => getResourceMedia(res)
        case str: String => str
        case _ => ""
    }
}

protected func lessNotEqual(left: Float64, right: Float64): Bool {
    return (left - right < EPSILON)
}