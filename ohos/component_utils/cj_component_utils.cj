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

package ohos.component_utils

import ohos.base.*
import ohos.ffi.*
import ohos.labels.APILevel

foreign func FFIOHOSAceFrameworkComponentUtilsGetById(id: CString): CComponentInfo

@C
public struct CSize {
    public CSize(
        let width: Float32,
        let height: Float32
    ) {}

    func parseToCJ(): Size {
        Size(this.width, this.height)
    }
}

public class Size {
    public Size(
        public let width: Float32,
        public let height: Float32
    ) {}
}

@C
struct COffset {
    COffset(
        let x: Float32,
        let y: Float32
    ) {}

    func parseToCJ(): Offset {
        Offset(this.x, this.y)
    }
}

public class Offset {
    public Offset(
        public let x: Float32,
        public let y: Float32
    ) {}
}

@C
struct CTranslateResult {
    CTranslateResult(
        let x: Float32,
        let y: Float32,
        let z: Float32
    ) {}

    func parseToCJ(): TranslateResult {
        TranslateResult(this.x, this.y, this.z)
    }
}

public class TranslateResult {
    public TranslateResult(
        public let x: Float32,
        public let y: Float32,
        public let z: Float32
    ) {}
}

@C
struct CScaleResult {
    CScaleResult(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float32,
        let centerY: Float32
    ) {}

    func parseToCJ(): ScaleResult {
        ScaleResult(this.x, this.y, this.z, this.centerX, this.centerY)
    }
}

public class ScaleResult {
    public ScaleResult(
        public let x: Float32,
        public let y: Float32,
        public let z: Float32,
        public let centerX: Float32,
        public let centerY: Float32
    ) {}
}

@C
struct CRotateResult {
    CRotateResult(
        let x: Float32,
        let y: Float32,
        let z: Float32,
        let centerX: Float32,
        let centerY: Float32,
        let angle: Float32
    ) {}

    func parseToCJ(): RotateResult {
        RotateResult(this.x, this.y, this.z, this.centerX, this.centerY, this.angle)
    }
}

public class RotateResult {
    public RotateResult(
        public let x: Float32,
        public let y: Float32,
        public let z: Float32,
        public let centerX: Float32,
        public let centerY: Float32,
        public let angle: Float32
    ) {}
}

@C
struct CComponentInfo {
    CComponentInfo(
        let size: CSize,
        let localOffset: COffset,
        let windowOffset: COffset,
        let screenOffset: COffset,
        let translate: CTranslateResult,
        let scale: CScaleResult,
        let rotate: CRotateResult,
        let transform: CArrFloat32
    ) {}

    func parseToCJ(): ComponentInfo {
        let transform = if (this.transform.head.isNotNull()) {
            unsafe { Array<Float32>(this.transform.size, {i => this.transform.head.read(i)}) }
        } else {
            Array<Float32>()
        }
        ComponentInfo(
            this.size.parseToCJ(),
            this.localOffset.parseToCJ(),
            this.windowOffset.parseToCJ(),
            this.screenOffset.parseToCJ(),
            this.translate.parseToCJ(),
            this.scale.parseToCJ(),
            this.rotate.parseToCJ(),
            transform
        )
    }
}

public class ComponentInfo {
    public ComponentInfo(
        public let size: Size,
        public let localOffset: Offset,
        public let windowOffset: Offset,
        public let screenOffset: Offset,
        public let translate: TranslateResult,
        public let scale: ScaleResult,
        public let rotate: RotateResult,
        public let transform: Array<Float32>
    ) {}
}

public class ComponentUtils {
    public static func getRectangleById(id: String): ComponentInfo {
        var nativeInfo: CComponentInfo
        unsafe {
            var unsafeId = LibC.mallocCString(id)
            nativeInfo = FFIOHOSAceFrameworkComponentUtilsGetById(unsafeId)
            LibC.free(unsafeId)
        }
        nativeInfo.parseToCJ()
    }
}
