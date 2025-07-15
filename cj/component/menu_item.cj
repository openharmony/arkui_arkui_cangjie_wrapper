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
    func FfiOHOSAceFrameworkMenuItemCreateByBuilder(builder: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemCreateByOption(startIcon: CString, content: CString, endIcon: CString,
        labelInfo: CString, builder: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemIsSelected(value: Bool): Unit

    func FfiOHOSAceFrameworkMenuItemSelectIconByBool(value: Bool): Unit

    func FfiOHOSAceFrameworkMenuItemSelectIconByResource(value: CString): Unit

    func FfiOHOSAceFrameworkMenuItemContentFont(size: Float64, unit: Int32, weight: CString, family: CString,
        style: Int32): Unit

    func FfiOHOSAceFrameworkMenuItemContentFontColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkMenuItemLabelFont(size: Float64, unit: Int32, weight: CString, family: CString, style: Int32): Unit

    func FfiOHOSAceFrameworkMenuItemLabelFontColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkMenuItemOnChange(callback: Int64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItem <: ViewBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(builder!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuItemCreateByBuilder(Callback0Param<Unit>(builder).getID())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(startIcon!: String, content!: String, endIcon!: String, labelInfo!: String,
        builder!: Option<() -> Unit> = None) {
        let builderId = if (let Some(fn) <- builder) {
            Callback0Param<Unit>(fn).getID()
        } else {
            0
        }
        unsafe {
            try (cstartIcon = LibC.mallocCString(startIcon).asResource(),
                ccontent = LibC.mallocCString(content).asResource(),
                cendIcon = LibC.mallocCString(endIcon).asResource(),
                clabelInfo = LibC.mallocCString(labelInfo).asResource()) {
                FfiOHOSAceFrameworkMenuItemCreateByOption(cstartIcon.value, ccontent.value, cendIcon.value,
                    clabelInfo.value, builderId)
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(startIcon!: AppResource, content!: AppResource, endIcon!: AppResource, labelInfo!: AppResource,
        builder!: Option<() -> Unit> = None) {
        let builderId = if (let Some(fn) <- builder) {
            Callback0Param<Unit>(fn).getID()
        } else {
            0
        }
        unsafe {
            try (cstartIcon = LibC.mallocCString(getResourceMedia(startIcon)).asResource(),
                ccontent = LibC.mallocCString(getResourceString(content)).asResource(),
                cendIcon = LibC.mallocCString(getResourceMedia(endIcon)).asResource(),
                clabelInfo = LibC.mallocCString(getResourceString(labelInfo)).asResource()) {
                FfiOHOSAceFrameworkMenuItemCreateByOption(
                    cstartIcon.value,
                    ccontent.value,
                    cendIcon.value,
                    clabelInfo.value,
                    builderId
                )
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selected(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkMenuItemIsSelected(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkMenuItemSelectIconByBool(value)
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectIcon(value: AppResource): This {
        unsafe {
            try (icon = LibC.mallocCString(getResourceMedia(value)).asResource()) {
                FfiOHOSAceFrameworkMenuItemSelectIconByResource(icon.value)
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkMenuItemContentFont(
                    transAppResourceToLength(size).value,
                    transAppResourceToLength(size).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        contentFont(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentFontColor(value: ResourceColor): This {
        unsafe {
            let color = transAppResourceToResourceColor(value)
            FfiOHOSAceFrameworkMenuItemContentFontColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: String = "HarmonyOS Sans",
        style!: FontStyle = FontStyle.Normal
    ): This {
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkMenuItemLabelFont(
                    transAppResourceToLength(size).value,
                    transAppResourceToLength(size).unitType.getValue(),
                    weightCString.value,
                    fontFamilyCString.value,
                    style.getValue()
                )
            }
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFont(
        size!: Length = 16.vp,
        weight!: FontWeight = FontWeight.Normal,
        family!: AppResource,
        style!: FontStyle = FontStyle.Normal
    ): This {
        labelFont(
            size: size,
            weight: weight,
            family: getResourceString(family),
            style: style
        )
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func labelFontColor(value: AppResource): This {
        unsafe {
            let color = getResourceColor(value)
            FfiOHOSAceFrameworkMenuItemLabelFontColor(color.toUInt32())
        }
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (Bool) -> Unit): This {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkMenuItemOnChange(lambdaData.getID())
        }
        this
    }
}
