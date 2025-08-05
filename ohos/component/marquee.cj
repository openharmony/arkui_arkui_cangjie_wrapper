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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Marquee <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: Bool,
        src!: String,
        step!: Float64 = 6.0,
        loop!: Int32 = -1,
        fromStart!: Bool = true
    ) {
        unsafe {
            let unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkMarqueeCreate(start, unsafeSrc, step, loop, fromStart)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        start!: Bool,
        src!: String,
        step!: Int64,
        loop!: Int32 = -1,
        fromStart!: Bool = true
    ) {
        unsafe {
            let unsafeSrc = LibC.mallocCString(src)
            FfiOHOSAceFrameworkMarqueeCreate(start, unsafeSrc, Float64(step), loop, fromStart)
            LibC.free(unsafeSrc)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func allowScale(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeSetAllowScale(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeSetFontColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(size: Length): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeSetFontSize(size.value, getLengthUnitOrFp(size).getValue());
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkMarqueeSetFontWeight(unsafeContent);
            LibC.free(unsafeContent)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: String): This {
        unsafe {
            var contentCString = LibC.mallocCString(content)
            FfiOHOSAceFrameworkMarqueeSetFontFamily(contentCString);
            LibC.free(contentCString)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        fontFamily(getResourceString(content))
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func marqueeUpdateStrategy(content: MarqueeUpdateStrategy): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeSetMarqueeUpdateStrategy(content.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStart(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeOnStart(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onBounce(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeOnBounce(Callback0Param<Unit>(callback).getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onFinish(callback: () -> Unit): This {
        unsafe {
            FfiOHOSAceFrameworkMarqueeOnFinish(Callback0Param<Unit>(callback).getID())
        }
        this
    }
}
