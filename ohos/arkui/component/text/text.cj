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

package ohos.arkui.component.text

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

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

    func FFICJVectorFfiTextMenuItemSetElement(vec: VectorTextMenuItemHandle, index: Int64, textMenuItem: FfiTextMenuItem): Unit

    func FFICJVectorFfiTextMenuItemGetElement(vec: VectorTextMenuItemHandle, index: Int64): FfiTextMenuItem

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
}

class FFIVectorNativeShadowOptions {
    private let vecHandle: VectorNativeShadowOptionsHandle

    init(vec: VectorNativeShadowOptionsHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorNativeShadowOptions(size) }
    }

    func setElement(index: Int64, value: NativeShadowOptions): Unit {
        unsafe { FFICJVectorNativeShadowOptionsSetElement(vecHandle, index, value) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorNativeShadowOptionsDelete(vecHandle) }
    }

    func getNativeHandle(): VectorNativeShadowOptionsHandle {
        vecHandle
    }
}

@C
struct FfiTextMenuItem {
    FfiTextMenuItem(
        var content: ExternalString,
        var icon: ExternalString,
        var id: ExternalString
    ) {}
}

class FFIVectorFfiTextMenuItem {
    private let vecHandle: VectorTextMenuItemHandle

    init(vec: VectorTextMenuItemHandle) {
        vecHandle = vec
    }

    init(size: Int64) {
        vecHandle = unsafe { FFICJCreateVectorFfiTextMenuItem(size) }
    }

    func setElement(index: Int64, value: FfiTextMenuItem): Unit {
        unsafe { FFICJVectorFfiTextMenuItemSetElement(vecHandle, index, value) }
    }

    func getElement(index: Int64): FfiTextMenuItem {
        unsafe { FFICJVectorFfiTextMenuItemGetElement(vecHandle, index) }
    }

    // Using the free() on vecHandle deallocates its memory.
    func free(): Unit {
        unsafe { FFICJVectorFfiTextMenuItemDelete(vecHandle) }
    }

    func getSize(): Int64 {
        unsafe { FFICJVectorFfiTextMenuItemGetSize(vecHandle) }
    }

    func getNativeHandle(): VectorTextMenuItemHandle {
        vecHandle
    }
}

/**
 * Defines the controller of Text.
 *
 * @relation declare class TextController
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextController <: RemoteDataLite {
    /**
     * Defines the TextController constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation closeSelectionMenu(): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
 * @relation interface TextInterface
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Text <: CommonMethodComponent<TextAttribute> & TextAttribute {
    /**
     * Called when writing text.
     *
     * @relation (content?: string | Resource, value?: TextOptions): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: ?ResourceStr, controller!: ?TextController = None, child!: () -> Unit = { =>}) {
        let tmpContent = content ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpController = controller ?? TextController()
        
        unsafe {
            try (unsafeContent = LibC.mallocCString(transResourceStrToString(tmpContent)).asResource()) {
                FfiOHOSAceFrameworkTextCreateWithController(unsafeContent.value, tmpController.getID())
            }
        }
        this.child = child
    }

    /**
     * Called when writing text.
     *
     * @relation (content?: string | Resource, value?: TextOptions): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?TextController = None, child!: () -> Unit) {
        this("", controller: controller ?? TextController(), child: child)	
    }	

    /**
     * Called when writing text.
     *
     * @relation (content?: string | Resource, value?: TextOptions): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(controller!: ?TextController = None) {
        this("", controller: controller ?? TextController())
    }

    protected override func widthInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetWidth(v.value, v.unitType.getValue())
        }
        this
    }

    protected override func heightInner(value: Length): This {
        var v = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetHeight(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Set font line spacing.
     *
     * @param { Length } value - Default value is 0.
     * @returns { This }
     * @relation lineSpacing(value: LengthMetrics): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineSpacing(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetLineSpacing(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the font size is set.
     *
     * @param { Length } value - Default value is 16.fp.
     * @returns { This }
     * @relation lineSpacing(value: LengthMetrics): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetFontSize(v.value, getLengthUnitOrFp(v).getValue())
        }
        this
    }

    /**
     * Called when the maximum font size of the font is set.
     *
     * @param { Length } value
     * @returns { This }
     * @relation maxFontSize(value: number | string | Resource): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxFontSize(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetMaxFontSize(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the minimum font size of the font is set.
     *
     * @param { Length } value
     * @returns { This }
     * @relation minFontSize(value: number | string | Resource): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minFontSize(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetMinFontSize(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the font color is set.
     *
     * @param { Length } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetFontColor(transAppResourceToResourceColor(tmpValue))
        }
        this
    }

    /**
     * Called when the font style of a font is set.
     *
     * @param { FontStyle } value - Default value is FontStyle.Normal.
     * @returns { This }
     * @relation fontStyle(value: FontStyle): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetFontStyle(tmpValue.getValue())
        }
        this
    }

    /**
     * Called when the font weight is set.
     *
     * @param { FontStyle } value
     * @returns { This }
     * @relation fontWeight(value: number | FontWeight | ResourceStr): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(tmpValue.getValue())
            FfiOHOSAceFrameworkTextSetFontWeight(unsafeFontWeight)
            unsafeFontWeight.free()
        }
        this
    }

    /**
     * Called when the font list of text is set.
     *
     * @param { ResourceStr } value
     * @returns { This }
     * @relation fontFamily(value: string | Resource): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            try (unsafeFontFamily = LibC.mallocCString(transResourceStrToString(tmpValue)).asResource()) {
                FfiOHOSAceFrameworkTextSetFontFamily(unsafeFontFamily.value)
            }
        }
        this
    }

    /**
     * Called when the horizontal center mode of the font is set.
     *
     * @param { TextAlign } value - value - Default value is TextAlign.Start.
     * @returns { This }
     * @relation textAlign(value: TextAlign): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: ?TextAlign): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetTextAlign(tmpValue.getValue())
        }
        this
    }

    /**
     * Called when the overflow mode of the font is set.
     *
     * @param { TextOverflowOptions } options - Text overflow options.
     * @returns { This }
     * @relation textOverflow(options: TextOverflowOptions): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textOverflow(value: ?TextOverflow): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetTextOverflowNew(tmpValue.getValue())
        }
        this
    }

    /**
     * Called when the maximum number of lines of text is set.
     * <br>By default, text is automatically folded.
     * <br>If this attribute is specified, the text will not exceed the specified number of lines.
     * <br>If there is extra text, you can use textOverflow to specify how it is displayed.
     * @param { Int32 } options - Text overflow options.
     * @returns { This }
     * @relation maxLines(value: number): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: ?Int32): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetMaxLines(tmpValue)
        }
        this
    }

    /**
     * Called when the vertical center mode of the font is set.
     * <br>If the value is less than or equal to 0, the line height is not limited and the font size is adaptive.
     * <br>If the value is of the number type, the unit fp is used.
     * <br>For the string type, numeric string values with optional units.
     *
     * @param { Int32 } value
     * @returns { This }
     * @relation maxLines(value: number): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineHeight(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetLineHeight(v.value, v.unitType.getValue())
        }
        this
    }

    /**
     * Called when the text decoration of the text is set.
     *
     * @param { TextDecorationType } decorationType - The type value of the decoration property object.
     * @param { ResourceColor } color - The color value of the decoration property object.
     * @param { TextDecorationStyle } decorationStyle - The style value of the decoration property object.
     * @returns { This }
     * @relation decoration(value: DecorationStyleInterface): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: ?TextDecorationType, color!: ?ResourceColor,
        decorationStyle!: ?TextDecorationStyle = None): This {
        let tmpDecorationType = decorationType ?? throw IllegalArgumentException("The type now is not supported.")
        let tmpDecorationStyle = decorationStyle ?? TextDecorationStyle.Solid
        let tmpColor = color ?? throw IllegalArgumentException("The type now is not supported.")
        
        unsafe {
            FfiOHOSAceFrameworkTextSetDecorationNew(tmpDecorationType.getValue(), transAppResourceToResourceColor(tmpColor),
                tmpDecorationStyle.getValue())
        }
        this
    }

    /**
     * Called when the baseline offset is set.
     *
     * @param { Length } value
     * @returns { This }
     * @relation baselineOffset(value: number | ResourceStr): TextAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func baselineOffset(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var v = transAppResourceToLength(tmpValue)
        unsafe {
            FfiOHOSAceFrameworkTextSetBaselineOffset(v.value, v.unitType.getValue())
        }
        this
    }

    /**
   * Called when the type of letter in the text font is set.
   *
   * @param { TextCase } value - Default value is TextCase.Normal.
   * @returns { This }
   * @relation textCase(value: TextCase): TextAttribute;
   */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: ?TextCase): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        unsafe {
            FfiOHOSAceFrameworkTextSetTextCase(tmpValue.getValue())
        }
        this
    }

    protected override func foregroundColorInner(color: ResourceColor): This {
        fontColor(color)
    }

    protected override func responseRegionInner(rect: Rectangle): This {
        let cjRect = rect.parseToNative()
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

    protected override func responseRegionInner(array: Array<Rectangle>): This {
        let vecFFi = FFIVectorNativeRectangle(array.size)
        var index = 0
        for (rect in array) {
            BaseLog.debug("CJRectangle responseRegion vecdata: " + index.toString())
            vecFFi.setElement(index, rect.parseToNative())
            index++
        }
        unsafe {
            FfiTextSetResponseRegionArray(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }
}