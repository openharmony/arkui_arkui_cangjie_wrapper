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
    func FfiOHOSAceFrameworkTextFieldSetHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetSize(width: Float64, widthUnit: Int32, height: Float64, heightUnit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetPadding(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetPaddings(params: CJEdge): Unit

    func FfiOHOSAceFrameworkTextFieldSetMargin(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetMargins(params: CJEdge): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorder(params: CJBorder): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorderWidth(width: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorderWidthWithCJEdge(params: CJEdge): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorderColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorderRadius(radius: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetAllBorderRadius(value: CJBorderRadius): Unit

    func FfiOHOSAceFrameworkTextFieldSetBorderStyle(style: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetPlaceholderColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetCaretColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetBackgroundColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetPlaceholderFont(
        size: Float64,
        unit: Int32,
        weight: CString,
        family: CString,
        style: Int32
    ): Unit

    func FfiOHOSAceFrameworkTextFieldSetFont(
        size: Float64,
        unit: Int32,
        weight: CString,
        family: CString,
        style: Int32
    ): Unit

    func FfiOHOSAceFrameworkTextFieldSetEnterKeyType(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetType(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetTextAlign(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetMaxLength(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontFamily(value: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontWeight(value: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetInputFilter(value: CString, error: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnSubmit(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnSubmitWithEvent(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnCopy(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnPaste(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnCut(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnEditChanged(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldSetFontFeature(value: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetLineHeight(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetLineSpacing(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetLetterSpacing(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetDecoration(value: Int32, color: UInt32, style: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetLineBreakStrategy(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetWordBreak(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetHeightAdaptivePolicy(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetMaxFontSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetMinFontSize(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetSelectedBackgroundColor(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetCaretStyle(value: Float64, unit: Int32, color: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldSetTextIndent(value: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetTextOverflow(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetEnablePreviewText(value: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetStyle(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetBarState(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetSelectionMenuHidden(value: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetShowCounter(
        value: Bool,
        thresholdPercentage: Int32,
        highlightBorder: Bool
    ): Unit

    func FfiOHOSAceFrameworkTextFieldSetMaxLines(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetEnableKeyboardOnFocus(value: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetContentType(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetEnableAutoFill(value: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetTextAreaType(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetCopyOption(value: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetCustomKeyboard(value: Int64, options: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldEditorMenuOptions(onCreateMenu: Int64, onMenuItemClick: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnContentScroll(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnTextSelectionChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnDidDelete(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnWillDelete(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnDidInsert(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnWillInsert(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldOnSecurityStateChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldShowUnit(builder: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldSetPasswordRules(rules: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetShowError(errorText: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetShowPasswordIcon(isShow: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldShowPasswordText(isShow: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetPasswordIcon(onIconSrc: CString, offIconSrc: CString): Unit

    func FfiOHOSAceFrameworkTextFieldSetCaretPosition(position: Int32): Unit

    func FfiOHOSAceFrameworkTextFieldSetSelectAllValue(value: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldSetShowUnderline(isShow: Bool): Unit

    func FfiOHOSAceFrameworkTextFieldNormalUnderlineColor(color: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldUserUnderlineColor(typing: UInt32, normal: UInt32, error: UInt32, disable: UInt32): Unit

    func FfiOHOSAceFrameworkTextFieldCancelButton(style: Int32, size: Float64, unit: Int32, color: UInt32, src: CString): Unit

    func FfiOHOSAceFrameworkTextFieldOnChangePreviewText(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextFieldEditMenuOptions(callbackOnCreateMenu: Int64, callbackOnMenuItemClick: Int64): Unit
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SubmitEvent {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var text: String
    private var keepEditable: Bool

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {
        this.text = ""
        this.keepEditable = false
    }

    init(text: String, keepEditable: Bool) {
        this.text = text
        this.keepEditable = keepEditable
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func keepEditableState(): Unit {
        this.keepEditable = true
    }

    func IsKeepEditableState(): Bool {
        return this.keepEditable
    }
}

@C
struct CJSubmitEvent {
    CJSubmitEvent(
        var text: CString,
        var keepEditable: Bool
    ) {}
    func toSubmitEvent(): SubmitEvent {
        SubmitEvent(this.text.toString(), this.keepEditable)
    }
}

struct TextField {
    func height(width: Length): Unit {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetHeight(width_.value, width_.unitType.getValue())
        }
    }

    func size(width!: Length, height!: Length): Unit {
        var width_ = transAppResourceToLength(width)
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetSize(
                width_.value,
                width_.unitType.getValue(),
                height_.value,
                height_.unitType.getValue()
            )
        }
    }

    func padding(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetPadding(value_.value, value_.unitType.getValue())
        }
    }

    func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): Unit {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetPaddings(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
    }

    func margin(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMargin(value_.value, value_.unitType.getValue())
        }
    }

    func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): Unit {
        var top_ = transAppResourceToLength(top)
        var right_ = transAppResourceToLength(right)
        var bottom_ = transAppResourceToLength(bottom)
        var left_ = transAppResourceToLength(left)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMargins(
                CJEdge(
                    top_.value,
                    top_.unitType.getValue(),
                    right_.value,
                    right_.unitType.getValue(),
                    bottom_.value,
                    bottom_.unitType.getValue(),
                    left_.value,
                    left_.unitType.getValue()
                )
            )
        }
    }

    func border(
        width!: Length,
        color!: ResourceColor = Color.BLACK,
        radius!: Length = 0.vp,
        style!: BorderStyle = BorderStyle.Solid
    ): Unit {
        var width_ = transAppResourceToLength(width)
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color),
                    radius_.value,
                    radius_.unitType.getValue(),
                    style.getValue()
                )
            )
        }
    }

    func borderWidth(width: Length): Unit {
        var width_ = transAppResourceToLength(width)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderWidth(width_.value, width_.unitType.getValue())
        }
    }

    func borderWidth(edgeWidths: EdgeWidths): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderWidthWithCJEdge(
                CJEdge(
                    edgeWidths.top.value,
                    edgeWidths.top.unitType.getValue(),
                    edgeWidths.right.value,
                    edgeWidths.right.unitType.getValue(),
                    edgeWidths.bottom.value,
                    edgeWidths.bottom.unitType.getValue(),
                    edgeWidths.left.value,
                    edgeWidths.left.unitType.getValue()
                )
            )
        }
    }

    func borderColor(color: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderColor(transAppResourceToResourceColor(color))
        }
    }

    func borderRadius(radius: Length): Unit {
        var radius_ = transAppResourceToLength(radius)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderRadius(radius_.value, radius_.unitType.getValue())
        }
    }

    func borderRadius(
        topLeft!: Length = 0.vp,
        topRight!: Length = 0.vp,
        bottomLeft!: Length = 0.vp,
        bottomRight!: Length = 0.vp
    ): Unit {
        var topLeft_ = transAppResourceToLength(topLeft)
        var topRight_ = transAppResourceToLength(topRight)
        var bottomLeft_ = transAppResourceToLength(bottomLeft)
        var bottomRight_ = transAppResourceToLength(bottomRight)
        unsafe {
            let value = CJBorderRadius(
                topLeft_.value,
                topLeft_.unitType.getValue(),
                topRight_.value,
                topRight_.unitType.getValue(),
                bottomLeft_.value,
                bottomLeft_.unitType.getValue(),
                bottomRight_.value,
                bottomRight_.unitType.getValue()
            )
            FfiOHOSAceFrameworkTextFieldSetAllBorderRadius(value)
        }
    }

    func borderStyle(style: BorderStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderStyle(style.getValue())
        }
    }

    func enterKeyType(value: EnterKeyType): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnterKeyType(value.getValue())
        }
    }

    func textAlign(value: TextAlign): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetTextAlign(value.getValue())
        }
    }

    func setType(value: InputType): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetType(value.getValue())
        }
    }

    func placeholderColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetPlaceholderColor(transAppResourceToResourceColor(value))
        }
    }

    func caretColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCaretColor(transAppResourceToResourceColor(value))
        }
    }

    func placeholderFont(
        size!: Length,
        weight!: FontWeight = FontWeight.W400,
        family!: String = "",
        style!: FontStyle = FontStyle.Normal
    ): Unit {
        var size_ = transAppResourceToLength(size)
        var styleInt = style.getValue()

        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                familyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkTextFieldSetPlaceholderFont(
                    size_.value,
                    size_.unitType.getValue(),
                    weightCString.value,
                    familyCString.value,
                    styleInt
                )
            }
        }
    }

    func maxLength(value: UInt32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMaxLength(value)
        }
    }

    func fontSize(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
    }

    func fontColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetFontColor(transAppResourceToResourceColor(value))
        }
    }

    func fontWeight(value: FontWeight): Unit {
        unsafe {
            var weightCString = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkTextFieldSetFontWeight(weightCString)
            weightCString.free()
        }
    }

    func fontStyle(value: FontStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetFontStyle(value.getValue())
        }
    }
    func fontFamily(value: String): Unit {
        unsafe {
            var familyCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetFontFamily(familyCString)
            LibC.free(familyCString)
        }
    }

    func inputFilter(value!: String, error!: (String) -> Unit = {_ =>}): Unit {
        let lambdaData = Callback1Param<CString, Unit>({
            value: CString => error(value.toString())
        })
        unsafe {
            var valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetInputFilter(valueCString, lambdaData.getID())
            valueCString.free()
        }
    }

    func backgroundColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBackgroundColor(transAppResourceToResourceColor(value))
        }
    }

    func fontFeature(value: String): Unit {
        unsafe {
            var featureCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetFontFeature(featureCString)
            LibC.free(featureCString)
        }
    }

    func lineHeight(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetLineHeight(value_.value, value_.unitType.getValue())
        }
    }

    func lineSpacing(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetLineSpacing(value_.value, value_.unitType.getValue())
        }
    }

    func letterSpacing(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetLetterSpacing(value_.value, value_.unitType.getValue())
        }
    }

    func decoration(value: TextDecorationType, color: ResourceColor, style: TextDecorationStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetDecoration(value.getValue(), transAppResourceToResourceColor(color),
                style.getValue())
        }
    }

    func lineBreakStrategy(value: LineBreakStrategy): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetLineBreakStrategy(value.getValue())
        }
    }

    func wordBreak(value: WordBreak): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetWordBreak(value.getValue())
        }
    }

    func heightAdaptivePolicy(value: TextHeightAdaptivePolicy): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetHeightAdaptivePolicy(value.getValue())
        }
    }

    func maxFontSize(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMaxFontSize(value_.value, value_.unitType.getValue())
        }
    }

    func minFontSize(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMinFontSize(value_.value, value_.unitType.getValue())
        }
    }

    func selectedBackgroundColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetSelectedBackgroundColor(transAppResourceToResourceColor(value))
        }
    }

    func caretStyle(value: Length, color: ResourceColor): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCaretStyle(value_.value, value_.unitType.getValue(),
                transAppResourceToResourceColor(color))
        }
    }

    func textIndent(value: Length): Unit {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetTextIndent(value_.value, value_.unitType.getValue())
        }
    }

    func textOverflow(value: TextOverflow): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetTextOverflow(value.getValue())
        }
    }

    func enablePreviewText(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnablePreviewText(value)
        }
    }

    func style(value: TextContentStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetStyle(value.getValue())
        }
    }

    func style(value: TextInputStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetStyle(value.getValue())
        }
    }

    func barState(value: BarState): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBarState(value.getValue())
        }
    }

    func selectionMenuHidden(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetSelectionMenuHidden(value)
        }
    }

    func showCounter(value: Bool, thresholdPercentage: Float64, highlightBorder: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetShowCounter(value, Int32(thresholdPercentage), highlightBorder)
        }
        this
    }

    func maxLines(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMaxLines(value)
        }
        this
    }

    func enableKeyboardOnFocus(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnableKeyboardOnFocus(value)
        }
    }

    func contentType(value: ContentType): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetContentType(value.getValue())
        }
    }

    func enableAutoFill(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnableAutoFill(value)
        }
    }

    func setType(value: TextAreaType): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetTextAreaType(value.getValue())
        }
    }

    func copyOption(value: CopyOptions): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCopyOption(value.getValue())
        }
    }

    func customKeyboard(value: () -> Unit, options: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCustomKeyboard(Callback0Param<Unit>(value).getID(), options)
        }
    }

    func onSubmit(callback: (EnterKeyType) -> Unit): Unit {
        let wrapper = {
            value: Int32 =>
            let typeArr = [
                EnterKeyType.Go,
                EnterKeyType.EntrySearch,
                EnterKeyType.Send,
                EnterKeyType.Next,
                EnterKeyType.Done,
                EnterKeyType.PREVIOUS,
                EnterKeyType.NEW_LINE
            ]
            try {
                callback(typeArr[Int64(value) - 2])
            } catch (e: IndexOutOfBoundsException) {
                AppLog.error("onSubmit: EnterKeyType is invalid")
                callback(EnterKeyType.Done)
            }
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnSubmit(lambdaData.getID())
        }
    }

    func onSubmitWithEvent(callback: (EnterKeyType, SubmitEvent) -> Unit): Unit {
        let wrapper = {
            value: Int32, event: CJSubmitEvent =>
            let typeArr = [
                EnterKeyType.Go,
                EnterKeyType.EntrySearch,
                EnterKeyType.Send,
                EnterKeyType.Next,
                EnterKeyType.Done,
                EnterKeyType.PREVIOUS,
                EnterKeyType.NEW_LINE
            ]
            try {
                var evt = event.toSubmitEvent()
                callback(typeArr[Int64(value) - 2], evt)
                return evt.IsKeepEditableState()
            } catch (e: IndexOutOfBoundsException) {
                AppLog.error("onSubmit: EnterKeyType is invalid")
                return false
            }
        }
        let lambdaData = Callback2Param<Int32, CJSubmitEvent, Bool>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnSubmitWithEvent(lambdaData.getID())
        }
    }

    func onChange(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnChange(lambdaData.getID())
        }
    }

    func onCopy(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnCopy(lambdaData.getID())
        }
    }

    func onCut(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnCut(lambdaData.getID())
        }
    }

    func onPaste(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnPaste(lambdaData.getID())
        }
    }

    func onEditChanged(callback: (Bool) -> Unit): Unit {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnEditChanged(lambdaData.getID())
        }
    }

    func onEditChange(callback: (Bool) -> Unit): Unit {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnEditChanged(lambdaData.getID())
        }
    }

    func onContentScroll(callback: (Float32, Float32) -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnContentScroll(Callback2Param<Float32, Float32, Unit>(callback).getID())
        }
    }

    func onTextSelectionChange(callback: (Int32, Int32) -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnTextSelectionChange(Callback2Param<Int32, Int32, Unit>(callback).getID())
        }
    }

    func onDidDelete(callback: (Float64, Int32, String) -> Unit): Unit {
        let wrapper = {
            deleteOffset: Float64, direction: Int32, deleteValue: CString => callback(
                deleteOffset,
                direction,
                deleteValue.toString()
            )
        }
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnDidDelete(Callback3Param<Float64, Int32, CString, Unit>(wrapper).getID())
        }
    }

    func onWillDelete(callback: (Float64, Int32, String) -> Bool): Unit {
        let wrapper = {
            deleteOffset: Float64, direction: Int32, deleteValue: CString => callback(
                deleteOffset,
                direction,
                deleteValue.toString()
            )
        }
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnWillDelete(Callback3Param<Float64, Int32, CString, Bool>(wrapper).getID())
        }
    }

    func onDidInsert(callback: (Float64, String) -> Unit): Unit {
        let wrapper = {
            insertOffset: Float64, insertValue: CString => callback(insertOffset, insertValue.toString())
        }
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnDidInsert(Callback2Param<Float64, CString, Unit>(wrapper).getID())
        }
    }

    func onWillInsert(callback: (Float64, String) -> Bool): Unit {
        let wrapper = {
            insertOffset: Float64, insertValue: CString => callback(insertOffset, insertValue.toString())
        }
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnWillInsert(Callback2Param<Float64, CString, Bool>(wrapper).getID())
        }
    }

    func onSecurityStateChange(callback: (Bool) -> Unit): Unit {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnSecurityStateChange(lambdaData.getID())
        }
    }

    func showUnit(builder: () -> Unit): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldShowUnit(Callback0Param<Unit>(builder).getID())
        }
    }

    func passwordRules(value: String): Unit {
        unsafe {
            var rules = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetPasswordRules(rules)
            rules.free()
        }
    }

    func showError(value: String): Unit {
        unsafe {
            var errorText = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetShowError(errorText)
            errorText.free()
        }
    }

    func showPasswordIcon(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetShowPasswordIcon(value)
        }
    }

    func showPassword(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldShowPasswordText(value)
        }
    }

    func passwordIcon(onIconSrc: String, offIconSrc: String): Unit {
        unsafe {
            var onSrc: ?CString = None
            var offSrc: ?CString = None
            try {
                onSrc = LibC.mallocCString(onIconSrc)
                offSrc = LibC.mallocCString(offIconSrc)
                FfiOHOSAceFrameworkTextFieldSetPasswordIcon(onSrc.getOrThrow(), offSrc.getOrThrow())
            } finally {
                onSrc?.free()
                offSrc?.free()
            }
        }
    }

    func caretPosition(position: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCaretPosition(position)
        }
    }
    func selectAll(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetSelectAllValue(value)
        }
    }
    func showUnderline(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetShowUnderline(value)
        }
    }
    func normalUnderlineColor(color: UInt32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldNormalUnderlineColor(color)
        }
    }
    func userUnderlineColor(typing: UInt32, normal: UInt32, error: UInt32, disable: UInt32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldUserUnderlineColor(typing, normal, error, disable)
        }
    }

    func cancelButton(style: Int32, size: Float64, unit: Int32, color: UInt32, src: String): Unit {
        unsafe {
            var srcCstring = LibC.mallocCString(src)
            FfiOHOSAceFrameworkTextFieldCancelButton(style, size, unit, color, srcCstring);
            srcCstring.free()
        }
    }

    func editMenuOptions(
        onCreateMenu: (Array<TextMenuItem>) -> Array<TextMenuItem>,
        onMenuItemClick: (TextMenuItem, Int32, Int32) -> Bool
    ): Unit {
        let wrapperOnCreateMenu = {
            value: VectorTextMenuItemHandle =>
            let handle = FFIVectorFfiTextMenuItem(value)
            let arr: Array<TextMenuItem> = Array<TextMenuItem>(handle.getSize()) {
                i => parseTextMenuItem(handle.getElement(i))
            }
            let arrFfi = onCreateMenu(arr)
            let vecFfi = FFIVectorFfiTextMenuItem(arrFfi.size)
            for (i in 0..arrFfi.size) {
                vecFfi.setElement(i, arrFfi[i].parseToNative())
            }
            handle.free()
            return vecFfi.getNativeHandle()
        }
        let lambdaOnCreateMenu = Callback1Param<VectorTextMenuItemHandle, VectorTextMenuItemHandle>(wrapperOnCreateMenu)

        let wrapperOnMenuItemClick = {
            textMenuItem: FfiTextMenuItem, start: Int32, end: Int32 => onMenuItemClick(parseTextMenuItem(textMenuItem),
                start, end)
        }
        let lambdaOnMenuItemClick = Callback3Param<FfiTextMenuItem, Int32, Int32, Bool>(wrapperOnMenuItemClick)

        unsafe {
            FfiOHOSAceFrameworkTextFieldEditMenuOptions(lambdaOnCreateMenu.getID(), lambdaOnMenuItemClick.getID())
        }
    }
}
