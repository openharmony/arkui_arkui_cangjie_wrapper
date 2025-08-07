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

package ohos.arkui.component.search

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
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

    func FfiOHOSAceFrameworkSearchSetBorder(value: SearchSetBorder): Unit

    func FfiOHOSAceFrameworkSearchSetPlaceholderFont(fontSize: Float64, sizeUnit: Int32, fontWeight: CString,
        fontStyle: Int32, fontFamily: CString): Unit

    func FfiOHOSAceFrameworkSearchSetTextFont(fontSize: Float64, sizeUnit: Int32, fontWeight: CString, fontStyle: Int32,
        fontFamily: CString): Unit
}

let DEFAULT_SIZE = 16.0

/**
 * Provides the method of switching the cursor position.
 *
 * @relation declare class SearchController extends TextContentControllerBase
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SearchController <: RemoteDataLite {
    /**
     * constructor.
     * A constructor used to create a SearchController object.
     *
     * @relation constructor();
     */
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

    /**
     * Called when the position of the insertion cursor is set.
     *
     * @param { Int32 } value
     * @returns {Unit}
     * @relation caretPosition(value: number): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkSearchCaretPosition(this.getID(), value)
        }
    }
}

/**
 * The construct function of search
 *
 * @relation interface SearchInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Search <: ViewBase {
    /**
     * The options of SearchInterface
     * @param { String } value
     * @param { String } placeholder
     * @param { AppResource } icon
     * @param { SearchController } controller
     * @returns { This }
     * @relation (options?: SearchOptions): SearchAttribute;
     */
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
            var unsafeIconUrl: ?CString = None
            try (unsafeValue = LibC.mallocCString(value).asResource(), unsafePlaceholder = LibC
                .mallocCString(placeholder)
                .asResource()) {
                let controllerID = match (controller) {
                    case None => -1
                    case Some(v) => v.getID()
                }
                var iconUrl: String = if (let Some(v) <- icon) {
                    getResourceMedia(v)
                } else {
                    ""
                }
                unsafeIconUrl = LibC.mallocCString(iconUrl)
                FfiOHOSAceFrameworkSearchCreateByIconRes(
                    unsafeValue.value,
                    unsafePlaceholder.value,
                    unsafeIconUrl.getOrThrow(),
                    controllerID,
                )
            } finally {
                unsafeIconUrl?.free()
            }
        }
    }

    /**
     * Set the search button text, fontSize and fontColor
     *
     * @param { String } value - indicates the text of the search button.
     * @returns { This }
     * @relation searchButton(value: ResourceStr, option?: SearchButtonOptions): SearchAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func searchButton(value: String): This {
        unsafe {
            try (unsafeValue = LibC.mallocCString(value).asResource()) {
                FfiOHOSAceFrameworkSearchSetSearchButton(unsafeValue.value)
            }
        }
        this
    }

    /**
     * Set the search button text, fontSize and fontColor
     *
     * @param { ResourceColor } value - Default value is '#99182431'.The default value on wearable devices is '#99ffffff'.
     * @returns { This }
     * @relation placeholderColor(value: ResourceColor): SearchAttribute;
     */
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

    /**
     * Set the font used for place holder text
     *
     * @param { Length } size - font size.
     * @param { FontWeight } weight - font weight.
     * @param { FontStyle } style - font style.
     * @param { ResourceStr } family - font family.
     * @returns { This }
     * @relation placeholderFont(value?: Font): SearchAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(
        size!: Length = DEFAULT_SIZE.fp,
        weight!: FontWeight = FontWeight.W400,
        style!: FontStyle = FontStyle.Normal,
        family!: ResourceStr = ""
    ): This {
        var sizeValue = transAppResourceToLength(size)
        var familyStr = transResourceStrToString(family)
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(familyStr).asResource(), unsafeFontWeight = LibC
                .mallocCString(weight.getValue())
                .asResource()) {
                var unit = sizeValue.unitType.getValue()
                var value = if (unit == LENGTH_PERCENT) {
                    unit = LENGTH_FP
                    DEFAULT_SIZE
                } else {
                    sizeValue.value
                }
                FfiOHOSAceFrameworkSearchSetPlaceholderFont(
                    value,
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
     * Set the font used for input text
     *
     * @param { Length } size - font size.
     * @param { FontWeight } weight - font weight.
     * @param { FontStyle } style - font style.
     * @param { ResourceStr } family - font family.
     * @returns { This }
     * @relation textFont(value?: Font): SearchAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textFont(
        size!: Length = DEFAULT_SIZE.fp,
        weight!: FontWeight = FontWeight.W400,
        style!: FontStyle = FontStyle.Normal,
        family!: ResourceStr = ""
    ): This {
        var sizeValue = transAppResourceToLength(size)
        var familyStr = transResourceStrToString(family)
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(familyStr).asResource(), unsafeFontWeight = LibC
                .mallocCString(weight.getValue())
                .asResource()) {
                var unit = sizeValue.unitType.getValue()
                var value = if (unit == LENGTH_PERCENT) {
                    unit = LENGTH_FP
                    DEFAULT_SIZE
                } else {
                    sizeValue.value
                }
                FfiOHOSAceFrameworkSearchSetTextFont(
                    value,
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
     * Called when the copy option is set.
     * If this attribute is set to CopyOptions.None, the text can only be pasted;
     * all other actions, such as copying, cutting, and sharing, are disabled.
     * Dragging is not allowed when CopyOptions.None is set.
     *
     * @param { CopyOptions } value - Default value is CopyOptions.LocalDevice.
     * @returns { This }
     * @relation copyOption(value: CopyOptions): SearchAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOption(value: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetCopyOption(value.getValue())
        }
        this
    }

    /**
     * Call the function when clicked the search button.
     *
     * @param { (String) -> Unit } callback - Search submission callback, which returns the text content currently in the search box.
     * @returns { This }
     * @relation onSubmit(callback: Callback<string>): SearchAttribute;
     */
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

    /**
     * Call the function when editing the input text.
     * In this callback, if cursor operations are performed,
     * <br>developers need to adjust the cursor logic based on the previewText parameter to ensure it works seamlessly within the preview display scenario.
     *
     * @param { (String) -> Unit } callback - Search submission callback, which returns the text content currently in the search box.
     * @returns { This }
     * @relation onChange(callback: EditableTextOnChangeCallback): SearchAttribute;
     */
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

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit } callback - Callback used to return the copied text content.
     * @returns { This }
     * @relation onCopy(callback: Callback<string>): SearchAttribute;
     */
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

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit } callback - Callback used to return the cut text content.
     * @returns { This }
     * @relation onCut(callback: Callback<string>): SearchAttribute;
     */
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

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit } callback - Executed when a paste operation is performed. Callback used to return the pasted text content.
     * @returns { This }
     * @relation onCut(callback: Callback<string>): SearchAttribute;
     */
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

    protected override func borderInner(width: Length, color: ResourceColor, radius: Length, style: BorderStyle): This {
        var w = transAppResourceToLength(width)
        var c = transAppResourceToResourceColor(color)
        var r = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorder(
                SearchSetBorder(
                    w.value,
                    w.unitType.getValue(),
                    c.toUInt32(),
                    r.value,
                    r.unitType.getValue(),
                    style.getValue()
                )
            )
        }
        this
    }

    protected override func borderWidthInner(width: Length): This {
        var w = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderWidth(w.value, w.unitType.getValue())
        }
        this
    }

    protected override func borderColorInner(color: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderColor(transAppResourceToResourceColor(color))
        }
        this
    }

    protected override func borderStyleInner(style: BorderStyle): This {
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderStyle(style.getValue())
        }
        this
    }

    protected override func borderRadiusInner(radius: Length): This {
        var r = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkSearchSetBorderRadius(r.value, r.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkSearchSetHeight(v.value, v.unitType.getValue())
        }
        this
    }
}
