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

protected package ohos.arkui.component.text

import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.ui_resource.*
import ohos.resource_manager.AppResource
import ohos.labels.APILevel

public type VectorNativeShadowOptionsHandle = CPointer<Unit>

public type VectorTextMenuItemHandle = CPointer<Unit>

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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextController <: RemoteDataLite {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeSelectionMenu() {
        unsafe {
            FfiOHOSAceFrameworkTextControllerCloseSelectionMenu(this.getID())
        }
    }
}


@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Text <: ContainerBase {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: String, controller!: TextController = TextController()) {
        unsafe {
            var unsafeContent = LibC.mallocCString(content)
            FfiOHOSAceFrameworkTextCreateWithController(unsafeContent, controller.getID())
            unsafeContent.free()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        this("")
        this.child = subcomponent
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content: AppResource, controller!: TextController = TextController()) {
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceString(content))
            FfiOHOSAceFrameworkTextCreateWithController(unsafeContent, controller.getID())
            unsafeContent.free()
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func width(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetWidth(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func height(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineSpacing(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetLineSpacing(value_.value, value_.unitType.getValue())
        }
        this
    }    

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetFontSize(value_.value, getLengthUnitOrFp(value_).getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxFontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetMaxFontSize(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minFontSize(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetMinFontSize(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontColor(value: ResourceColor): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetFontColor(transAppResourceToResourceColor(value))
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontStyle(value: FontStyle): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetFontStyle(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontWeight(value: FontWeight): This {
        unsafe {
            var unsafeFontWeight = LibC.mallocCString(value.getValue())
            FfiOHOSAceFrameworkTextSetFontWeight(unsafeFontWeight)
            unsafeFontWeight.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(value: String): This {
        unsafe {
            var unsafeFontFamily = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextSetFontFamily(unsafeFontFamily)
            unsafeFontFamily.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFamily(content: AppResource): This {
        unsafe {
            var unsafeContent = LibC.mallocCString(getResourceString(content))
            FfiOHOSAceFrameworkTextSetFontFamily(unsafeContent)
            unsafeContent.free()
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textAlign(value: TextAlign): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextAlign(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textOverflow(value: TextOverflow): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextOverflowNew(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxLines(value: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetMaxLines(value)
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lineHeight(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetLineHeight(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func decoration(decorationType!: TextDecorationType, color!: ResourceColor,
        decorationStyle!: TextDecorationStyle = TextDecorationStyle.SOLID): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetDecorationNew(decorationType.getValue(), transAppResourceToResourceColor(color),
                decorationStyle.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func baselineOffset(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetBaselineOffset(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textCase(value: TextCase): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextCase(value.getValue())
        }
        this
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func foregroundColor(color: ResourceColor): This {
        fontColor(color)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegion(rect: Rectangle): This {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func responseRegionArray(array: Array<Rectangle>): This {
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
