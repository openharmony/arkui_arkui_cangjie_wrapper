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

protected package ohos.arkui.component.marquee

foreign func FfiOHOSAceFrameworkMarqueeCreate(start: Bool, src: CString, step: Float64, loop: Int32, fromStart: Bool): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetAllowScale(value: Bool): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetFontColor(color: UInt32): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetFontSize(value: Float64, unit: Int32): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetFontWeight(fontWeight: CString): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetFontFamily(fontFamily: CString): Unit

foreign func FfiOHOSAceFrameworkMarqueeSetMarqueeUpdateStrategy(value: Int32): Unit

foreign func FfiOHOSAceFrameworkMarqueeOnStart(callback: Int64): Unit

foreign func FfiOHOSAceFrameworkMarqueeOnBounce(callback: Int64): Unit

foreign func FfiOHOSAceFrameworkMarqueeOnFinish(callback: Int64): Unit

