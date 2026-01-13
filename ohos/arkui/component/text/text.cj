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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.component.text

import ohos.arkui.component.common.{CommonMethod, FontStyle, FontWeight, TextAlign, TextOverflow, TextDecorationType, TextCase, Rectangle, CommonMethodComponent, TextDecorationStyle}
import ohos.arkui.component.native_struct.{FFIVectorNativeRectangle, VectorNativeRectangleHandle, CJResponseRegion, NativeShadowOptions}
import ohos.arkui.component.util.{getLengthUnitOrFp, transResourceStrToString, transAppResourceToLength, transAppResourceToResourceColor, lessNotEqual, LENGTH_PERCENT}
import ohos.base.{BASE_LOG, Length, ResourceColor, ResourceStr, VectorStringHandle, ExternalString, CStringExtend, Color, LengthProp}
import ohos.ffi.{releaseFFIData, RemoteDataLite}
import ohos.labels.{APILevel, Hide}
import ohos.business_exception.BusinessException

type VectorNativeShadowOptionsHandle = CPointer<Unit>

type VectorTextMenuItemHandle = CPointer<Unit>

foreign {
    func FfiOHOSAceFrameworkTextCreate(content: CString): Unit

    func FfiOHOSAceFrameworkTextCreateWithController(content: CString, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextSetWidth(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetFontSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetFontWeight(fontWeight: CString): Unit

    func FfiOHOSAceFrameworkTextSetFontColor(textColor: UInt32): Unit

    func FfiOHOSAceFrameworkTextSetTextOverflow(overflow: Int32): Unit

    func FfiOHOSAceFrameworkTextSetTextOverflowNew(overflow: Int32): Unit

    func FfiOHOSAceFrameworkTextSetMaxLines(maxLines: Int32): Unit

    func FfiOHOSAceFrameworkTextSetFontStyle(fontStyle: Int32): Unit

    func FfiOHOSAceFrameworkTextSetTextAlign(textAlign: Int32): Unit

    func FfiOHOSAceFrameworkTextSetLineHeight(lineHeight: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetDecoration(typeValue: Int32, colorValue: UInt32): Unit

    func FfiOHOSAceFrameworkTextSetDecorationNew(typeValue: Int32, colorValue: UInt32, styleValue: Int32): Unit

    func FfiOHOSAceFrameworkTextSetMinFontSize(fontSize: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetMaxFontSize(fontSize: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetTextCase(textCase: Int32): Unit

    func FfiOHOSAceFrameworkTextSetBaselineOffset(baseLine: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetFontFamily(fontFamily: CString): Unit

    func FfiOHOSAceFrameworkTextOnClick(callback: Int64): Unit

    func FfiTextSetResponseRegionArray(array: VectorNativeRectangleHandle): Unit

    func FfiTextSetResponseRegion(value: CJResponseRegion): Unit

    func FFICJCreateVectorNativeShadowOptions(size: Int64): VectorNativeShadowOptionsHandle

    func FFICJVectorNativeShadowOptionsSetElement(vec: VectorNativeShadowOptionsHandle, index: Int64,
        ShadowOptions: NativeShadowOptions): Unit

    func FFICJVectorNativeShadowOptionsDelete(vec: VectorNativeShadowOptionsHandle): Unit

    func FfiOHOSAceFrameworkTextShadow(array: VectorNativeShadowOptionsHandle): Unit

    func FfiOHOSAceFrameworkTextSetDataDetectorConfig(vec: VectorStringHandle, callback: Int64, color: UInt32,
        decorationType: Int32, decorationColor: UInt32, decorationStyle: Int32): Unit

    func FfiOHOSAceFrameworkTextHalfLeading(value: Bool): Unit

    func FfiOHOSAceFrameworkTextSetFontFeature(fontFeature: CString): Unit

    func FfiOHOSAceFrameworkTextSetLineBreakStrategy(lineBreakStrategy: Int32): Unit

    func FfiOHOSAceFrameworkTextSetLineSpacing(lineSpacing: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetCopyOption(copyOption: Int32): Unit

    func FfiOHOSAceFrameworkTextSetLetterSpacing(letterSpacing: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextMaxFontScale(maxFontScale: Float32): Unit

    func FfiOHOSAceFrameworkTextMinFontScale(minFontScale: Float32): Unit

    func FfiOHOSAceFrameworkTextSetTextSelectable(textSelectable: Int32): Unit

    func FfiOHOSAceFrameworkTextSetHeightAdaptivePolicy(heightAdaptivePolicy: Int32): Unit

    func FFICJCreateVectorFfiTextMenuItem(size: Int64): VectorTextMenuItemHandle

    func FFICJVectorFfiTextMenuItemDelete(vec: VectorTextMenuItemHandle): Unit

    func FFICJVectorFfiTextMenuItemGetSize(vec: VectorTextMenuItemHandle): Int64

    func FfiOHOSAceFrameworkTextEditMenuOptions(callbackOnCreateMenu: Int64, callbackOnMenuItemClick: Int64): Unit

    func FfiOHOSAceFrameworkTextSetFont(fontSize: Float64, unit: Int32, fontWeight: CString, fontFamily: CString,
        fontStyle: Int32): Unit

    func FfiOHOSAceFrameworkTextEnableDataDetector(value: Bool): Unit

    func FfiOHOSAceFrameworkTextSetWordBreak(wordBreak: Int32): Unit

    func FfiOHOSAceFrameworkTextSetSelection(start: Int32, end: Int32): Unit

    func FfiOHOSAceFrameworkTextSetTextIndent(textIndent: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextSetEllipsisMode(ellipsisMode: Int32): Unit

    func FfiOHOSAceFrameworkTextOnCopy(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextOnTextSelectionChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextBindSelectionMenu(spanType: Int32, content: Int64, responseType: Int32, onAppear: Int64,
        onDisappear: Int64): Unit

    func FfiOHOSAceFrameworkTextDraggable(value: Bool): Unit

    func FfiOHOSAceFrameworkTextPrivacySensitive(value: Bool): Unit

    func FfiOHOSAceFrameworkTextControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextControllerCloseSelectionMenu(selfID: Int64): Unit

    func FFISetWidthWithEmpty(): Unit

    func FFISetHeightWithEmpty(): Unit

    func FfiOHOSAceFrameworkTextResetFontSize(): Unit

    func FfiOHOSAceFrameworkTextResetMaxFontSize(): Unit

    func FfiOHOSAceFrameworkTextResetMinFontSize(): Unit

    func FfiOHOSAceFrameworkTextResetFontColor(): Unit
}

/**
 * Defines the controller of Text.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextController <: RemoteDataLite {
    /**
     * Defines the TextController constructor.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTextControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Close the select menu when menu is on.
     *
     * @returns { Unit }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeSelectionMenu(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextControllerCloseSelectionMenu(this.getID())
        }
    }
}

/**
 * Provides a class for writing texts.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Text <: CommonMethodComponent<Text> & TextAttribute {
    /**
     * Called when writing text.
     *
     * @param { ?ResourceStr } content - The text content.
     * @param { ?TextController } controller - The text controller.
     * @param { () -> Unit } child - The child component builder.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: ?ResourceStr, controller!: ?TextController = None, child!: () -> Unit = { => }) {
        let tmpController = controller ?? TextController()
        unsafe {
            try (unsafeContent = LibC.mallocCString(transResourceStrToString(content ?? "")).asResource()) {
                FfiOHOSAceFrameworkTextCreateWithController(unsafeContent.value, tmpController.getID())
            }
        }
        this.child = child
    }

    /**
     * Called when writing text.
     *
     * @param { ?TextController } controller - The text controller.
     * @param { () -> Unit } child - The child component builder.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?TextController = None, child!: () -> Unit) {
        this("", controller: controller ?? TextController(), child: child)
    }

    /**
     * Called when writing text.
     *
     * @param { ?TextController } controller - The text controller.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?TextController = None) {
        this("", controller: controller ?? TextController())
    }

    protected override func widthInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetWidthWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkTextSetWidth(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetWidthWithEmpty() }
        }
        this
    }

    protected override func heightInner(value: ?Length): This {
        match (value) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetHeightWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkTextSetHeight(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
        this
    }

    /**
     * Set font line spacing.
     *
     * @param { ?Length } value - The line spacing value.
     * @default 0
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineSpacing(value: ?Length): This {
        var v = transAppResourceToLength(value ?? 0.0.vp)
        if (v.value < 0.0) {
            v = 0.0.px
        }
        unsafe {
            FfiOHOSAceFrameworkTextSetLineSpacing(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the font size is set.
     *
     * @param { ?Length } value - The font size.
     * @default 16.fp (wearable devices is 15.fp)
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        if (let Some(v) <- value) {
            var v_ = transAppResourceToLength(v)
            if (v_.value < 0.0 || v_.unitType.getValue() == LENGTH_PERCENT) {
                unsafe {
                    FfiOHOSAceFrameworkTextResetFontSize()
                }
                return this
            }
            unsafe {
                FfiOHOSAceFrameworkTextSetFontSize(v_.value, getLengthUnitOrFp(v_).getValue())
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextResetFontSize()
            }
        }
        this
    }

    /**
     * Called when the maximum font size of the font is set.
     *
     * @param { ?Length } value - The maximum font size.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxFontSize(value: ?Length): This {
        if (let Some(v) <- value) {
            var v_ = transAppResourceToLength(v)
            unsafe {
                if (v_.value < 0.0) {
                    FfiOHOSAceFrameworkTextResetMaxFontSize()
                } else {
                    FfiOHOSAceFrameworkTextSetMaxFontSize(v_.value, v_.unitType.getValue())
                }
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextResetMaxFontSize()
            }
        }
        this
    }

    /**
     * Called when the minimum font size of the font is set.
     *
     * @param { ?Length } value - The minimum font size.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minFontSize(value: ?Length): This {
        if (let Some(v) <- value) {
            var v_ = transAppResourceToLength(v)
            unsafe {
                if (v_.value < 0.0) {
                    FfiOHOSAceFrameworkTextResetMinFontSize()
                } else {
                    FfiOHOSAceFrameworkTextSetMinFontSize(v_.value, v_.unitType.getValue())
                }
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextResetMinFontSize()
            }
        }
        this
    }

    /**
     * Called when the font color is set.
     *
     * @param { ?ResourceColor } value - The font color.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkTextSetFontColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextResetFontColor()
            }
        }
        this
    }

    /**
     * Called when the font style of a font is set.
     *
     * @param { ?FontStyle } value - The font style.
     * @default FontStyle.Normal
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetFontStyle((value ?? FontStyle.Normal).getValue())
        }
        this
    }

    /**
     * Called when the font weight is set.
     *
     * @param { ?FontWeight } value - The font weight.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        var fontWeightString = ""
        if (let Some(v) <- value) {
            fontWeightString = v.getValue()
        }
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(fontWeightString)
            FfiOHOSAceFrameworkTextSetFontWeight(unsafeFontWeight)
            unsafeFontWeight.free()
        }
        this
    }

    /**
     * Called when the font list of text is set.
     *
     * @param { ?ResourceStr } value - The font family.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(transResourceStrToString(value ?? "HarmonyOS Sans")).asResource()) {
                FfiOHOSAceFrameworkTextSetFontFamily(unsafeFontFamily.value)
            }
        }
        this
    }

    /**
     * Called when the horizontal center mode of the font is set.
     *
     * @param { ?TextAlign } value - The text alignment.
     * @defalut TextAlign.Start
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: ?TextAlign): This {
        let tmpValue = value ?? TextAlign.Start
        unsafe {
            FfiOHOSAceFrameworkTextSetTextAlign(tmpValue.getValue())
        }
        this
    }

    /**
     * Called when the overflow mode of the font is set.
     *
     * @param { ?TextOverflow } options - Text overflow options.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textOverflow(value: ?TextOverflow): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextOverflowNew((value ?? TextOverflow.None).getValue())
        }
        this
    }

    /**
     * Called when the maximum number of lines of text is set.
     * <br>By default, text is automatically folded.
     * <br>If this attribute is specified, the text will not exceed the specified number of lines.
     * <br>If there is extra text, you can use textOverflow to specify how it is displayed.
     *
     * @param { ?Int32 } value - The maximum number of lines.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: ?Int32): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetMaxLines(value ?? Int32.Max)
        }
        this
    }

    /**
     * Called when the vertical center mode of the font is set.
     * <br>If the value is less than or equal to 0, the line height is not limited and the font size is adaptive.
     * <br>If the value is of the number type, the unit fp is used.
     * <br>For the string type, numeric string values with optional units.
     *
     * @param { ?Length } value - The line height.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineHeight(value: ?Length): This {
        var v = transAppResourceToLength(value ?? 0.0.px)
        if (v.value < 0.0) {
            v = 0.0.px
        }
        unsafe {
            FfiOHOSAceFrameworkTextSetLineHeight(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the text decoration of the text is set.
     *
     * @param { ?TextDecorationType } decorationType - The type value of the decoration property object.
     * @param { ?ResourceColor } color - The color value of the decoration property object.
     * @param { ?TextDecorationStyle } decorationStyle - The style value of the decoration property object.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: ?TextDecorationType, color!: ?ResourceColor,
        decorationStyle!: ?TextDecorationStyle = None): This {
        let tmpDecorationType = decorationType ?? TextDecorationType.None
        let tmpDecorationStyle = decorationStyle ?? TextDecorationStyle.Solid
        let tmpColor = color ?? Color.Black

        unsafe {
            FfiOHOSAceFrameworkTextSetDecorationNew(tmpDecorationType.getValue(), transAppResourceToResourceColor(tmpColor),
                tmpDecorationStyle.getValue())
        }
        this
    }

    /**
     * Called when the baseline offset is set.
     *
     * @param { ?Length } value - The baseline offset.
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func baselineOffset(value: ?Length): This {
        var v = transAppResourceToLength(value ?? 0.0.px)
        unsafe {
            FfiOHOSAceFrameworkTextSetBaselineOffset(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the type of letter in the text font is set.
     *
     * @param { ?TextCase } value - The text case.
     * @default TextCase.Normal
     * @returns { This } Returns itself to allow method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: ?TextCase): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextCase((value ?? TextCase.Normal).getValue())
        }
        this
    }

    protected override func foregroundColorInner(color: ?ResourceColor): This {
        fontColor(color)
    }

    protected override func responseRegionInner(rect: ?Rectangle): This {
        let cjRect = (rect ?? Rectangle()).normalizeValue().parseToNative()
        unsafe {
            FfiTextSetResponseRegion(
                CJResponseRegion(
                    cjRect.x,
                    cjRect.xUnit,
                    cjRect.y,
                    cjRect.yUnit,
                    cjRect.width,
                    cjRect.widthUnit,
                    cjRect.height,
                    cjRect.heightUnit
                )
            )
        }
        this
    }

    protected override func responseRegionInner(array: ?Array<Rectangle>): This {
        let tmpArray = array ?? [Rectangle()]
        let vecFFi = FFIVectorNativeRectangle(tmpArray.size)
        var index = 0
        for (rect in tmpArray) {
            BASE_LOG.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.normalizeValue().parseToNative())
            index++
        }
        unsafe {
            FfiTextSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}
