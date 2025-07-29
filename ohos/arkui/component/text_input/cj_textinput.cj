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

package ohos.arkui.component.text_input

import ohos.arkui.component.common.*
import ohos.arkui.component.text_field.*
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextInputController <: RemoteDataLite {
    @!APILevel[
        12,
        stagemodelonly: true,
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

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretPosition(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerCaretPosition(this.getID(), value)
        }
    }

    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setTextSelection(selectionStart: Int32, selectionEnd: Int32, options!: MenuPolicy = MenuPolicy.Default): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerSetTextSelection(this.getID(), selectionStart, selectionEnd,
                options.getValue());
        }
    }

    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stopEditing(): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextInputControllerStopEditing(this.getID());
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextInput <: ViewBase {
    let textField = TextField()

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TextInput(placeholder!: String = "", text!: String = "",
        controller!: TextInputController = TextInputController()) {
        unsafe {
            var placeholderCString = LibC.mallocCString(placeholder)
            var textCString = LibC.mallocCString(text)
            FfiOHOSAceFrameworkTextInputCreate(placeholderCString, textCString, controller.getID())
            placeholderCString.free()
            textCString.free()
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: AppResource, text!: String = "", controller!: TextInputController = TextInputController()) {
        this(
            placeholder: getResourceString(placeholder),
            text: text,
            controller: controller
        )
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: String = "", text!: AppResource, controller!: TextInputController = TextInputController()) {
        this(
            placeholder: placeholder,
            text: getResourceString(text),
            controller: controller
        )
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(placeholder!: AppResource, text!: AppResource, controller!: TextInputController = TextInputController()) {
        this(
            placeholder: getResourceString(placeholder),
            text: getResourceString(text),
            controller: controller
        )
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(width: Length): This {
        textField.height(width)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func size(width!: Length, height!: Length): This {
        textField.size(width: width, height: height)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func padding(value: Length): This {
        textField.padding(value)
        this
    }

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
     * Set Border Style.
     *
     * @param width: Border width.
     * @param color: Border color.
     * @param radius: Border corner radius.
     * @param style: Border style.
     * @return Current component instance.
     * @attention override.
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
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderWidth(width: Length): This {
        textField.borderWidth(width)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderWidth(edgeWidths: EdgeWidths): This {
        textField.borderWidth(edgeWidths)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func borderColor(color: ResourceColor): This {
        textField.borderColor(color)
        this
    }

    @!APILevel[
        12,
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
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func backgroundColor(value: ResourceColor): This {
        textField.backgroundColor(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func borderStyle(style: BorderStyle): This {
        textField.borderStyle(style)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enterKeyType(value: EnterKeyType): This {
        textField.enterKeyType(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: TextAlign): This {
        textField.textAlign(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setType(value: InputType): This {
        textField.setType(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func placeholderColor(value: ResourceColor): This {
        textField.placeholderColor(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func caretColor(value: ResourceColor): This {
        textField.caretColor(value)
        this
    }

    @!APILevel[
        12,
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
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLength(value: UInt32): This {
        textField.maxLength(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        textField.fontSize(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        textField.fontColor(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        textField.fontWeight(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        textField.fontStyle(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        textField.fontFamily(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: AppResource): This {
        textField.fontFamily(getResourceString(value))
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func inputFilter(value!: String, error!: (String) -> Unit = {_ =>}): This {
        textField.inputFilter(value: value, error: error)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onSubmit(callback: (EnterKeyType) -> Unit): This {
        textField.onSubmit(callback)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (String) -> Unit): This {
        textField.onCopy(callback)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCut(callback: (String) -> Unit): This {
        textField.onCut(callback)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onChange(callback: (String) -> Unit): This {
        textField.onChange(callback)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onPaste(callback: (String) -> Unit): This {
        textField.onPaste(callback)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onEditChange(callback: (Bool) -> Unit): This {
        textField.onEditChange(callback)
        this
    }

    // textInput does not need to implement pop function
    protected override func pop(): Unit {}


    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func customKeyboard(value: () -> Unit, options!: Bool = false): This {
        textField.customKeyboard(value, options)
        this
    }

    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func style(value: TextInputStyle): This {
        textField.style(value)
        this
    }


    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableKeyboardOnFocus(value: Bool): This {
        textField.enableKeyboardOnFocus(value)
        this
    }

    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selectionMenuHidden(value: Bool): This {
        textField.selectionMenuHidden(value)
        this
    }

    @!APILevel[
        15,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showUnderline(value: Bool): This {
        textField.showUnderline(value)
        this
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: Int32): This {
        textField.maxLines(value)
        this
    }
}
