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

package ohos.arkui.component.text_area

import ohos.arkui.component.common.{CommonMethodComponent, FontWeight, FontStyle, TextAlign, EnterKeyType, BorderStyle, EdgeWidths}
import ohos.arkui.component.text_field.{TextField}
import ohos.arkui.component.util.{transResourceStrToString}
import ohos.ffi.{RemoteDataLite, releaseFFIData}
import ohos.base.{ResourceStr, ResourceColor, Length, LengthProp, Color}
import ohos.resource.{AppResource, getResourceString}
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkTextAreaCreate(placeholder: CString, text: CString, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextAreaControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextAreaControllerCaretPosition(selfID: Int64, value: Int32): Unit

    func FfiOHOSAceFrameworkTextAreaControllerStopEditing(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextAreaControllerSetTextSelection(selfID: Int64, selectionStart: Int32,
        selectionEnd: Int32, options: Int32): Unit

    func FfiOHOSAceFrameworkTextAreaControllerGetTextContentLineCount(id: Int64): Int32
}

/**
 * Provides the method of switching the cursor position.
 * TextAreaController allows you to control the caret position in a TextArea component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextAreaController <: RemoteDataLite {

    /**
     * TextAreaController constructor.
     * Creates a new instance of TextAreaController.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        super(unsafe {
            FfiOHOSAceFrameworkTextAreaControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Set caret position.
     *
     * @param { ?Int32 } value  - Length from the start of the string to the position where the caret is located.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: ?Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextAreaControllerCaretPosition(this.getID(), value ?? 0)
        }
    }
}

/**
 * Defines the options of TextArea.
 * TextArea is a multi-line text input component that allows users to input and edit text.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextArea <: CommonMethodComponent<TextArea> & TextAreaAttribute {
    /**
     * The TextArea constructor.
     *
     * @param { ?ResourceStr } [placeholder] - The place holder text string. Text displayed when there is no input.
     * @param { ?ResourceStr } [text] - Sets the current value of TextArea.
     * @param { ?TextAreaController } [controller] - Called when the position of the insertion cursor is set.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: ?ResourceStr = None, text!: ?ResourceStr = None,
        controller!: ?TextAreaController = None) {
        let tmpPlaceholder = placeholder ?? ""
        let tmpText = text ?? ""
        let tmpController = controller ?? TextAreaController()

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
                FfiOHOSAceFrameworkTextAreaCreate(placeholderCString.value, textCString.value, tmpController.getID())
            }
        }
    }

    /**
     * Set caret color.
     *
     * @param { ?ResourceColor } value - The caret color resource.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(value: ?ResourceColor): This {
        TextField.caretColor(value ?? 0xFF007DFF)
        this
    }

    /**
     * Set placeholder font.
     * The 'HarmonyOS Sans' font and registered custom fonts are supported.
     *
     * @param { ?Length } size - Font size of the placeholder text.
     * @param { ?FontWeight } [weight] - Font weight of the placeholder text.
     * @param { ?String } [family] - Font family of the placeholder text.
     * @param { ?FontStyle } [style] - Font style of the placeholder text.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(size!: ?Length, weight!: ?FontWeight = None, family!: ?String = None,
        style!: ?FontStyle = None): This {
        TextField.placeholderFont(size: size ?? 16.0.fp, weight: weight ?? FontWeight.W400, family: family ?? "", style: style ?? FontStyle.Normal)
        this
    }

    /**
     * Set text align.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect,
     * top-aligning the text; Alignment.Start, Alignment.Center, and Alignment.End produce the same effect,
     * centered-aligning the text vertically; Alignment.BottomStart, Alignment.Bottom,
     * and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { ?TextAlign } value - Horizontal alignment of the text.
     * @default TextAlign.Start
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: ?TextAlign): This {
        TextField.textAlign(value ?? TextAlign.Start)
        this
    }

    /**
     * Set font size.
     *
     * @param { ?Length } value - Font size of the text.
     * @default 16.fp
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?ResourceColor } value - Color of the text.
     * @default 0xe6182431
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.fontColor(tmpValue)
        this
    }

    /**
     * Set font weight.
     *
     * @param { ?FontWeight } value - Weight of the font.
     * @default FontWeight.Normal
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: ?FontWeight): This {
        TextField.fontWeight(value ?? FontWeight.Normal)
        this
    }

    /**
     * Set font style.
     *
     * @param { ?FontStyle } value - Style of the font.
     * @default FontStyle.Normal
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?ResourceStr } value - Font family name.
     * @default 'HarmonyOS Sans'
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ?ResourceStr): This {
        TextField.fontFamily(transResourceStrToString(value ?? "HarmonyOS Sans"))
        this
    }

    /**
     * Set enter key type.
     *
     * @param { ?EnterKeyType } value - Type of the enter key.
     * @default EnterKeyType.NewLine
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: ?EnterKeyType): This {
        TextField.enterKeyType(value ?? EnterKeyType.NewLine)
        this
    }

    /**
     * Set input filter.
     *
     * @param { ?ResourceStr } value - Regular expression pattern for input filtering.
     * @param { ?(String) -> Unit } [error] - Callback function executed when input doesn't match the pattern.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inputFilter(value!: ?ResourceStr, error!: ?(String) -> Unit = None): This {
        let errorCallBack = if (let Some(v) <- error) {
            v
        } else {
            { _: String => }
        }
        TextField.inputFilter(value: transResourceStrToString(value ?? ""), error: errorCallBack)
        this
    }

    /**
     * Define the max length content of the text area.
     * <br>By default, there is no maximum number of characters.
     * <br>When the maximum number of characters is reached,
     * no more characters can be entered, and the border turns red.
     *
     * @param { ?UInt32 } value - Maximum number of characters allowed.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLength(value: ?UInt32): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.maxLength(tmpValue)
        this
    }

    /**
     * Set placeholder color.
     *
     * @param { ?ResourceColor } value - Color of the placeholder text.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(value: ?ResourceColor): This {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        TextField.placeholderColor(tmpValue)
        this
    }

    /**
     * Called when submitted.
     *
     * @param { ?(EnterKeyType) -> Unit } callback - Callback function executed when the enter key is pressed.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: ?(EnterKeyType) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onSubmit(tmpCallback)
        this
    }

    /**
     * Called when the input of the input box changes.
     *
     * @param { ?(String) -> Unit }  callback - Callback function executed when the text content changes.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?(String) -> Unit } callback - Callback function executed when copy operation is performed.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
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
     * @param { ?(String) -> Unit } callback - Callback function executed when cut operation is performed.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onCut(tmpCallback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { ?(String) -> Unit } callback - Executed when a paste operation is performed.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: ?(String) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onPaste(tmpCallback)
        this
    }

    /**
     * Called when judging whether the text editing change finished.
     * The text box is in the editing state when it has the caret placed in it, and is in the non-editing state otherwise.
     *
     * @param { ?(Bool) -> Unit} callback - Triggered when the text area status changes.
     * @returns { This } - Returns the component instance itself for method chaining.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChange(callback: ?(Bool) -> Unit): This {
        let tmpCallback = callback ?? { _ => }
        TextField.onEditChange(tmpCallback)
        this
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

    /**
     * Sets the paddingInner of the TextArea.
     *
     * @params top: Sets the top of paddingInner.
     * @params right: Sets the right of paddingInner.
     * @params bottom: Sets the bottom of paddingInner.
     * @params left: Sets the left of paddingInner.
     * @returns TextArea instance.
     */
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
     * Sets the borderInner of the TextArea.
     *
     * @params width: Sets the width of borderInner.
     * @params color: Sets the color of borderInner.
     * @params radius: Sets the radius of borderInner.
     * @params style: Sets the style of borderInner.
     * @returns TextArea instance.
     */
    protected override func borderInner(
        width: ?Length,
        color: ?ResourceColor,
        radius: ?Length,
        style: ?BorderStyle
    ): This {
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

    protected override func borderRadiusInner(
        topLeft!: ?Length,
        topRight!: ?Length,
        bottomLeft!: ?Length,
        bottomRight!: ?Length
    ): This {
        TextField.borderRadius(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected override func borderStyleInner(style: ?BorderStyle): This {
        TextField.borderStyle(style)
        this
    }

    protected override func backgroundColorInner(value: ?ResourceColor): This {
        TextField.backgroundColor(value ?? Color.Transparent)
        this
    }
    // textInput does not need to implement pop function
    protected override func pop(): Unit {}
}
