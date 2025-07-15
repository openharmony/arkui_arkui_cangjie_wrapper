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
    func FfiOHOSAceFrameworkTextAreaCreate(placeholder: CString, text: CString, controllerId: Int64): Unit

    func FfiOHOSAceFrameworkTextAreaControllerCtor(): Int64

    func FfiOHOSAceFrameworkTextAreaControllerCaretPosition(selfID: Int64, value: Int32): Unit

    func FfiOHOSAceFrameworkTextAreaControllerStopEditing(selfID: Int64): Unit

    func FfiOHOSAceFrameworkTextAreaControllerSetTextSelection(
        selfID: Int64,
        selectionStart: Int32,
        selectionEnd: Int32,
        options: Int32
    ): Unit

    func FfiOHOSAceFrameworkTextAreaControllerGetTextContentRect(id: Int64): CJRectResult

    func FfiOHOSAceFrameworkTextAreaControllerGetTextContentLineCount(id: Int64): Int32

    func FfiOHOSAceFrameworkTextAreaControllerGetCaretOffset(id: Int64): CJCaretOffset
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum TextAreaType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NORMAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    PHONE_NUMBER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    EMAIL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    NUMBER_DECIMAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    URL
    | ...

    func getValue(): Int32 {
        match (this) {
            case NORMAL => 0
            case NUMBER => 2
            case PHONE_NUMBER => 3
            case EMAIL => 5
            case NUMBER_DECIMAL => 12
            case URL => 13
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectionOptions {
    var menuPolicy: MenuPolicy = MenuPolicy.Default
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(menuPolicy!: MenuPolicy = MenuPolicy.Default) {
        this.menuPolicy = menuPolicy
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextAreaController <: RemoteDataLite {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopEditing(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextAreaControllerStopEditing(this.getID())
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTextSelection(
        selectionStart: Int32,
        selectionEnd: Int32,
        options!: SelectionOptions = SelectionOptions()
    ): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextAreaControllerSetTextSelection(
                this.getID(),
                selectionStart,
                selectionEnd,
                options.menuPolicy.getValue()
            )
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: Int32) {
        unsafe {
            FfiOHOSAceFrameworkTextAreaControllerCaretPosition(this.getID(), value)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getTextContentRect(): CJRectResult {
        return unsafe {
            FfiOHOSAceFrameworkTextAreaControllerGetTextContentRect(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getTextContentLineCount(): Int32 {
        return unsafe {
            FfiOHOSAceFrameworkTextAreaControllerGetTextContentLineCount(this.getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getCaretOffset(): CJCaretOffset {
        return unsafe {
            FfiOHOSAceFrameworkTextAreaControllerGetCaretOffset(this.getID())
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
public open class TextArea <: ViewBase {
    let textField = TextField()
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: String = "", text!: String = "", controller!: TextAreaController = TextAreaController()) {
        unsafe {
            var placeholderCString = LibC.mallocCString(placeholder)
            var textCString = LibC.mallocCString(text)
            FfiOHOSAceFrameworkTextAreaCreate(placeholderCString, textCString, controller.getID())
            LibC.free(placeholderCString)
            LibC.free(textCString)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: AppResource, text!: String = "", controller!: TextAreaController = TextAreaController()) {
        this(
            placeholder: getResourceString(placeholder),
            text: text,
            controller: controller
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: String = "", text!: AppResource, controller!: TextAreaController = TextAreaController()) {
        this(
            placeholder: placeholder,
            text: getResourceString(text),
            controller: controller
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: AppResource, text!: AppResource, controller!: TextAreaController = TextAreaController()) {
        this(
            placeholder: getResourceString(placeholder),
            text: getResourceString(text),
            controller: controller
        )
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(width: Length): This {
        textField.height(width)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        textField.size(width: width, height: height)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func padding(value: Length): This {
        textField.padding(value)
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
        textField.padding(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(top!: Length, right!: Length, bottom!: Length, left!: Length): This {
        textField.margin(top: top, right: right, bottom: bottom, left: left)
        this
    }

    protected override func marginInner(value: Length): This {
        textField.margin(value)
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
        textField.border(width: width, color: color, radius: radius, style: style)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderWidth(width: Length): This {
        textField.borderWidth(width)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderWidth(edgeWidths: EdgeWidths): This {
        textField.borderWidth(edgeWidths)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderColor(color: ResourceColor): This {
        textField.borderColor(color)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderRadius(radius: Length): This {
        textField.borderRadius(radius)
        this
    }

    protected override func borderRadiusInner(
        topLeft!: Length = 0.vp,
        topRight!: Length = 0.vp,
        bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp
    ): This {
        textField.borderRadius(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft, bottomRight: bottomRight)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderStyle(style: BorderStyle): This {
        textField.borderStyle(style)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(value: ResourceColor): This {
        textField.placeholderColor(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func backgroundColor(value: ResourceColor): This {
        textField.backgroundColor(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(value: ResourceColor): This {
        textField.caretColor(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderFont(size!: Length, weight!: FontWeight = FontWeight.W400, family!: String = "",
        style!: FontStyle = FontStyle.Normal): This {
        textField.placeholderFont(size: size, weight: weight, family: family, style: style)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: TextAlign): This {
        textField.textAlign(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        textField.fontSize(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        textField.fontColor(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        textField.fontWeight(value)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        textField.fontStyle(value)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        textField.fontFamily(value)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: AppResource): This {
        textField.fontFamily(getResourceString(value))
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: EnterKeyType): This {
        textField.enterKeyType(value)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inputFilter(value!: String, error!: (String) -> Unit = {_ =>}): This {
        textField.inputFilter(value: value, error: error)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLength(value: UInt32): This {
        textField.maxLength(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFeature(value: String): This {
        textField.fontFeature(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineHeight(value: Length): This {
        textField.lineHeight(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineSpacing(value: Length): This {
        textField.lineSpacing(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: Length): This {
        textField.letterSpacing(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(
        `type`!: TextDecorationType,
        color!: ResourceColor = Color.BLACK,
        style!: TextDecorationStyle = TextDecorationStyle.SOLID
    ): This {
        textField.decoration(`type`, color, style)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineBreakStrategy(value: LineBreakStrategy): This {
        textField.lineBreakStrategy(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func wordBreak(value: WordBreak): This {
        textField.wordBreak(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func heightAdaptivePolicy(value: TextHeightAdaptivePolicy): This {
        textField.heightAdaptivePolicy(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxFontSize(value: Length): This {
        textField.maxFontSize(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minFontSize(value: Length): This {
        textField.minFontSize(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectedBackgroundColor(value: ResourceColor): This {
        textField.selectedBackgroundColor(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretStyle(value: Length, color: ResourceColor): This {
        textField.caretStyle(value, color)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textIndent(value: Length): This {
        textField.textIndent(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textOverflow(value: TextOverflow): This {
        textField.textOverflow(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enablePreviewText(value: Bool): This {
        textField.enablePreviewText(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(value: TextContentStyle): This {
        textField.style(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func barState(value: BarState): This {
        textField.barState(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectionMenuHidden(value: Bool): This {
        textField.selectionMenuHidden(value)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showCounter(value!: Bool, thresholdPercentage!: Float64 = 0.0, highlightBorder!: Bool = true): This {
        textField.showCounter(value, thresholdPercentage, highlightBorder)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: Int32): This {
        textField.maxLines(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableKeyboardOnFocus(value: Bool): This {
        textField.enableKeyboardOnFocus(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contentType(value: ContentType): This {
        textField.contentType(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableAutoFill(value: Bool): This {
        textField.enableAutoFill(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func `type`(value: TextAreaType): This {
        textField.setType(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOption(value: CopyOptions): This {
        textField.copyOption(value)
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(value: () -> Unit, options!: Bool = false): This {
        textField.customKeyboard(value, options)
        this
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: (EnterKeyType) -> Unit): This {
        textField.onSubmit(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (String) -> Unit): This {
        textField.onChange(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (String) -> Unit): This {
        textField.onCopy(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: (String) -> Unit): This {
        textField.onCut(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: (String) -> Unit): This {
        textField.onPaste(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChanged(callback: (Bool) -> Unit): This {
        textField.onEditChanged(callback)
        this
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChange(callback: (Bool) -> Unit): This {
        textField.onEditChange(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onContentScroll(callback: (Float32, Float32) -> Unit): This {
        textField.onContentScroll(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onTextSelectionChange(callback: (Int32, Int32) -> Unit): This {
        textField.onTextSelectionChange(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidDelete(callback: (Float64, Int32, String) -> Unit): This {
        textField.onDidDelete(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillDelete(callback: (Float64, Int32, String) -> Bool): This {
        textField.onWillDelete(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onDidInsert(callback: (Float64, String) -> Unit): This {
        textField.onDidInsert(callback)
        this
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onWillInsert(callback: (Float64, String) -> Bool): This {
        textField.onWillInsert(callback)
        this
    }

    // textInput does not need to implement pop function
    protected override func pop(): Unit {}
}
