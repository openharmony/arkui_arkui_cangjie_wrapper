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

package ohos.arkui.component.text_area

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
import ohos.arkui.component.util.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource.*
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
 *
 * @relation declare class TextAreaController extends TextContentControllerBase
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextAreaController <: RemoteDataLite {

    /**
     * constructor.
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
            FfiOHOSAceFrameworkTextAreaControllerCtor()
        })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Called when the position of the insertion cursor is set.
     *
     * @param { Int32 } value  - Length from the start of the string to the position where the caret is located.
     * @relation caretPosition(value: number): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextAreaControllerCaretPosition(this.getID(), value)
        }
    }
}

/**
 * Defines the options of TextArea.
 *
 * @relation declare interface TextAreaOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextArea <: ViewBase {
    /**
     * Called when writing multiple lines of text.
     *
     * @param { ResourceStr } placeholder - The place holder text string. Text displayed when there is no input.
     * @param { ResourceStr } text - Sets the current value of TextArea.
     * @param { TextAreaController } controller - Called when the position of the insertion cursor is set.
     * @relation (value?: TextAreaOptions): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: ResourceStr = "", text!: ResourceStr = "",
        controller!: TextAreaController = TextAreaController()) {
        var placeHolder = match (placeholder) {
            case res: AppResource => getResourceString(res)
            case _ => (placeholder as String) ?? ""
        }
        var textStr = match (text) {
            case res: AppResource => getResourceString(res)
            case _ => (text as String) ?? ""
        }
        unsafe {
            try (placeholderCString = LibC.mallocCString(placeHolder).asResource(), textCString = LibC
                .mallocCString(textStr)
                .asResource()) {
                FfiOHOSAceFrameworkTextAreaCreate(placeholderCString.value, textCString.value, controller.getID())
            }
        }
    }

    /**
     * Called when the color of the insertion cursor is set.
     *
     * @param { ResourceColor } value
     * @returns { This }
     * @relation caretColor(value: ResourceColor): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(value: ResourceColor): This {
        TextField.caretColor(value)
        this
    }

    /**
     * Called when the font property of the placeholder is set.
     * The 'HarmonyOS Sans' font and registered custom fonts are supported.
     *
     * @returns { This }
     * @relation placeholderFont(value?: Font): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(size!: Length, weight!: FontWeight = FontWeight.W400, family!: String = "",
        style!: FontStyle = FontStyle.Normal): This {
        TextField.placeholderFont(size: size, weight: weight, family: family, style: style)
        this
    }

    /**
     * Called when the text align is set.
     * <br>To set vertical alignment for the text, use the align attribute.
     * <br>The align attribute alone does not control the horizontal position of the text.
     * <br>In other words, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd produce the same effect,
     * top-aligning the text; Alignment.Start, Alignment.Center, and Alignment.End produce the same effect,
     * centered-aligning the text vertically; Alignment.BottomStart, Alignment.Bottom,
     * and Alignment.BottomEnd produce the same effect, bottom-aligning the text.
     *
     * @param { TextAlign } value - Default value is TextAlign.Start.
     * @returns { This }
     * @relation textAlign(value: TextAlign): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: TextAlign): This {
        TextField.textAlign(value)
        this
    }

    /**
     * Called when the font size is set.
     *
     * @param { Length } value - Default value is 16.fp. If fontSize is of the number type, the unit fp is used. This parameter cannot be set in percentage.
     * @returns { This }
     * @relation fontSize(value: Length): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        TextField.fontSize(value)
        this
    }

    /**
     * Called when the font color is set.
     * @param { ResourceColor } value
     * @returns { This }
     * @relation fontColor(value: ResourceColor): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        TextField.fontColor(value)
        this
    }

    /**
     * Called when the font weight is set.
     *
     * @param { FontWeight } value - Default value is FontWeight.Normal.
     * @returns { This }
     * @relation fontWeight(value: number | FontWeight | ResourceStr): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        TextField.fontWeight(value)
        this
    }

    /**
     * Called when the font style of a font is set.
     *
     * @param { FontStyle } value - Default value is FontStyle.Normal.
     * @returns { This }
     * @relation fontStyle(value: FontStyle): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        TextField.fontStyle(value)
        this
    }

    /**
     * Called when the font list of text is set.
     * <br>Default font: 'HarmonyOS Sans'
     * <br>The 'HarmonyOS Sans' font and registered custom fonts are supported for applications.
     * <br>Only the 'HarmonyOS Sans' font is supported for widgets.
     *
     * @param { ResourceStr } value - Default value is 'HarmonyOS Sans'.
     * @returns { This }
     * @relation fontFamily(value: ResourceStr): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: ResourceStr): This {
        TextField.fontFamily(transResourceStrToString(value))
        this
    }

    /**
     * Called when the type of soft keyboard input button is set.
     *
     * @param { EnterKeyType } value - Default value is Default value is EnterKeyType.NewLine.
     * @returns { This }
     * @relation enterKeyType(value: EnterKeyType): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: EnterKeyType): This {
        TextField.enterKeyType(value)
        this
    }

    /**
     * Called when the inputFilter of text is set.
     *
     * @param { ResourceStr } value
     * @param { (String) -> Unit } error
     * @returns { This }
     * @relation inputFilter(value: ResourceStr, error?: (value: string) => void): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inputFilter(value!: ResourceStr, error!: ?(String) -> Unit = None): This {
        let errorCallBack = if (let Some(v) <- error) {
            v
        } else {
            {_: String =>}
        }
        TextField.inputFilter(value: transResourceStrToString(value), error: errorCallBack)
        this
    }

    /**
     * Define the max length content of the text area.
     * <br>By default, there is no maximum number of characters.
     * <br>When the maximum number of characters is reached,
     * no more characters can be entered, and the border turns red.
     *
     * @param { UInt32 } value
     * @returns { This }
     * @relation maxLength(value: number): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLength(value: UInt32): This {
        TextField.maxLength(value)
        this
    }

    /**
     * Called when the color of the placeholder is set.
     *
     * @param { ResourceColor } value - Default value follows the theme.
     * @returns { This }
     * @relation placeholderColor(value: ResourceColor): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(value: ResourceColor): This {
        TextField.placeholderColor(value)
        this
    }

    /**
     * Called when submitted.
     *
     * @param { (EnterKeyType) -> Unit } callback - If it is EnterKeyType.NEW_LINE and the text box is in inline input style, onSubmit is not triggered.
     * @returns { This }
     * @relation onSubmit(callback: (enterKey: EnterKeyType) => void): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: (EnterKeyType) -> Unit): This {
        TextField.onSubmit(callback)
        this
    }

    /**
     * Called when the input of the input box changes.
     *
     * @param { (String) -> Unit }  callback
     * @returns { This }
     * @relation onChange(callback: EditableTextOnChangeCallback): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (String) -> Unit): This {
        TextField.onChange(callback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit }  callback
     * @returns { This }
     * @relation onCopy(callback: (value: string) => void): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (String) -> Unit): This {
        TextField.onCopy(callback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit }  callback
     * @returns { This }
     * @relation onCut(callback: (value: string) => void): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: (String) -> Unit): This {
        TextField.onCut(callback)
        this
    }

    /**
     * Called when using the Clipboard menu.
     *
     * @param { (String) -> Unit } callback - Executed when a paste operation is performed.
     * @returns { This }
     * @relation onPaste(callback: OnPasteCallback): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: (String) -> Unit): This {
        TextField.onPaste(callback)
        this
    }

    /**
     * Called when judging whether the text editing change finished.
     * The text box is in the editing state when it has the caret placed in it, and is in the non-editing state otherwise.
     *
     * @param { (Bool) -> Unit} callback - Triggered when the text area status changes.
     * @returns { This }
     * @relation onEditChange(callback: (isEditing: boolean) => void): TextAreaAttribute;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChange(callback: (Bool) -> Unit): This {
        TextField.onEditChange(callback)
        this
    }

    protected override func heightInner(width: Length): This {
        TextField.height(width)
        this
    }

    protected override func sizeInner(width: Length, height: Length): This {
        TextField.size(width: width, height: height)
        this
    }

    protected override func paddingInner(value: Length): This {
        TextField.padding(value)
        this
    }

    /**
     * Sets the paddingInner of the TextArea.
     *
     * @param top: Sets the top of paddingInner.
     * @param right: Sets the right of paddingInner.
     * @param bottom: Sets the bottom of paddingInner.
     * @param left: Sets the left of paddingInner.
     * @return TextArea instance.
     * @since 11
     */
    protected override func paddingInner(top: Length, right: Length, bottom: Length, left: Length): This {
        TextField.padding(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length): This {
        TextField.margin(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(value: Length): This {
        TextField.margin(value)
        this
    }

    /**
     * Sets the borderInner of the TextArea.
     *
     * @param width: Sets the width of borderInner.
     * @param color: Sets the color of borderInner.
     * @param radius: Sets the radius of borderInner.
     * @param style: Sets the style of borderInner.
     * @return TextArea instance.
     * @since 11
     */
    protected override func borderInner(
        width: Length,
        color: ResourceColor,
        radius: Length,
        style: BorderStyle
    ): This {
        TextField.border(width: width, color: color, radius: radius, style: style)
        this
    }

    protected override func borderWidthInner(width: Length): This {
        TextField.borderWidth(width)
        this
    }

    protected override func borderWidthInner(edgeWidths: EdgeWidths): This {
        TextField.borderWidth(edgeWidths)
        this
    }

    protected override func borderColorInner(color: ResourceColor): This {
        TextField.borderColor(color)
        this
    }

    protected override func borderRadiusInner(radius: Length): This {
        TextField.borderRadius(radius)
        this
    }

    protected override func borderRadiusInner(
        topLeft!: Length = 0.vp,
        topRight!: Length = 0.vp,
        bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp
    ): This {
        TextField.borderRadius(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    protected override func borderStyleInner(style: BorderStyle): This {
        TextField.borderStyle(style)
        this
    }

    protected override func backgroundColorInner(value: ResourceColor): This {
        TextField.backgroundColor(value)
        this
    }
    // textInput does not need to implement pop function
    protected override func pop(): Unit {}
}
