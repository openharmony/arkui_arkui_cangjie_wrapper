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

@C
struct TextPickerResult {
    TextPickerResult(
        let value: CString,
        let index: UInt32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextPickerResData {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var index: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value: String, index: UInt32) {
        this.value = value
        this.index = index
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ValueParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var value: String
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valuechangeEvent: (String) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: String = "") {
        this.value = value
        this.valuechangeEvent = {_ =>}
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(value!: (String, (String) -> Unit) = ("", {_ =>})) {
        this.value = value[0]
        this.valuechangeEvent = value[1]
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ValuesParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var values: Option<Array<String>>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var valueschangeEvent: (Array<String>) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(values!: ?Array<String> = None) {
        this.values = values
        this.valueschangeEvent = {_ =>}
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(values!: (?Array<String>, (Array<String>) -> Unit) = (None, {_ =>})) {
        this.values = values[0]
        this.valueschangeEvent = values[1]
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectedParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selected: UInt32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selectedchangeEvent: (UInt32) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selected!: UInt32 = 0) {
        this.selected = selected
        this.selectedchangeEvent = {_ =>}
    }
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selected!: (UInt32, (UInt32) -> Unit) = (0, {_ =>})) {
        this.selected = selected[0]
        this.selectedchangeEvent = selected[1]
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class SelectedsParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selecteds: Option<Array<UInt32>>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var selectedschangeEvent: (Array<UInt32>) -> Unit

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selecteds!: ?Array<UInt32> = None) {
        this.selecteds = selecteds
        this.selectedschangeEvent = {_ =>}
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(selecteds!: (?Array<UInt32>, (Array<UInt32>) -> Unit) = (None, {_ =>})) {
        this.selecteds = selecteds[0]
        this.selectedschangeEvent = selecteds[1]
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextPickerRangeContent {
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
    public var text: Option<String>

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: String, text!: ?String = None) {
        this.icon = icon
        this.text = text
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: AppResource, text!: ?String = None) {
        this(getResourceMedia(icon), text: text)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: String, text!: ?AppResource = None) {
        this(
            icon,
            text: if (let Some(v) <- text) {
                getResourceString(v)
            } else {
                None
            }
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(icon: AppResource, text!: ?AppResource = None) {
        this(
            getResourceMedia(icon),
            text: if (let Some(v) <- text) {
                getResourceString(v)
            } else {
                None
            }
        )
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RangeParams {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var singlerange: Array<String>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var multirange: Array<Array<String>>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public var cascaderange: Array<TextCascadePickerRangeContent>

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(singlerange: Array<String>) {
        this.singlerange = singlerange
        this.multirange = []
        this.cascaderange = []
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(multirange: Array<Array<String>>) {
        this.singlerange = []
        this.multirange = multirange
        this.cascaderange = []
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(cascaderange: Array<TextCascadePickerRangeContent>) {
        this.singlerange = []
        this.multirange = []
        this.cascaderange = cascaderange
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextPickerOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public TextPickerOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var range: Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var selected!: Option<UInt32> = Option.None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var value!: Option<String> = Option.None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextCascadePickerRangeContent {
    public TextCascadePickerRangeContent(
        public var text: String,
        public var children!: Option<Array<TextCascadePickerRangeContent>> = Option.None
    ) {}
}

@C
struct CJDialogShow {
    CJDialogShow(
        let selected: UInt32,
        let height: Float64,
        let heightUnit: Int32,
        let accept: Int64,
        let cancel: Int64,
        let change: Int64
    ) {}
}

foreign {
    func FfiOHOSAceFrameworkTextPickerDialogShow(handle: VectorStringHandle, value: CJDialogShow): Unit

    func FfiOHOSAceFrameworkTextPickerCreate(handle: VectorStringHandle, selected: UInt32, value: CString): Unit

    func FfiOHOSAceFrameworkTextPickerSetDefaultPickerItemHeight(height: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextPickerSetCanLoop(value: Bool): Unit

    func FfiOHOSAceFrameworkTextPickerOnChange(callback: Int64): Unit

    func FfiOHOSAceFrameworkTextPickerSetTextStyle(color: UInt32, size: Float64, unit: UInt32, weight: CString,
        family: CString, style: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedTextStyle(color: UInt32, size: Float64, unit: UInt32, weight: CString,
        family: CString, style: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetGradientHeight(length: Float64, unit: Int32): Unit

    func FfiOHOSAceFrameworkTextPickerSetDivider(params: DividerParams): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedIndexSingle(value: UInt32): Unit

    func FfiOHOSAceFrameworkTextPickerSetSelectedIndexMulti(values: VectorUInt32Handle): Unit

    func FfiOHOSAceFrameworkTextPickerSetOpacity(opacityValue: Float64): Unit
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
open class TextPickerDialog {
    static func show(
        range: Array<String>,
        selected!: UInt32 = 0,
        defaultPickerItemHeight!: Length = 0.fp,
        onAccept!: (TextPickerResult) -> Unit = {_ =>},
        onCancel!: () -> Unit = {=>},
        onChange!: (TextPickerResult) -> Unit = {_ =>}
    ): Unit {
        let vecFFi = FFIVectorString(range.size)
        for (i in 0..range.size) {
            vecFFi.setElement(i, range[i])
        }
        let lambdaAcceptData = CallbackTextPickerResult(onAccept)
        let lambdaCancelData = Callback0Param<Unit>(onCancel)
        let lambdaChangeData = CallbackTextPickerResult(onChange)
        var defaultPickerItemHeight_ = transAppResourceToLength(defaultPickerItemHeight)
        unsafe {
            FfiOHOSAceFrameworkTextPickerDialogShow(
                vecFFi.getNativeHandle(),
                CJDialogShow(
                    selected,
                    defaultPickerItemHeight_.value,
                    defaultPickerItemHeight_.unitType.getValue(),
                    lambdaAcceptData.getID(),
                    lambdaCancelData.getID(),
                    lambdaChangeData.getID()
                )
            )
            vecFFi.free()
        }
    }
}

func checkSelect(range: Array<String>, value: String): UInt32 {
    var res: UInt32 = 0
    for (i in 0..range.size) {
        if (range[i] == value) {
            res = UInt32(i)
            break
        }
    }
    res
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class TextPicker <: ViewBase {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(options: TextPickerOptions) {
        var range = options.range
        var selected = options.selected
        var value = options.value
        let vecFFi = FFIVectorString(range.size)
        for (i in 0..range.size) {
            vecFFi.setElement(i, range[i])
        }

        var getSelected: UInt32 = 0
        match (selected) {
            case None => match (value) {
                case None => getSelected = 0
                case Some(v) => getSelected = checkSelect(range, v)
            }
            case Some(v) => getSelected = v
        }

        var defValue: String = ""
        match (value) {
            case None =>
                if (range.size > 0) {
                    defValue = range[0]
                }
            case Some(v) => defValue = v
        }
        unsafe {
            let tempValue = LibC.mallocCString(defValue)
            FfiOHOSAceFrameworkTextPickerCreate(vecFFi.getNativeHandle(), getSelected, tempValue)
            LibC.free(tempValue)
            vecFFi.free()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(
        range: Array<String>,
        selected!: Option<UInt32> = Option.None,
        value!: Option<String> = Option.None
    ) {
        let vecFFi = FFIVectorString(range.size)
        for (i in 0..range.size) {
            vecFFi.setElement(i, range[i])
        }

        var getSelected: UInt32 = 0
        match (selected) {
            case None => match (value) {
                case None => getSelected = 0
                case Some(v) => getSelected = checkSelect(range, v)
            }
            case Some(v) => getSelected = v
        }

        var defValue: String = ""
        match (value) {
            case None => defValue = range[0]
            case Some(v) => defValue = v
        }
        unsafe {
            let tempValue = LibC.mallocCString(defValue)
            FfiOHOSAceFrameworkTextPickerCreate(vecFFi.getNativeHandle(), getSelected, tempValue)
            vecFFi.free()
            LibC.free(tempValue)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultPickerItemHeight(height: Length): This {
        var height_ = transAppResourceToLength(height)
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetDefaultPickerItemHeight(height_.value, height_.unitType.getValue())
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
    public func defaultPickerItemHeight(height: Float64): This {
        defaultPickerItemHeight(height.fp)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func defaultPickerItemHeight(height: Int64): This {
        defaultPickerItemHeight(height.fp)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func canLoop(value: Bool): This {
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetCanLoop(value)
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
    public func textStyle(value: PickerTextStyle): This {
        var color = value.color
        var size = value.font.size
        var weight = value.font.weight
        var family = value.font.family
        var style = value.font.style
        var color_ = transAppResourceToResourceColor(color)
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkTextPickerSetTextStyle(color_, size_.value, UInt32(size_.unitType.getValue()),
                    weightCString.value, fontFamilyCString.value, UInt32(style.getValue()))
            }
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
    public func selectedTextStyle(value: PickerTextStyle): This {
        var color = value.color
        var size = value.font.size
        var weight = value.font.weight
        var family = value.font.family
        var style = value.font.style
        var color_ = transAppResourceToResourceColor(color)
        var size_ = transAppResourceToLength(size)
        unsafe {
            try (weightCString = LibC.mallocCString(weight.getValue()).asResource(),
                fontFamilyCString = LibC.mallocCString(family).asResource()) {
                FfiOHOSAceFrameworkTextPickerSetSelectedTextStyle(color_, size_.value, UInt32(size_.unitType.getValue()),
                    weightCString.value, fontFamilyCString.value, UInt32((style.getValue())))
            }
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
    public func selectedIndex(value: UInt32): This {
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetSelectedIndexSingle(value)
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
    public func selectedIndex(value: Array<UInt32>): This {
        unsafe {
            let numbers = FFIVectorUInt32(value.size)
            for (i in 0..value.size) {
                numbers.setElement(i, value[i])
            }
            FfiOHOSAceFrameworkTextPickerSetSelectedIndexMulti(numbers.getNativeHandle())
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
    public func divider(value!: ?DividerOptions = None): This {
        unsafe {
            if (let Some(params) <- value) {
                FfiOHOSAceFrameworkTextPickerSetDivider(
                    DividerParams(
                        params.strokeWidth.value,
                        params.strokeWidth.unitType.getValue(),
                        params.color.toUInt32(),
                        params.startMargin.value,
                        params.startMargin.unitType.getValue(),
                        params.endMargin.value,
                        params.endMargin.unitType.getValue(),
                    )
                )
            }
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
    public func gradientHeight(value: Length): This {
        unsafe {
            var length_ = transAppResourceToLength(value)
            FfiOHOSAceFrameworkTextPickerSetGradientHeight(length_.value, length_.unitType.getValue())
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
    public func onChange(callback: (TextPickerResData) -> Unit): This {
        let wrapper = {
            data: TextPickerResult =>
            let value = data.value.toString()
            let index = data.index
            callback(TextPickerResData(value, index))
        }
        let lambdaData = CallbackTextPickerResult(wrapper);
        unsafe {
            FfiOHOSAceFrameworkTextPickerOnChange(lambdaData.getID())
        }
        this
    }

    @APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func opacity(opacityValue: Float64): This {
        unsafe {
            FfiOHOSAceFrameworkTextPickerSetOpacity(opacityValue)
        }
        this
    }
}
