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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextFont {
    var size: Length
    var weight: FontWeight
    var family: String
    var style: FontStyle

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: String = "",
        style!: FontStyle = FontStyle.Normal) {
        this.size = transAppResourceToLength(size)
        this.weight = weight
        this.family = family
        this.style = style
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(size!: Length = 16.fp, weight!: FontWeight = FontWeight.Normal, family!: AppResource,
        style!: FontStyle = FontStyle.Normal) {
        this.size = transAppResourceToLength(size)
        this.weight = weight
        this.family = getResourceString(family)
        this.style = style
    }
}

@C
struct NativeShadowOptions {
    NativeShadowOptions(
        let radius: Float64,
        let shadowType: UInt32,
        let color: UInt32,
        let offsetX: Float64,
        let offsetY: Float64,
        let fill: Bool
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ShadowOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var radius: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var shadowType: UInt32 = ShadowType.COLOR.getValue()
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var color: UInt32 = 0xff000000
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetX: Float64 = 0.0
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var offsetY: Float64 = 0.0
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var fill: Bool = false

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: Float64, offsetX!: Float64, offsetY!: Float64, color!: ResourceColor) {
        this.radius = radius
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.color = transAppResourceToResourceColor(color)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(radius!: Float64, shadowType!: ShadowType, color!: ResourceColor = Color.BLACK, offsetX!: Float64 = 0.0,
        offsetY!: Float64 = 0.0, fill!: Bool = false) {
        this.radius = radius
        this.shadowType = shadowType.getValue()
        this.color = transAppResourceToResourceColor(color)
        this.offsetX = offsetX
        this.offsetY = offsetY
        this.fill = fill
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init() {}

    func parseToNative(): NativeShadowOptions {
        return NativeShadowOptions(
            radius,
            shadowType,
            color,
            offsetX,
            offsetY,
            fill
        )
    }

    func optionToNative(): NativeTextShadowV2 {
        return NativeTextShadowV2(this.radius, this.offsetX, this.offsetY, this.color, this.fill, this.shadowType)
    }
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextMenuItemId {
    var id_: String = ""
    init(id: String) {
        id_ = id
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(id: String): TextMenuItemId {
        TextMenuItemId(id);
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func of(id: AppResource): TextMenuItemId {
        TextMenuItemId(getResourceString(id))
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func equals(other: TextMenuItemId): Bool {
        other.getId() == id_
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop CUT: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_CUT")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop COPY: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_COPY")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop PASTE: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_PASTE")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop SELECT_ALL: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_SELECT_ALL")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop COLLABORATION_SERVICE: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_COLLABORATION_SERVICE")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop CAMERA_INPUT: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_CAMERA_INPUT")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static prop AI_WRITER: TextMenuItemId {
        get() {
            TextMenuItemId("OH_DEFAULT_AI_WRITE")
        }
    }
    func getId(): String {
        return id_
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextMenuItem {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var content: String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var icon: String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var id: TextMenuItemId

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content!: String, icon!: String = '', id!: TextMenuItemId) {
        this.content = content
        this.icon = icon
        this.id = id
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content!: String, icon!: AppResource, id!: TextMenuItemId) {
        this.content = content
        this.icon = getResourceMedia(icon)
        this.id = id
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(content!: AppResource, icon!: AppResource, id!: TextMenuItemId) {
        this.content = getResourceString(content)
        this.icon = getResourceMedia(icon)
        this.id = id
    }

    func parseToNative(): FfiTextMenuItem {
        unsafe {
            return FfiTextMenuItem(
                ExternalString(content),
                ExternalString(icon),
                ExternalString(id.getId())
            )
        }
    }
}

func parseTextMenuItem(menuItem: FfiTextMenuItem): TextMenuItem {
    let item = TextMenuItem(
        content: menuItem.content.toString(),
        icon: menuItem.icon.toString(),
        id: TextMenuItemId.of(menuItem.id.toString())
    )
    unsafe {
        menuItem.content.free()
        menuItem.icon.free()
        menuItem.id.free()
    }
    return item
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
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextController <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
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
        19,
        atomicservice: true,
        crossplatform: true,
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
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Text <: ContainerBase {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(subcomponent: () -> Unit) {
        this("")
        this.child = subcomponent
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func foregroundColor(color: ResourceColor): This {
        fontColor(color)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func font(value: TextFont): This {
        unsafe {
            try (unsafeFontWeight = LibC.mallocCString(value.weight.getValue()).asResource(),
                unsafeFontFamily = LibC.mallocCString(value.family).asResource()) {
                FfiOHOSAceFrameworkTextSetFont(value.size.value, value.size.unitType.getValue(), unsafeFontWeight.value,
                    unsafeFontFamily.value, value.style.getValue())
            }
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: ShadowOptions): This {
        textShadow([value])
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textShadow(value: Array<ShadowOptions>): This {
        let vecFFi = FFIVectorNativeShadowOptions(value.size)
        let elements: Array<NativeShadowOptions> = Array(value.size) {
            i => value[i].parseToNative()
        }
        for (i in 0..value.size) {
            vecFFi.setElement(i, elements[i])
        }
        unsafe {
            FfiOHOSAceFrameworkTextShadow(vecFFi.getNativeHandle())
        }
        vecFFi.free()
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func dataDetectorConfig(textType: Array<TextDataDetectorType>,
        onDetectResultUpdate!: (String) -> Unit = {_ =>}, color!: ResourceColor = Color(0xff0a59f7),
        decorationType!: TextDecorationType = TextDecorationType.Underline,
        decorationColor!: ResourceColor = Color(0xff0a59f7),
        decorationStyle!: TextDecorationStyle = TextDecorationStyle.SOLID): This {
        if (textType.size == 0) {
            let wrapper = {
                textType: CString => onDetectResultUpdate(textType.toString())
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            let vecTextDataDetectorType = FFIVectorString(5)
            vecTextDataDetectorType.setElement(0, "phoneNum")
            vecTextDataDetectorType.setElement(1, "url")
            vecTextDataDetectorType.setElement(2, "email")
            vecTextDataDetectorType.setElement(3, "location")
            vecTextDataDetectorType.setElement(4, "datetime")
            unsafe {
                FfiOHOSAceFrameworkTextSetDataDetectorConfig(vecTextDataDetectorType.getNativeHandle(),
                    lambdaData.getID(), transAppResourceToResourceColor(color), decorationType.getValue(),
                    transAppResourceToResourceColor(decorationColor), decorationStyle.getValue())
            }
            vecTextDataDetectorType.free()
        } else {
            let wrapper = {
                textType: CString => onDetectResultUpdate(textType.toString())
            }
            let lambdaData = Callback1Param<CString, Unit>(wrapper)
            let vecTextDataDetectorType = FFIVectorString(textType.size)
            for (i in 0..textType.size) {
                vecTextDataDetectorType.setElement(i, textType[i].getValue())
            }
            unsafe {
                FfiOHOSAceFrameworkTextSetDataDetectorConfig(vecTextDataDetectorType.getNativeHandle(),
                    lambdaData.getID(), transAppResourceToResourceColor(color), decorationType.getValue(),
                    transAppResourceToResourceColor(decorationColor), decorationStyle.getValue())
            }
            vecTextDataDetectorType.free()
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func halfLeading(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextHalfLeading(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fontFeature(value: String): This {
        unsafe {
            var unsafeFontFeature = LibC.mallocCString(value)
            FfiOHOSAceFrameworkTextSetFontFeature(unsafeFontFeature)
            unsafeFontFeature.free()
        }
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
        unsafe {
            FfiOHOSAceFrameworkTextSetLineBreakStrategy(value.getValue())
        }
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
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetLineSpacing(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func copyOption(value: CopyOptions): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetCopyOption(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func letterSpacing(value: Length): This {
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetLetterSpacing(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func maxFontScale(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkTextMaxFontScale(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func minFontScale(value: Float32): This {
        unsafe {
            FfiOHOSAceFrameworkTextMinFontScale(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func textSelectable(value: TextSelectable): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetTextSelectable(value.getValue())
        }
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
        unsafe {
            FfiOHOSAceFrameworkTextSetHeightAdaptivePolicy(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func editMenuOptions(
        onCreateMenu: (Array<TextMenuItem>) -> Array<TextMenuItem>,
        onMenuItemClick: (TextMenuItem, Int32, Int32) -> Bool
    ): This {
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
            FfiOHOSAceFrameworkTextEditMenuOptions(lambdaOnCreateMenu.getID(), lambdaOnMenuItemClick.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func enableDataDetector(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextEnableDataDetector(value)
        }
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
        unsafe {
            FfiOHOSAceFrameworkTextSetWordBreak(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func selection(start: Int32, end: Int32): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetSelection(start, end)
        }
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
        var value_ = transAppResourceToLength(value)
        unsafe {
            FfiOHOSAceFrameworkTextSetTextIndent(value_.value, value_.unitType.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ellipsisMode(value: EllipsisMode): This {
        unsafe {
            FfiOHOSAceFrameworkTextSetEllipsisMode(value.getValue())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onCopy(callback: (String) -> Unit): This {
        let wrapper = {
            value: CString => callback(value.toString())
        }
        let lambdaData = Callback1Param<CString, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextOnCopy(lambdaData.getID())
        }
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
        let wrapper = {
            start: Int32, end: Int32 => callback(start, end)
        }
        let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
        unsafe {
            FfiOHOSAceFrameworkTextOnTextSelectionChange(lambdaData.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func bindSelectionMenu(spanType: TextSpanType, content: () -> Unit, responseType: TextResponseType,
        onAppear!: (Int32, Int32) -> Unit = {_, _ =>}, onDisappear!: () -> Unit = {=>}): This {
        let lambdaContent = Callback0Param<Unit>(content)
        let wrapperOnAppear = {
            start: Int32, end: Int32 => onAppear(start, end)
        }
        let lambdaOnAppear = Callback2Param<Int32, Int32, Unit>(wrapperOnAppear)
        let lambdaOnDisappear = Callback0Param<Unit>(onDisappear)
        unsafe {
            FfiOHOSAceFrameworkTextBindSelectionMenu(spanType.getValue(), lambdaContent.getID(), responseType.getValue(),
                lambdaOnAppear.getID(), lambdaOnDisappear.getID())
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func draggable(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextDraggable(value)
        }
        this
    }

    @!APILevel[
        19,
        atomicservice: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func privacySensitive(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextPrivacySensitive(value)
        }
        this
    }
}
