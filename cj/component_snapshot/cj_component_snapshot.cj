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

package ohos.component_snapshot

import ohos.image.PixelMap
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CJSnapshotOptions {
    public CJSnapshotOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let scale: Float32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public let waitUntilRenderFinished: Bool
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class componentSnapshot {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func get(id: String, callback: SnapshotRetCallBack,
        options!: CJSnapshotOptions = CJSnapshotOptions(1.0, false)): Unit {
        let wrapper = {
            errCode: NativeOptionInt32, pixelMapId: NativeOptionInt64 =>
            let arg0: Option<AsyncError> = if (errCode.hasValue) {
                Some(AsyncError(errCode.value))
            } else {
                None
            }
            let arg1: Option<PixelMap> = if (pixelMapId.hasValue) {
                Some(PixelMap(pixelMapId.value))
            } else {
                None
            }
            callback(arg0, arg1)
        }
        let lambdaData = Callback2Param<NativeOptionInt32, NativeOptionInt64, Unit>(wrapper)
        unsafe {
            var unsafeId = LibC.mallocCString(id)
            FfiOHOSAceFrameworkComponentSnapshotGet(
                unsafeId,
                lambdaData.getID(),
                CSnapshotOptions(options.scale, options.waitUntilRenderFinished)
            )
            LibC.free(unsafeId)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func createFromBuilder(builder: () -> Unit, callback: SnapshotRetCallBack, delay!: Int32 = 300,
        checkImageStatus!: Bool = false, options!: CJSnapshotOptions = CJSnapshotOptions(1.0, false)): Unit {
        let wrapper = {
            errCode: NativeOptionInt32, pixelMapId: NativeOptionInt64 =>
            let arg0: Option<AsyncError> = if (errCode.hasValue) {
                Some(AsyncError(errCode.value))
            } else {
                None
            }
            let arg1: Option<PixelMap> = if (pixelMapId.hasValue) {
                Some(PixelMap(pixelMapId.value))
            } else {
                None
            }
            callback(arg0, arg1)
        }
        let lambdaData = Callback2Param<NativeOptionInt32, NativeOptionInt64, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkComponentSnapshotCreate(
                Callback0Param<Unit>(builder).getID(),
                lambdaData.getID(),
                delay,
                checkImageStatus,
                CSnapshotOptions(options.scale, options.waitUntilRenderFinished)
            )
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func getSync(id: String, options!: CJSnapshotOptions = CJSnapshotOptions(1.0, false)): PixelMap {
        var ret: CSnapshotGetSyncRet
        unsafe {
            var unsafeId = LibC.mallocCString(id)
            ret = FfiOHOSAceFrameworkComponentSnapshotGetSync(unsafeId,
                CSnapshotOptions(options.scale, options.waitUntilRenderFinished))
            LibC.free(unsafeId)
            if (ret.errCode != 0) {
                throw BusinessException(ret.errCode, "Component snapshot getSync failed!")
            }
        }

        return PixelMap(ret.pixelMapId)
    }
}
