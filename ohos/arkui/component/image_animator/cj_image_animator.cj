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

package ohos.arkui.component.image_animator

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
