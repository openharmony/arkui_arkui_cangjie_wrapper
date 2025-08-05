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

type VectorFfiImageHandle = CPointer<UInt32>

foreign {
    func FfiCJCreateVectorFfiImage(size: Int64): VectorFfiImageHandle

    func FfiCJVectorFfiImageSetElement(vec: VectorFfiImageHandle, index: Int64, rectangle: FfiImage): Unit

    func FfiCJVectorFfiImageDelete(vec: VectorFfiImageHandle): Unit
}

class FfiVectorFfiImage {
    private let vecHandle: VectorFfiImageHandle

    init(vec: VectorFfiImageHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FfiCJCreateVectorFfiImage(size) }
    }

    func setElement(index: Int64, value: FfiImage): Unit {
        unsafe { FfiCJVectorFfiImageSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FfiCJVectorFfiImageDelete(vecHandle) }
    }

    func getNativeHandle(): VectorFfiImageHandle {
        vecHandle
    }
}

@C
struct FfiImage {
    FfiImage(
        let src: CString,
        let duration: Int32,
        let width: Float64,
        let widthUnit: Int32,
        let height: Float64,
        let heightUnit: Int32,
        let top: Float64,
        let topUnit: Int32,
        let left: Float64,
        let leftUnit: Int32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ImageFrameInfo {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let src: String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let duration: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let width: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let height: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let top: Length
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    let left: Length

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: String,
        duration!: Int32 = 0,
        width!: Length = 0.vp,
        height!: Length = 0.vp,
        top!: Length = 0.vp,
        left!: Length = 0.vp
    ) {
        this.src = src
        this.duration = duration
        this.width = transAppResourceToLength(width)
        this.height = transAppResourceToLength(height)
        this.top = transAppResourceToLength(top)
        this.left = transAppResourceToLength(left)
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        src!: AppResource,
        duration!: Int32 = 0,
        width!: Length = 0.vp,
        height!: Length = 0.vp,
        top!: Length = 0.vp,
        left!: Length = 0.vp
    ) {
        this.src = getResourceMedia(src)
        this.duration = duration
        this.width = transAppResourceToLength(width)
        this.height = transAppResourceToLength(height)
        this.top = transAppResourceToLength(top)
        this.left = transAppResourceToLength(left)
    }
}

foreign {
    func FfiOHOSAceFrameworkImageAnimatorCreate(): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetImages(images: VectorFfiImageHandle): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetState(state: Int32): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetDuration(duration: Int32): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetReverse(isReverse: Bool): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetFixedSize(fixedSize: Bool): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetPreDecode(preDecode: Int32): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetFillMode(fillMode: Int32): Unit

    func FfiOHOSAceFrameworkImageAnimatorSetIterations(iteration: Int32): Unit

    func FfiOHOSAceFrameworkImageAnimatorOnStart(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageAnimatorOnPause(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageAnimatorOnRepeat(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageAnimatorOnCancel(callback: Int64): Unit

    func FfiOHOSAceFrameworkImageAnimatorOnFinish(callback: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public open class ImageAnimator <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorCreate()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func images(images: Array<ImageFrameInfo>): This {
        let vecFfi = FfiVectorFfiImage(images.size)
        var index = 0
        let ffiSrcList = ArrayList<CString>()
        for (image in images) {
            let srcCString = unsafe { LibC.mallocCString(image.src) }
            ffiSrcList.add(srcCString)
            let ffiImages = FfiImage(
                srcCString,
                image.duration,
                image.width.value,
                image.width.unitType.getValue(),
                image.height.value,
                image.height.unitType.getValue(),
                image.top.value,
                image.top.unitType.getValue(),
                image.left.value,
                image.left.unitType.getValue(),
            )
            vecFfi.setElement(index, ffiImages)
            index++
        }
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetImages(vecFfi.getNativeHandle())
            for (cString in ffiSrcList) {
                LibC.free(cString)
            }
            vecFfi.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func state(value: AnimationStatus): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetState(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func duration(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetDuration(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func reverse(isReverse: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetReverse(isReverse)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fixedSize(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetFixedSize(value)
        }
        this
    }

    @!APILevel[
        19,
        deprecated: 9,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func preDecode(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetPreDecode(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fillMode(value: FillMode): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetFillMode(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func iterations(iterations: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorSetIterations(iterations)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorOnStart(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPause(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorOnPause(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onRepeat(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorOnRepeat(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCancel(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorOnCancel(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: () -> Unit): This {
        let lambdaData = Callback0Param<Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkImageAnimatorOnFinish(lambdaData.getID())
        }
        this
    }
}
