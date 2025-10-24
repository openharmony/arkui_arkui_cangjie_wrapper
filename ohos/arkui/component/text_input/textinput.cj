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

package ohos.arkui.component.text_input

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkTextInputCreate(placeholder: CString, text: CString, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextInputControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextInputControllerCaretPosition(selfID: Int64, value: Int32): Unit

    func FfiOHOSAceFrameworkTextInputControllerSetTextSelection(selfID: Int64, selectionStart: Int32,
        selectionEnd: Int32, menuPolicy: Int32): Unit

    func FfiOHOSAceFrameworkTextInputControllerStopEditing(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextInputControllerGetTextContentLineCount(id: Int64): Int32
}

/**
 * Provides the method of switching the cursor position.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextInputController <: RemoteDataLite {
    /**
     * TextInputController constructor.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTextInputControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Called when the position of the insertion cursor is set.
     * <br>If the value is less than 0, the value 0 is used.
     * <br>If the value exceeds the text length, the caret is placed at the end of the text.
     *
     * @param { ?Int32 } value
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: ?Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerCaretPosition(this.getID(), value ?? 0)
        }
    }

    /**
     * Text selection is achieved by specifying the start and end positions of the text.
     *
     * <br>If the value is less than 0, the value 0 is used.
     * <br>If the value exceeds the text length, the caret is placed at the end of the text.
     *
     * @param { ?Int32 } selectionStart - The start position of the selected text.The start position of text in the text box is 0.
     * @param { ?Int32 } selectionEnd - The end position of the selected text.
     * @param { ?MenuPolicy } options - Indicates the options of the text selection.Default value is MenuPolicy.DEFAULT.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTextSelection(selectionStart: ?Int32, selectionEnd: ?Int32, options!: ?MenuPolicy = None): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerSetTextSelection(this.getID(), selectionStart ?? 0, selectionEnd ?? 0,
                (options ?? MenuPolicy.Default).getValue());
        }
    }

    /**
     * Exit edit state.
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopEditing(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerStopEditing(this.getID());
        }
    }
}

/**
 * Defines TextInput Component.
 *
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextInput <: CommonMethodComponent<TextInput> & TextInputAttribute {
    /**
     * Called when writing a single line of text.
     *
     * @param { ?ResourceStr } placeholder - The place holder text string.
     * @param { ?ResourceStr } text - Sets the current value of TextInput.
     * @param { ?TextInputController } controller - Called when the position of the insertion cursor is set.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: ?ResourceStr = None, text!: ?ResourceStr = None, controller!: ?TextInputController = None) {
        let tmpPlaceholder = placeholder ?? ""
        let tmpText = text ?? ""
        let tmpController = controller ?? TextInputController()

        var placeHolder = match (tmpPlaceholder) {
            case res: AppResource => getResourceString(res)
            case _ => (tmpPlaceholder as String) ?? ""
        }
        var textStr = match (tmpText) {
            case res: AppResource => getResourceString(res)
            case _ => (tmpText as String) ?? ""
        }
        unsafe {
            try (placeholderCString = LibC.mallocCString(placeHolder).asResource(), textCString = LibC
                .mallocCString(textStr)
                .asResource()) {
                FfiOHOSAceFrameworkTextInputCreate(placeholderCString.value, textCString.value, tmpController.getID())
            }
        }
    }

    protected override func heightInner(width: ?Length): This {
        TextField.height(width)
        this
    }

    protected override func sizeInner(width: ?Length, height: ?Length): This {
        TextField.size(width: width, height: height)
        this
    }

    protected override func paddingInner(value: ?Length): This {
        TextField.padding(value)
        this
    }

    protected override func paddingInner(top: ?Length, right: ?Length, bottom: ?Length, left: ?Length): This {
        TextField.padding(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(top!: ?Length, right!: ?Length, bottom!: ?Length, left!: ?Length): This {
        TextField.margin(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(value: ?Length): This {
        TextField.margin(value)
        this
    }

    /**
     * Set Border Style.
     *
     * @params width: Border width.
     * @params color: Border color.
     * @params radius: Border corner radius.
     * @params style: Border style.
     * @returns Current component instance.
     */
    protected override func borderInner(width: ?Length, color: ?ResourceColor, radius: ?Length, style: ?BorderStyle): This {
        TextField.border(width: width, color: color, radius: radius, style: style)
        this
    }

    protected override func borderWidthInner(width: ?Length): This {
        TextField.borderWidth(width)
        this
    }

    protected override func borderWidthInner(edgeWidths: ?EdgeWidths): This {
        TextField.borderWidth(edgeWidths)
        this
    }

    protected override func borderColorInner(color: ?ResourceColor): This {
        TextField.borderColor(color)
        this
    }

    protected override func borderRadiusInner(radius: ?Length): This {
        TextField.borderRadius(radius)
        this
    }

    protected override func borderRadiusInner(topLeft!: ?Length, topRight!: ?Length,
        bottomLeft!: ?Length, bottomRight!: ?Length): This {
        TextField.borderRadius(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected override func backgroundColorInner(value: ?ResourceColor): This {
        TextField.backgroundColor(value)
        this
    }

    protected override func borderStyleInner(style: ?BorderStyle): This {
        TextField.borderStyle(style)
        this
    }

    /**
     * Called when the type of soft keyboard input button is set.
     *
     * @param { ?EnterKeyType } value - The type of the enter key.
     * @default EnterKeyType.Done.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: ?EnterKeyType): This {
        TextField.enterKeyType(value ?? EnterKeyType.Done)
        this
    }

    /**
     * Called when the text align is set.
     * <br>Available options are TextAlign.Start, TextAlign.Center, and TextAlign.End.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect, top-aligning the text;
     * Alignment.Start, Alignment.Center, and Alignment.End produce the same effect, centered-aligning the text vertically;
     * Alignment.BottomStart, Alignment.Bottom, and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - The placeholder text color.
     * @default TextAlign.Start

     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: ?TextAlign): This {
        TextField.textAlign(value ?? TextAlign.Start)
        this
    }

    /**
     * Called when the overflow mode of the font is set.
     *
     * @param { ?ResourceColor } value - Default value follows the theme. The default value on wearable devices is 0x99ffffff.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.placeholderColor(tmpValue)
        this
    }

    /**
     * Called when the color of the insertion cursor is set.
     *
     * @param { ?ResourceColor } value - The color of the insertion cursor.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(value: ?ResourceColor): This {
        TextField.caretColor(value ?? 0xFF007DFF)
        this
    }

    /**
     * Called when the font property of the placeholder is set.
     *
     * @param { ?Length } size - The font size of the placeholder.
     * @param { ?FontWeight } weight - The font weight of the placeholder.
     * @param { ?String } family - The font family of the placeholder.
     * @param { ?FontStyle } style - The font style of the placeholder.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(size!: ?Length, weight!: ?FontWeight = None, family!: ?String = None,
        style!: ?FontStyle = None): This {
        TextField.placeholderFont(size: size ?? (-1.0).px, weight: weight ?? FontWeight.W400, family: family ?? "", style: style ?? FontStyle.Normal)
        this
    }

    /**
     * Called when the input of maximum text length is set.
     *
     * @param { ?UInt32 } value - Default value is Infinity, indicating that there is no upper limit on the number of characters that can be entered.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLength(value: ?UInt32): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.maxLength(tmpValue)
        this
    }

    /**
     * Called when the font size is set.
     * <br>If fontSize is of the number type, the unit fp is used.
     * <br>The value cannot be a percentage.
     * <br>
     *
     * @param { ?Length } value - The font size.
     * @default 16.fp
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: ?Length): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.fontSize(tmpValue)
        this
    }

    /**
     * Set font color.
     *
     * @param { ?ResourceColor } value - The font color.
     * @default 0xdbffffff
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        TextField.fontColor(value ?? 0xdbffffff)
        this
    }

    /**
     * Set font weight.
     *
     * @param { ?FontWeight } value - The font weight.
     * @default FontWeight.Normal.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        TextField.fontWeight(value ?? FontWeight.Normal)
        this
    }

    /**
     * Set font style.
     *
     * @param { ?FontStyle } value - The font style.
     * @default FontStyle.Normal.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: ?FontStyle): This {
        TextField.fontStyle(value ?? FontStyle.Normal)
        this
    }

    /**
     * Set font family.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ?ResourceStr } value - The font family resource.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        TextField.fontFamily(transResourceStrToString(value ?? "HarmonyOS Sans"))
        this
    }

    /**
     * Set input filter.
     *
     * @param { ?ResourceStr } value - The input filter pattern.
     * @param { ?(String) -> Unit } error - Callback function when input error occurs.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inputFilter(value: ?ResourceStr, error!: ?(String) -> Unit = None): This {
        let errorCallBack = if (let Some(v) <- error) {
            v
        } else {
            {_: String =>}
        }
        TextField.inputFilter(value: transResourceStrToString(value ?? ""), error: errorCallBack)
        this
    }

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - Callback of the listened event.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: ?(EnterKeyType) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onSubmit(tmpCallback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback used to return the copied text content.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onCopy(tmpCallback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Callback function when text is cut from the input.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onCut(tmpCallback)
        this
    }

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit } callback - Callback function when the input text changes.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onChange(tmpCallback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Executed when a paste operation is performed.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onPaste(tmpCallback)
        this
    }

    /**
     * Called when judging whether the text editing change finished.
     *
     * @param { ?(Bool) -> Unit} callback - Callback function when text editing state changes.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onEditChange(tmpCallback)
        this
    }

    /**
     * Define custom keyboard of the text input.
     *
     * @param { ?CustomBuilder } value - Set up a custom keyboard of TextInput.
     * @param { ?Bool } supportAvoidance - Indicates the custom keyboard options of TextInput.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(value: ?CustomBuilder, supportAvoidance!: ?Bool = None): This {
        TextField.customKeyboard(value ?? { => }, supportAvoidance ?? false)
        this
    }

    /**
     * Text input style
     *
     * @param { ?TextInputStyle } value - The text input style.
     * @default TextInputStyle.Default
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(value: ?TextInputStyle): This {
        TextField.style(value ?? TextInputStyle.Default)
        this
    }

    /**
     * Sets whether request keyboard or not when on focus.
     * Sets whether to enable the input method when the TextInput component obtains focus in a way other than clicking.
     *
     * @param { ?Bool } value - Whether to enable the keyboard on focus.
     * @default true
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableKeyboardOnFocus(value: ?Bool): This {
        TextField.enableKeyboardOnFocus(value ?? true)
        this
    }

    /**
     * Controls whether the selection menu pops up.
     *
     * @param { ?Bool } value - Whether to hide the selection menu.
     * @default false
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectionMenuHidden(value: ?Bool): This {
        TextField.selectionMenuHidden(value ?? false)
        this
    }

    /**
     * Define the show underline of the text input.
     *
     * @param { ?Bool } value - Whether to show the underline.
     * @default false.
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showUnderline(value: ?Bool): This {
        TextField.showUnderline(value ?? false)
        this
    }

    /**
     * Define max lines of the text input.
     *
     * @param { ?Int32 } value - Maximum number of lines.
     * @default 3
     * @returns { This } Returns TextInput instance to allow method chaining.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: ?Int32): This {
        TextField.maxLines(value ?? 3)
        this
    }

    // textInput does not need to implement pop function
    protected override func pop(): Unit {}
}
