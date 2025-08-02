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

protected package ohos.arkui.component.search

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel

@C
struct SearchCreateParam {
    SearchCreateParam(
        let value: CString,
        let placeholder: CString,
        let iconID: Int64,
        let iconType: UInt32,
        let iconSrc: CString,
        let controllerID: Int64
    ) {}
}

@C
struct SearchSetBorder {
    SearchSetBorder(
        let width: Float64,
        let widthUnit: Int32,
        let color: UInt32,
        let radius: Float64,
        let radiusUnit: Int32,
        let style: Int32
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkSearchCreateByIconID(value: SearchCreateParam): Unit

    func FfiOHOSAceFrameworkSearchSetSearchButton(text: CString): Unit

    func FfiOHOSAceFrameworkSearchSetPlaceholderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSearchSetPlaceholderFont(fontSize: Float64, sizeUnit: Int32, fontWeight: CString,
        fontStyle: Int32, fontFamily: CString): Unit

    func FfiOHOSAceFrameworkSearchSetTextFont(fontSize: Float64, sizeUnit: Int32, fontWeight: CString, fontStyle: Int32,
        fontFamily: CString): Unit

    func FfiOHOSAceFrameworkSearchSetBorder(value: SearchSetBorder): Unit

    func FfiOHOSAceFrameworkSearchSetBorderWidth(width: Float64, widthUnit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSearchSetBorderStyle(style: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetBorderRadius(radius: Float64, radiusUnit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetHeight(height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetCopyOption(copyOption: Int32): Unit

    func FfiOHOSAceFrameworkSearchOnSubmit(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnCopy(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnCut(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnPaste(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchController(): Int64

    func FfiOHOSAceFrameworkSearchCaretPosition(controllerID: Int64, carePosition: Int32): Unit

    func FfiOHOSAceFrameworkSearchCreateByIconRes(value: CString, placeholder: CString, iconUrl: CString,
        controllerID: Int64): Unit

    func FfiOHOSAceFrameworkSearchStopEditing(controllerID: Int64): Unit

    func FfiOHOSAceFrameworkSearchSetTextSelection(controllerID: Int64, start: Int32, end: Int32, option: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetMaxFontSize(fontSize: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetMinFontSize(fontSize: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetFontFeature(text: CString): Unit

    func FfiOHOSAceFrameworkSearchSetLineHeight(lineHeight: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetLetterSpacing(space: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetDecoration(typeValue: Int32, colorValue: UInt32, styleValue: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetSelectedBackgroundColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkSearchSetEnterKeyType(value: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetTextIndent(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetCancelButton(style: Int32, value: Float64, unit: Int32, color: UInt32, src: CString): Unit

    func FfiOHOSAceFrameworkSearchSetSearchIcon(value: Float64, unit: Int32, color: UInt32, src: CString): Unit

    func FfiOHOSAceFrameworkSearchSetEnablePreviewText(enable: Bool): Unit

    func FfiOHOSAceFrameworkSearchSetType(searchType: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetMaxLength(value: UInt32): Unit

    func FfiOHOSAceFrameworkSearchSetSelectionMenuHidden(value: Bool): Unit

    func FfiOHOSAceFrameworkSearchSetEnableKeyboardOnFocus(value: Bool): Unit

    func FfiOHOSAceFrameworkSearchSetCaretStyle(value: Float64, unit: Int32, color: UInt32): Unit

    func FfiOHOSAceFrameworkSearchSetTextAlign(textAlign: Int32): Unit

    func FfiOHOSAceFrameworkSearchSetFontColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkSearchOnContentScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnTextSelectionChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnEditChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchSetInputFilter(value: CString, error: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnDidDelete(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnWillDelete(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnDidInsert(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchOnWillInsert(callback: Int64): Unit

    func FfiOHOSAceFrameworkSearchSetCustomKeyboard(value: Int64, options: Bool): Unit

    func FfiOHOSAceFrameworkSearchEditMenuOptions(callbackOnCreateMenu: Int64, callbackOnMenuItemClick: Int64): Unit

    func FfiOHOSAceFrameworkSearchGetTextContentLineCount(id: Int64): Int32

}

/**
 * DEFAULT_SIZE defines the default width of search component.
 */
let DEFAULT_SIZE = 16.0

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SearchController <: RemoteDataLite {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkSearchController()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(carePosition: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkSearchCaretPosition(this.getID(), carePosition)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Search <: ViewBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        value!: String = "",
        placeholder!: String = "",
        icon!: Option<AppResource> = Option.None,
        controller!: Option<SearchController> = Option.None
    ) {
        unsafe {
            var unsafeValue: ?CString = None
            var unsafePlaceholder: ?CString = None
            var unsafeIconUrl: ?CString = None
            try {
                unsafeValue = LibC.mallocCString(value)
                unsafePlaceholder = LibC.mallocCString(placeholder)
                let controllerID = match (controller) {
                    case None => -1
                    case Some(v) => v.getID()
                }
                var iconUrl: String = ""
                if (let Some(v) <- icon) {
                    iconUrl = getResourceMedia(v)
                }
                unsafeIconUrl = LibC.mallocCString(iconUrl)
                FfiOHOSAceFrameworkSearchCreateByIconRes(
                    unsafeValue.getOrThrow(),
                    unsafePlaceholder.getOrThrow(),
                    unsafeIconUrl.getOrThrow(),
                    controllerID,
                )
            } finally {
                unsafeValue?.free()
                unsafePlaceholder?.free()
                unsafeIconUrl?.free()
            }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func searchButton(text: String): This {
        unsafe {
            var unsafeValue = LibC.mallocCString(text)
            FfiOHOSAceFrameworkSearchSetSearchButton(unsafeValue)
            LibC.free(unsafeValue)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetPlaceholderColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(
        size!: Length = DEFAULT_SIZE.fp,
        weight!: FontWeight = FontWeight.W400,
        style!: FontStyle = FontStyle.Normal,
        family!: String = ""
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(family).asResource(),
                unsafeFontWeight = LibC.mallocCString(weight.getValue()).asResource()) {
                var sizeValue = size_.value
                var unit = size_.unitType.getValue()
                match (unit) {
                    case 3 =>
                        unit = LENGTH_FP
                        sizeValue = DEFAULT_SIZE
                    case _ => ()
                }
                FfiOHOSAceFrameworkSearchSetPlaceholderFont(
                    sizeValue,
                    unit,
                    unsafeFontWeight.value,
                    style.getValue(),
                    unsafeFontFamily.value
                )
            }
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textFont(
        size!: Length = DEFAULT_SIZE.fp,
        weight!: FontWeight = FontWeight.W400,
        style!: FontStyle = FontStyle.Normal,
        family!: String = ""
    ): This {
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(family).asResource(),
                unsafeFontWeight = LibC.mallocCString(weight.getValue()).asResource()) {
                var sizeValue = size_.value
                var unit = size_.unitType.getValue()
                match (unit) {
                    case 3 =>
                        unit = LENGTH_FP
                        sizeValue = DEFAULT_SIZE
                    case _ => ()
                }
                FfiOHOSAceFrameworkSearchSetTextFont(
                    sizeValue,
                    unit,
                    unsafeFontWeight.value,
                    style.getValue(),
                    unsafeFontFamily.value
                )
            }
        }
        this
    }

    /**
     * Set border of search component.
     *
     * @param width: border width.
     * @param color: border color.
     * @param radius: border corner radius.
     * @param style: border style.
     * @returns current Search component.
     * since 11
     */
    protected override func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        var width_ = transAppResourceToLength(width)
        var color_ = transAppResourceToResourceColor(color)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorder(
                SearchSetBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    color_.toUInt32(),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderWidth(width: Length): This {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderWidth(width_.value, width_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderColor(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderColor(transAppResourceToResourceColor(color))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderStyle(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderStyle(style.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderRadius(radius: Length): This {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderRadius(radius_.value, radius_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSearchSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOption(copyOption: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetCopyOption(copyOption.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSearchOnSubmit(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSearchOnChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSearchOnCopy(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSearchOnCut(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkSearchOnPaste(lambdaData.getID())
        }
        this
    }
}
