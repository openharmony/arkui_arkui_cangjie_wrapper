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

package ohos.arkui.component_snapshot

import ohos.multimedia.image.PixelMap
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

@C
struct CSnapshotOptions {
    CSnapshotOptions(
        let scale: Float32,
        let waitUntilRenderFinished: Bool
    ) {}
}

@C
struct CSnapshotGetSyncRet {
    CSnapshotGetSyncRet(
        let errCode: Int32,
        let pixelMapId: Int64
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkComponentSnapshotGet(id: CString, callback: Int64, options: CSnapshotOptions): Unit

    func FfiOHOSAceFrameworkComponentSnapshotCreate(builder: Int64, callback: Int64, delay: Int32,
        checkImageStatus: Bool, options: CSnapshotOptions): Unit

    func FfiOHOSAceFrameworkComponentSnapshotGetSync(id: CString, options: CSnapshotOptions): CSnapshotGetSyncRet
}

public type SnapshotRetCallBack = AsyncCallback<PixelMap>
