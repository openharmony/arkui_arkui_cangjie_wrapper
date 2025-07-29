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

protected package ohos.arkui.component.native_struct

@C
protected struct FfiWebResourceRequest {
    protected FfiWebResourceRequest(
        protected let requestUrl: CString,
        protected let isMainFrame: Bool,
        protected let isRedirect: Bool,
        protected let isRequestGesture: Bool,
        protected let requestMethod: CString,
        protected let ffiHeaders: CPointer<FfiMapToCFFIArray>
    ) {}
}

@C
protected struct FfiMapToCFFIArray {
    protected FfiMapToCFFIArray(
        protected let size: Int64,
        protected let key: CPointer<CPointer<UInt8>>,
        protected let value: CPointer<CPointer<UInt8>>
    ) {}
}