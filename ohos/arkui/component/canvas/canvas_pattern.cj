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

package ohos.arkui.component.canvas

import ohos.arkui.component.common.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkRenderingContextCreateCanvasPattern(reder: Int64, imageId: Int64, repetition: CString): Int64

    func FfiOHOSAceFrameworkCanvasPatternSetTransform(id: Int64, matrixId: Int64): Unit
}

/**
 * Describes an opaque object of a template, which is created using the createPattern() method.
 *
 * @relation interface CanvasPattern
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class CanvasPattern <: RemoteDataLite {

    init(render: Int64, image: ImageBitmap, repetition: Repetition) {
        super(
            unsafe {
                var id: Int64 = 0
                try (repSrc = LibC.mallocCString(repetition.toStringInner()).asResource()) {
                    id = FfiOHOSAceFrameworkRenderingContextCreateCanvasPattern(render, image.getID(), repSrc.value)
                }
                id
            })
    }

    init(selfId: Int64) {
        super(selfId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * The 2D transformation effect is added. The current transformation matrix is not overwritten and
     *    the transformations are superimposed for multiple times.
     *
     * @param { Matrix2D } transform - 2D transformation matrix.
     * @relation setTransform(transform?: Matrix2D): void;
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTransform(transform: Option<Matrix2D>): Unit {
        match (transform) {
            case Some(v) =>
                unsafe {
                    FfiOHOSAceFrameworkCanvasPatternSetTransform(this.getID(), v.getID())
                }
            case None => ()
        }
    }
}
