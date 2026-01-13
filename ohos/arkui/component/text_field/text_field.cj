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

package ohos.arkui.component.text_field

import ohos.arkui.component.common.{BorderStyle, EnterKeyType, TextAlign, InputType, FontWeight, FontStyle, TextDecorationType, TextDecorationStyle, LineBreakStrategy, WordBreak, TextHeightAdaptivePolicy, TextOverflow, TextContentStyle, TextInputStyle, BarState, ContentType, TextAreaType, CopyOptions, EnterKeyType, EdgeWidths}
import ohos.arkui.component.native_struct.{CJBorderRadius, CJEdge, CJBorder}
import ohos.arkui.component.util.{transAppResourceToLength, transAppResourceToResourceColor, getLengthUnitOrFp, lessNotEqual, LENGTH_PERCENT}
import ohos.base.{Length, ResourceColor, CStringExtend, APP_LOG, Color, LengthProp}
import ohos.business_exception.BusinessException
import ohos.ffi.{Callback1Param, Callback0Param, Callback2Param, Callback3Param}
import ohos.labels.{APILevel, Hide}

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

    func FFISetHeightWithEmpty(): Unit

    func FfiOHOSAceFrameworkTextFieldResetFontColor(): Unit

    func FfiOHOSAceFrameworkTextFieldResetMaxLength(): Unit

    func FfiOHOSAceFrameworkTextFieldResetPlaceholderColor(): Unit

    func FfiOHOSAceFrameworkTextFieldResetFontSize(): Unit
}

protected class TextField {
    protected static func height(width: ?Length): Unit {
        match (width) {
            case Some(v) =>
                unsafe {
                    let value_ = transAppResourceToLength(v)
                    if (lessNotEqual(value_.value, 0.0)) {
                        FFISetHeightWithEmpty()
                    } else {
                        FfiOHOSAceFrameworkTextFieldSetHeight(value_.value, value_.unitType.getValue())
                    }
                }
            case None => unsafe { FFISetHeightWithEmpty() }
        }
    }

    protected static func padding(value: ?Length): Unit {
        if (let Some(v) <- value) {
            var v_ = transAppResourceToLength(v)
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetPadding(v_.value, v_.unitType.getValue())
            }
        }
    }

    protected static func padding(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None): Unit {
        var t = transAppResourceToLength(top ?? 0.vp)
        var r = transAppResourceToLength(right ?? 0.vp)
        var b = transAppResourceToLength(bottom ?? 0.vp)
        var l = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetPaddings(
                CJEdge(
                    t.value,
                    t.unitType.getValue(),
                    r.value,
                    r.unitType.getValue(),
                    b.value,
                    b.unitType.getValue(),
                    l.value,
                    l.unitType.getValue()
                )
            )
        }
    }

    protected static func margin(value: ?Length): Unit {
        var v = transAppResourceToLength(value ?? 0.0.vp)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMargin(v.value, v.unitType.getValue())
        }
    }

    protected static func margin(top!: ?Length = None, right!: ?Length = None, bottom!: ?Length = None, left!: ?Length = None): Unit {
        var t = transAppResourceToLength(top ?? 0.vp)
        var r = transAppResourceToLength(right ?? 0.vp)
        var b = transAppResourceToLength(bottom ?? 0.vp)
        var l = transAppResourceToLength(left ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMargins(
                CJEdge(
                    t.value,
                    t.unitType.getValue(),
                    r.value,
                    r.unitType.getValue(),
                    b.value,
                    b.unitType.getValue(),
                    l.value,
                    l.unitType.getValue()
                )
            )
        }
    }

    protected static func border(
        width!: ?Length,
        color!: ?ResourceColor = None,
        radius!: ?Length = None,
        style!: ?BorderStyle = None
    ): Unit {
        var width_ = transAppResourceToLength(width ?? 0.vp)
        var radius_ = transAppResourceToLength(radius ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorder(
                CJBorder(
                    width_.value,
                    width_.unitType.getValue(),
                    transAppResourceToResourceColor(color ?? Color.Black),
                    radius_.value,
                    radius_.unitType.getValue(),
                    (style ?? BorderStyle.Solid).getValue()
                )
            )
        }
    }

    protected static func borderWidth(width: ?Length): Unit {
        if (let Some(v) <- width) {
            var w = transAppResourceToLength(v)
            if (w.unitType.getValue() == LENGTH_PERCENT) {
                // borderWidth doesn't support percent, defaults to 0.0.px
                w = transAppResourceToLength(0.0.px)
            }
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetBorderWidth(w.value, w.unitType.getValue())
            }
        }
    }

    protected static func borderWidth(edgeWidths: ?EdgeWidths): Unit {
        if (let Some(v) <- edgeWidths) {
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetBorderWidthWithCJEdge(
                    CJEdge(
                        (v.top ?? 0.vp).value,
                        (v.top ?? 0.vp).unitType.getValue(),
                        (v.right ?? 0.vp).value,
                        (v.right ?? 0.vp).unitType.getValue(),
                        (v.bottom ?? 0.vp).value,
                        (v.bottom ?? 0.vp).unitType.getValue(),
                        (v.left ?? 0.vp).value,
                        (v.left ?? 0.vp).unitType.getValue()
                    )
                )
            }
        }
    }

    protected static func borderColor(color: ?ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderColor(transAppResourceToResourceColor(color ?? Color.Black))
        }
    }

    protected static func borderRadius(radius: ?Length): Unit {
        var r = transAppResourceToLength(radius ?? 0.vp)
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderRadius(r.value, r.unitType.getValue())
        }
    }

    protected static func borderRadius(
        topLeft!: ?Length = None,
        topRight!: ?Length = None,
        bottomLeft!: ?Length = None,
        bottomRight!: ?Length = None
    ): Unit {
        var topLeft_ = transAppResourceToLength(topLeft ?? 0.vp)
        var topRight_ = transAppResourceToLength(topRight ?? 0.vp)
        var bottomLeft_ = transAppResourceToLength(bottomLeft ?? 0.vp)
        var bottomRight_ = transAppResourceToLength(bottomRight ?? 0.vp)
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

    protected static func borderStyle(style: ?BorderStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBorderStyle((style ?? BorderStyle.Solid).getValue())
        }
    }

    protected static func enterKeyType(value: EnterKeyType): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnterKeyType(value.getValue())
        }
    }

    protected static func textAlign(value: TextAlign): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetTextAlign(value.getValue())
        }
    }

    protected static func placeholderColor(value: ?ResourceColor): Unit {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetPlaceholderColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextFieldResetPlaceholderColor()
            }
        }
    }

    protected static func caretColor(value: ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCaretColor(transAppResourceToResourceColor(value))
        }
    }

    protected static func placeholderFont(
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

    protected static func maxLength(value: ?UInt32): Unit {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetMaxLength(v)
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextFieldResetMaxLength()
            }
        }
    }

    protected static func fontSize(value: ?Length): Unit {
        if (let Some(v) <- value) {
            var value_ = transAppResourceToLength(v)
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextFieldResetFontSize()
            }
        }
    }

    protected static func fontColor(value: ?ResourceColor): Unit {
        if (let Some(v) <- value) {
            unsafe {
                FfiOHOSAceFrameworkTextFieldSetFontColor(transAppResourceToResourceColor(v))
            }
        } else {
            unsafe {
                FfiOHOSAceFrameworkTextFieldResetFontColor()
            }
        }
    }

    protected static func fontWeight(value: FontWeight): Unit {
        unsafe {
            var weightCString = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkTextFieldSetFontWeight(weightCString)
            weightCString.free()
        }
    }

    protected static func fontStyle(value: FontStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetFontStyle(value.getValue())
        }
    }
    protected static func fontFamily(value: String): Unit {
        unsafe {
            var familyCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetFontFamily(familyCString)
            LibC.free(familyCString)
        }
    }

    protected static func inputFilter(value!: String, error!: (String) -> Unit = {_ =>}): Unit {
        let lambdaData = Callback1Param<CString, Unit>({
            value: CString => error(value.safeToString())
        })
        unsafe {
            var valueCString = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextFieldSetInputFilter(valueCString, lambdaData.getID())
            valueCString.free()
        }
    }

    protected static func backgroundColor(value: ?ResourceColor): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetBackgroundColor(transAppResourceToResourceColor(value ?? Color.Transparent))
        }
    }

    protected static func style(value: TextInputStyle): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetStyle(value.getValue())
        }
    }

    protected static func selectionMenuHidden(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetSelectionMenuHidden(value)
        }
    }

    protected static func maxLines(value: Int32): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetMaxLines(value)
        }
    }

    protected static func enableKeyboardOnFocus(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetEnableKeyboardOnFocus(value)
        }
    }

    protected static func customKeyboard(value: () -> Unit, options: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetCustomKeyboard(Callback0Param<Unit>(value).getID(), options)
        }
    }

    protected static func onSubmit(callback: (EnterKeyType) -> Unit): Unit {
        let wrapper = {
            value: Int32 =>
            let typeArr = [
                EnterKeyType.Go,
                EnterKeyType.Search,
                EnterKeyType.Send,
                EnterKeyType.Next,
                EnterKeyType.Done,
                EnterKeyType.Previous,
                EnterKeyType.NewLine
            ]
            try {
                callback(typeArr[Int64(value) - 2])
            } catch (e: IndexOutOfBoundsException) {
                APP_LOG.error("onSubmit: EnterKeyType is invalid")
                callback(EnterKeyType.Done)
            }
        }
        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnSubmit(lambdaData.getID())
        }
    }

    protected static func onChange(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.safeToString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnChange(lambdaData.getID())
        }
    }

    protected static func onCopy(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.safeToString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnCopy(lambdaData.getID())
        }
    }

    protected static func onCut(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.safeToString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnCut(lambdaData.getID())
        }
    }

    protected static func onPaste(callback: (String) -> Unit): Unit {
        let wrapper = {
            value: CString => callback(value.safeToString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnPaste(lambdaData.getID())
        }
    }

    protected static func onEditChange(callback: (Bool) -> Unit): Unit {
        let lambdaData = Callback1Param<Bool, Unit>(callback)
        unsafe {
            FfiOHOSAceFrameworkTextFieldOnEditChanged(lambdaData.getID())
        }
    }

    protected static func showUnderline(value: Bool): Unit {
        unsafe {
            FfiOHOSAceFrameworkTextFieldSetShowUnderline(value)
        }
    }
}
