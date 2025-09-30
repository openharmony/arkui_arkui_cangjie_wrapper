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

package ohos.arkui.component.common

import ohos.base.*
import ohos.business_exception.BusinessException

@C
struct CJContentCoverOptionsV2 {
    CJContentCoverOptionsV2(
        let modalTransition: UInt32,
        let onWillDismiss: NativeOptionCallBack,
        let transition: NativeOptionInt64,
        let backgroundColor: NativeOptionUInt32,
        let onAppear: NativeOptionCallBack,
        let onDisappear: NativeOptionCallBack,
        let onWillAppear: NativeOptionCallBack,
        let onWillDisappear: NativeOptionCallBack
    ) {}
}

@C
struct CJDismissContentCoverAction {
    CJDismissContentCoverAction(
        let reason: Int32,
        let dismissContentCover: CFunc<() -> Unit>
    ) {}

    func parseToCJ(): DismissContentCoverAction {
        return DismissContentCoverAction(
            DismissReason.toEnum(reason),
            dismissContentCover
        )
    }
}

@C
struct CJAlignRuleOption {
    var leftAnchor: CString = CString(CPointer<UInt8>())
    var leftHorizontalAlign: Int32 = -1
    var rightAnchor: CString = CString(CPointer<UInt8>())
    var rightHorizontalAlign: Int32 = -1
    var middleAnchor: CString = CString(CPointer<UInt8>())
    var middleHorizontalAlign: Int32 = -1
    var topAnchor: CString = CString(CPointer<UInt8>())
    var topVerticalAlign: Int32 = -1
    var bottomAnchor: CString = CString(CPointer<UInt8>())
    var bottomVerticalAlign: Int32 = -1
    var centerAnchor: CString = CString(CPointer<UInt8>())
    var centerVerticalAlign: Int32 = -1
    var horizontalBias: CPointer<Float32> = CPointer<Float32>()
    var verticalBias: CPointer<Float32> = CPointer<Float32>()

    init(option: AlignRuleOptions) {
        try {
            if (let Some(v) <- option.left) {
                leftAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                leftHorizontalAlign = (v.align ?? HorizontalAlign.Start).getValue()
            }
            if (let Some(v) <- option.right) {
                rightAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                rightHorizontalAlign = (v.align ?? HorizontalAlign.Start).getValue()
            }
            if (let Some(v) <- option.middle) {
                middleAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                middleHorizontalAlign = (v.align ?? HorizontalAlign.Start).getValue()
            }
            if (let Some(v) <- option.top) {
                topAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                topVerticalAlign = (v.align ?? VerticalAlign.Top).getValue()
            }
            if (let Some(v) <- option.bottom) {
                bottomAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                bottomVerticalAlign = (v.align ?? VerticalAlign.Top).getValue()
            }
            if (let Some(v) <- option.center) {
                centerAnchor = unsafe { LibC.mallocCString(v.anchor ?? "") }
                centerVerticalAlign = (v.align ?? VerticalAlign.Top).getValue()
            }
            horizontalBias = unsafe { LibC.malloc<Float32>() }
            if (horizontalBias.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            unsafe { horizontalBias.write(Float32((option.bias ?? Bias()).horizontal ?? 0.5)) }
            verticalBias = unsafe { LibC.malloc<Float32>() }
            if (verticalBias.isNull()) {
                throw BusinessException(100001, "Internal error: failed to allocate memory.")
            }
            unsafe { verticalBias.write(Float32((option.bias ?? Bias()).vertical ?? 0.5)) }
        } catch (e: Exception) {
            free()
            throw BusinessException(100001, "Internal error: failed to allocate memory.")
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(leftAnchor)
            LibC.free(rightAnchor)
            LibC.free(middleAnchor)
            LibC.free(topAnchor)
            LibC.free(bottomAnchor)
            LibC.free(centerAnchor)
            LibC.free<Float32>(horizontalBias)
            LibC.free<Float32>(verticalBias)
        }
    }
}

@C
protected struct CTranslateOptions {
    let x: Float64
    let xType: UInt32
    let y: Float64
    let yType: UInt32
    let z: Float64
    let zType: UInt32

    init(options: TranslateOptions) {
        x = (options.x ?? 0.vp).value
        xType = UInt32((options.x ?? 0.vp).unitType.getValue())
        y = (options.y ?? 0.vp).value
        yType = UInt32((options.y ?? 0.vp).unitType.getValue())
        z = (options.z ?? 0.vp).value
        zType = UInt32((options.z ?? 0.vp).unitType.getValue())
    }
}
