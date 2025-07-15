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

foreign {
    func FfiOHOSAceFrameworkRenderingContextCreateCanvasPattern(reder: Int64, imageId: Int64, repetition: CString): Int64

    func FfiOHOSAceFrameworkCanvasPatternSetTransform(id: Int64, matrixId: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasPattern <: RemoteDataLite {
    private var isNoneValue: Bool = true

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}

    init(render: Int64, image: ImageBitmap, repetition: Repetition) {
        super(
            unsafe {
                var repSrc = LibC.mallocCString(repetition.toString())
                let id = FfiOHOSAceFrameworkRenderingContextCreateCanvasPattern(render, image.getID(), repSrc)
                LibC.free(repSrc)
                this.isNoneValue = false
                id
            })
    }

    init(selfId: Int64) {
        super(selfId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(transform: Matrix2D): Unit {
        unsafe {
            FfiOHOSAceFrameworkCanvasPatternSetTransform(this.getID(), transform.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func isNone(): Bool {
        return this.isNoneValue
    }
}
