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

protected package ohos.arkui.component.native_struct

import ohos.base.*

protected type VectorNavigationItemHandle = CPointer<Unit>

@C
protected struct CJNavPathInfo {
    protected CJNavPathInfo(
        protected let id: Int64,
        protected let name: CString,
        protected let param: CString,
        protected let onPop: Int64,
        protected let onPopValid: Bool,
        protected let index: Int32,
        protected let navDestinationId: CString,
        protected let isEntry: Bool,
        protected let valid: Int32
    ) {}

    protected func free(): Unit {
        unsafe {
            if (!name.isNull()) {
                name.free()
            }
            if (!param.isNull()) {
                param.free()
            }
            if (!navDestinationId.isNull()) {
                navDestinationId.free()
            }
        }
    }
}


@C
protected struct CJNavigationTitleOptions {
    protected CJNavigationTitleOptions(
        // backgroundColor
        protected var isBackgroundColorValid: Bool,
        protected var backgroundColor: UInt32,
        // backgroundBlurStyle
        protected var isBackgroundBlurStyleValid: Bool,
        protected var backgroundBlurStyle: Int32,
        // barStyle
        protected var isBarStyleValid: Bool,
        protected var barStyle: Int32,
        // paddingStart
        protected var isPaddingStartValid: Bool,
        protected var paddingStart: Float64,
        protected var paddingStartUnit: Int32,
        // paddingEnd
        protected var isPaddingEndValid: Bool,
        protected var paddingEnd: Float64,
        protected var paddingEndUnit: Int32
    ) {}

    protected init() {
        this.isBackgroundColorValid = false
        this.backgroundColor = 0
        this.isBackgroundBlurStyleValid = false
        this.backgroundBlurStyle = 0
        this.isBarStyleValid = false
        this.barStyle = 0
        this.isPaddingStartValid = false
        this.paddingStart = 0.0
        this.paddingStartUnit = 0
        this.isPaddingEndValid = false
        this.paddingEnd = 0.0
        this.paddingEndUnit = 0
    }
}

@C
protected struct NavigationItemFFI {
    protected NavigationItemFFI(
        protected let value: CString,
        protected let icon: CString,
        protected let isEnable: Bool,
        protected let action: Int64,
        protected let status: Int32,
        protected let activeIcon: CString
    ) {}
}
