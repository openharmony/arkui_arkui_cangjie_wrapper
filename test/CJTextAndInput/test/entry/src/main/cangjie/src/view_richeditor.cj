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

package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import ohos.ui_test.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.createImageSource
import ohos.multimedia.image.DecodingOptions
import ohos.multimedia.image.Size
import std.collection.{ ArrayList, HashMap }
import ohos.resource_manager.*
import ohos.bundle.bundle_manager.*
import ohos.multimedia.image.ImageInfo
import ohos.business_exception.*


@Entry
@Component
class ViewRichEditor {
    let controller: RichEditorController = RichEditorController()
    var start: Int32 = -1
    var end: Int32 = -1
    var imageCount = 0
    var textCount = 0
    @State
    var message: String = "[-1, -1]"
    @State
    var content: String = ""
    @State
    var text: String = ""
    @State
    var insertOffset: String = ""
    @State
    var insertValue: String = ""
    @State
    var addTextSpan: String = ""

    @State
    var didchangestart1: Int32 = 0
    @State
    var didchangeend1: Int32 = 0
    @State
    var didchangestart2: Int32 = 0
    @State
    var didchangeend2: Int32 = 0

    var color: Array<UInt8> = Array<UInt8>(96, {i => UInt8(i + 1)})
    let opts: InitializationOptions = InitializationOptions(Size(4, 6), editable: true, pixelFormat: Rgba8888)
    var pix: PixelMap = createPixelMap(color, opts)

    let controller1: RichEditorController = RichEditorController()
    let textDecorationResult: DecorationStyleResult = DecorationStyleResult(TextDecorationType.Underline, Color.Red)
    let richEditorInsertValue: RichEditorInsertValue = RichEditorInsertValue(1, "insertValue")
    let richEditorInsertValue2: RichEditorInsertValue = RichEditorInsertValue(1, "insertValue")
    let richEditorSpanPosition: RichEditorSpanPosition = RichEditorSpanPosition(1, (1, 1))
    let richEditorTextStyleResult: RichEditorTextStyleResult = RichEditorTextStyleResult("red", 1.0, FontStyle.Italic, 1, "family", textDecorationResult)
    let richEditorTextStyleResult2: RichEditorTextStyleResult = RichEditorTextStyleResult("red", 1.0, FontStyle.Italic, 1, "family", textDecorationResult)
    let richEditorSelection: RichEditorSelection = RichEditorSelection((1, 1), ArrayList<RichEditorSpanResult>())
    let richEditorDeleteValue: RichEditorDeleteValue = RichEditorDeleteValue(1, RichEditorDeleteDirection.Backward, 1, ArrayList<RichEditorSpanResult>())

    @Builder
    func builder() {
        Column {
            ForEach(
                ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"],
                itemGeneratorFunc: {
                    item: String, idx: Int64 => Button(item).width(40.vp).height(40.vp).fontColor(0x66000000).fontSize(
                        16.fp)
                }
            )
        }
        .borderRadius(24.vp)
        .padding(top: 4.vp, bottom: 4.vp, left: 16.vp, right: 16.vp)
        .backgroundColor(Color.Green)
        .margin(right: 24.vp, bottom: 4.vp, top: 0.vp)
        .width(130.vp)
    }

    func build() {
        Column() {
            Column() {
                Text("selection range:").width(100.percent)
                Text() {
                    Span(this.message)
                }.width(100.percent)
                Text("selection content:").width(100.percent)
                Text(this.content).width(100.percent).key("RichEditor01Text")
                Text(this.insertOffset).width(100.percent).key("RichEditor02Text")
                Text(this.insertValue).width(100.percent).key("RichEditor03Text")

                Text("${didchangestart1}--${didchangeend1}").id("textDid1").width(100.percent)
                Text("${didchangestart2}--${didchangeend2}").id("textDid2").width(100.percent)
            }.borderWidth(1).borderColor(Color.Red)

            Row() {
                Button("获取选择内容").id("RichEditor01GetSpans").onClick({
                    e =>
                    this.content = ""
                    for (item in this.controller.getSpans(start: this.start, end: this.end)) {
                        match (item) {
                            case RichEditorImageSpanResult => ()
                            case RichEditorTextSpanResult =>
                                Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: text:" + (item as RichEditorTextSpanResult).getOrThrow().value.toString())
                            case _ => ()
                        }
                    }
                })
                Button("删除选择内容").id("RichEditor01DelSpans").onClick({
                    e =>
                    this.controller.deleteSpans(start: 0, end: 1)
                    this.start = -1
                    this.end = -1
                    this.message = "[" + this.start.toString() + ", " + this.end.toString() + "]"
                })
                Button("添加中英特殊字符").id("addTextSpan1").onClick({
                    evt => controller.addTextSpan(
                        content: "你好,Cangjie!@#&%",
                        options: RichEditorTextSpanOptions(
                            style: RichEditorTextStyle(
                                fontColor: Color(0XFF1298),
                                fontSize: 20.fp,
                                fontStyle: FontStyle.Italic,
                                decoration: TextDecorationOptions(
                                    decorationType: TextDecorationType.Overline,
                                    color: Color(0X12FF98)
                                ),
                            )
                        )
                    )
                })
            }.borderWidth(1).borderColor(Color.Red).width(100.percent).height(5.percent)

            Row() {
                Button("获取组件信息").onClick({
                    e =>
                    let strJson = getInspectorByKey("RichEditorKey")
                    Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: text: ${strJson}")
                }).key("getInfo")
                Button("获取光标位置").onClick({
                    e => this.content = this.controller.getCaretOffset().toString() + ""
                }).key("getCaretOffset")
                Button("插入多行中英字符").id("addTextSpan2").onClick({
                    evt => controller.addTextSpan(
                        content: """
                            你好,Cangjie!@#&%
                            """,
                        options: RichEditorTextSpanOptions(
                            style: RichEditorTextStyle(
                                fontColor: Color(0XFF1298),
                                fontSize: 20.fp,
                                fontStyle: FontStyle.Italic,
                                decoration: TextDecorationOptions(
                                    decorationType: TextDecorationType.LineThrough,
                                    color: Color(0X12FF98)
                                ),
                            )
                        )
                    )
                })
            }.borderWidth(1).borderColor(Color.Red).width(100.percent).height(5.percent)

            Row() {
                Button("设置光标位置1").id("setCaretOffset01").onClick({
                    e => this.content = this.controller.setCaretOffset(1).toString() + ""
                })
                Button("设置光标位置100").id("setCaretOffset02").onClick({
                    e => this.content = this.controller.setCaretOffset(100).toString() + ""
                })
            }.borderWidth(1).borderColor(Color.Red).width(100.percent).height(5.percent)

            Row() {
                Button("添加空字符").id("addTextSpan3").onClick({
                    evt => controller.addTextSpan(
                        content: "",
                        options: RichEditorTextSpanOptions(
                            style: RichEditorTextStyle(
                                fontColor: Color(0XFF1298),
                                fontSize: 20.fp,
                                fontStyle: FontStyle.Italic,
                                decoration: TextDecorationOptions(
                                    decorationType: TextDecorationType.Underline,
                                    color: Color(0X12FF98)
                                ),
                            )
                        )
                    )
                })
                Button("插入转义字符").id("addTextSpan4").onClick({
                    evt => controller.addTextSpan(
                        content: "\n你好，仓颉\t",
                        options: RichEditorTextSpanOptions(
                            style: RichEditorTextStyle(
                                fontColor: Color(0XFF1298),
                                fontSize: 20.fp,
                                fontStyle: FontStyle.Italic,
                                decoration: TextDecorationOptions(
                                    decorationType: TextDecorationType.Overline,
                                    color: Color(0X12FF98)
                                ),
                            )
                        )
                    )
                })
            }.borderWidth(1).borderColor(Color.Red).width(100.percent).height(5.percent)

            Button("getSpans").onClick({
                evt =>
                let array = controller.getSpans(start: 0, end: 20)
                for (i in 0..array.size) {
                    match (array[i]) {
                        case RichEditorImageSpanResult =>
                            Hilog.error(1, "Cangjie-Test", "getSpans: RichEditorImageSpanResult")
                            // 现在没法正确match case，临时解决办法, 加count为了不重复构造
                            if (imageCount == 0) {
//                                testBuildRichEditorImageSpanResult((array[i] as RichEditorImageSpanResult).getOrThrow())
                                imageCount++
                            }
                            //Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: Image:" + (array[i] as RichEditorImageSpanResult).getOrThrow().value.toString())
                        case RichEditorTextSpanResult =>
                            Hilog.error(1, "Cangjie-Test", "getSpans: RichEditorTextSpanResult")
                            //Hilog.error(1,"Cangjie-Test", "[ViewRichEditor]: text:" + (array[i] as RichEditorTextSpanResult).getOrThrow().value.toString())
                        case _ =>
                            Hilog.error(1, "Cangjie-Test", "[ViewRichEditor] getSpans empty")
                    }
                }
            }).id("getSpans")

            Button("getEmptySpan").onClick({
                evt =>
                    let array = controller.getSpans(start: 0, end: 0)
                    Hilog.error(1, "Cangjie-Test", "getEmptySpan: spanSize: ${array.size}")
                    let test_controller = RichEditorController()
            }).id("getEmptySpan")

            Column() {
                RichEditor(this.controller).id("RichEditorKey").key("RichEditorKey").onReady(
                    {
                        =>
                        this.content = "012345678"
                        controller.addImageSpan(
                            value: @r(app.media.startIcon),
                            options: RichEditorImageSpanOptions()
                        )
                        controller.addImageSpan(
                            value: "IMAGE",
                            options: RichEditorImageSpanOptions()
                        )
                        controller.addImageSpan(
                            value: @r(app.media.startIcon),
                            options: RichEditorImageSpanOptions(
                                imageStyle: RichEditorImageSpanStyle(
                                    verticalAlign: ImageSpanAlignment.Center,
                                    objectFit: ImageFit.Auto
                                )
                            )
                        )
                        controller.addImageSpan(
                            value: "IMAGE",
                            options: RichEditorImageSpanOptions(imageStyle: RichEditorImageSpanStyle(size: (5.px, 5.px))
                            )
                        )
                    }
                ).bindSelectionMenu(
                    spantype: RichEditorSpanType.Image,
                    content: bind(builder, this),
                    options: SelectionMenuOptions(onAppear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onAppear")},
                        onDisappear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onDisappear")})
                ).onSelect(
                    {
                        value =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- onSelect ----------------------")
                        this.start = value.selection.getOrThrow()[0]
                        this.end = value.selection.getOrThrow()[1]
                        this.message = "[" + this.start.toString() + ", " + this.end.toString() + "]"
//                        var results = controller.getSpans()
                    }
                ).aboutToImeInput(
                    {
                        value =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- aboutToIMEInput ----------------------")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: insertOffset: ${value.insertOffset}")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: insertValue: ${value.insertValue}")
                        this.insertOffset = value.insertOffset.toString() + ""
                        this.insertValue = value.insertValue.toString() + ""
                        return true
                    }
                ).onImeInputComplete(
                    {
                        value =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- onIMEInputComplete ---------------------")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: spanIndex: ${value.spanPosition.spanIndex}")
                        Hilog.info(1,"Cangjie-Test",
                            "spanRange:[ ${value.spanPosition.spanRange.getOrThrow()[0]}, ${value.spanPosition.spanRange.getOrThrow()[1]} ]")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: offsetInSpan:[ ${value.offsetInSpan[0]}, ${value.offsetInSpan[1]} ]")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: value:" + value.value)
                        // 现在没法正确match case，临时解决办法，加count为了不重复构造
                        if (textCount == 0) {
                            testBuildRichEditorTextSpanResult(value)
                            textCount++
                        }
                        this.content = "${value.spanPosition.spanIndex}, ${value.value}, ${value.spanPosition.spanRange.getOrThrow()[0]}, ${value.spanPosition.spanRange.getOrThrow()[1]}, ${value.offsetInSpan[0]}, ${value.offsetInSpan[1]}, ${value.textStyle.fontSize}"
                    }
                ).aboutToDelete(
                    {
                        value =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- aboutToDelete --------------------------")
                        this.content = "aboutToDelete"
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: RichEditor RichEditorDeleteValue.offset ${value.offset}")
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: offset:" + value.offset.toString())
                        var direction = match (value.direction) {
                            case BACKWARD => "BACKWARD"
                            case FORWARD => "FORWARD"
                            case _ => "_"
                        }

                        for (item in value.richEditorDeleteSpans) {
                            match (item) {
                                case RichEditorImageSpanResult =>
                                    try {
                                    } catch (e: BusinessException) {
                                        Hilog.error(1,"Cangjie-Test", "[ViewRichEditor]: image error")
                                    }

                                case RichEditorTextSpanResult =>
                                    Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: text:" + (item as RichEditorTextSpanResult).getOrThrow().value.toString())
                                case _ => ()
                            }
                        }
                        return true
                    }
                ).onPaste(
                    {
                    paste =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- onPaste --------------------------")
                        paste.preventDefault()
                }).onDeleteComplete({
                    => Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: ---------------------- onDeleteComplete ------------------------")
                }).onDidChange(
                    {
                        t1, t2 =>
                        didchangestart1 = t1.start.getOrThrow()
                        didchangeend1 = t1.end.getOrThrow()
                        didchangestart2 = t2.start.getOrThrow()
                        didchangeend2 = t2.end.getOrThrow()
                    }
                ).borderWidth(1).borderColor(Color.Green).width(100.percent).height(30.percent)
                RichEditor(this.controller1).bindSelectionMenu(
                    spantype: RichEditorSpanType.Text,
                    content: bind(builder, this),
                    responseType: ResponseType.LongPress,
                    options: SelectionMenuOptions(onAppear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onAppear")},
                        onDisappear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onDisappear")})
                ).onReady(
                    {
                        =>
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: leetcode log:  onReady start")
                        controller1.updateSpanStyle(
                            textStyle: RichEditorTextStyle(
                                fontColor: Color.Red
                            )
                        )
                        controller1.updateSpanStyle(imageStyle: RichEditorImageSpanStyle(size: (10.vp, 10.vp)))
                        controller1.updateSpanStyle(
                            imageStyle: RichEditorImageSpanStyle(
                                verticalAlign: ImageSpanAlignment.Bottom,
                                objectFit: ImageFit.Auto
                            )
                        )
                        var appResour = @r(app.media.background)
                        Hilog.error(1, "Cangjie-Test", "[loadMedia]: appResour.bundleName. ${appResour.bundleName}")
                        Hilog.error(1, "Cangjie-Test", "[loadMedia]: appResour.moduleName. ${appResour.moduleName}")
                        Hilog.error(1, "Cangjie-Test", "[loadMedia]: appResour.id. ${appResour.id}")
                        Hilog.error(1, "Cangjie-Test", "[loadMedia]: appResour.resType. ${appResour.resType}")

//                        let buffer: Array<UInt8> = loadMedia(Int32(@r(app.media.startIcon).id),
//                            globalAbilityContext)
//                        let imageSource = createImageSource(buffer)
//                        let decodeOpts: DecodingOptions = DecodingOptions(
//                            sampleSize: 1,
//                            rotate: 0,
//                            editable: true
//                        )
//                        let pix: PixelMap = imageSource.createPixelMap(options: decodeOpts)
                        let color = Array<UInt8>(96, { i => UInt8(i+1) })
                        let opts = InitializationOptions(Size(4, 6), editable: true, pixelFormat: Rgba8888)
                        let pix: PixelMap = createPixelMap(color, opts)

                        let leadingMarginPlaceholder = LeadingMarginPlaceholder(pixelMap: this.pix, size: (5.vp, 5.vp))
                        controller1.updateParagraphStyle(style: RichEditorParagraphStyle())
                        controller1.updateParagraphStyle(style: RichEditorParagraphStyle(leadingMargin: 1.vp))
                        controller1.updateParagraphStyle(style: RichEditorParagraphStyle(textAlign: TextAlign.Start, leadingMargin: leadingMarginPlaceholder))
                        controller1.closeSelectionMenu()
                        Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: leetcode log:  onReady end")
                    }
                ).customKeyboard(value: bind(builder, this)).copyOptions(CopyOptions.InApp).onPaste(
                    {
                    paste => paste.preventDefault()
                }).borderWidth(1).borderColor(Color.Green).width(100.percent).height(30.percent)

                RichEditor(RichEditorController()).bindSelectionMenu(
                    spantype: RichEditorSpanType.Mixed,
                    content: bind(builder, this),
                    options: SelectionMenuOptions(onAppear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onAppear")},
                        onDisappear: {=> Hilog.info(1,"Cangjie-Test", "[ViewRichEditor]: SelectionMenuOptions onDisappear")})
                )

            }.borderWidth(1).borderColor(Color.Red).width(100.percent).height(70.percent)
        }
    }

    public static func loadMedia(resId: Int32, context: Option<UIAbilityContext>): Array<UInt8> {
        Hilog.error(1,"Cangjie-Test", "[loadMedia]: ImageSource start.")
//        if (let Some(v) <- context) {
//            let stageContext = getStageContext(v)
//            let rm: ResourceManager = ResourceManager.getResourceManager(stageContext)
//            try {
//                return rm.getMediaContent(Int32(resId), 0)
//            } catch (e: Exception) {
//                Hilog.error(1,"Cangjie-Test", "[loadMedia]: getMediaContent failed, err msg=" + e.message)
//                return Array<UInt8>()
//            }
//        }

        Hilog.error(1,"Cangjie-Test", "[loadMedia]: the globalAbilityContext is None.")
        return Array<UInt8>()
    }

    // Test function: invoke RichEditorTextSpanResult constructor
    func testBuildRichEditorTextSpanResult(src: RichEditorTextSpanResult): Unit {
        Hilog.error(1,"Cangjie-Test", "build RichEditorTextSpanResult")
        let des = RichEditorTextSpanResult(
            src.spanPosition,
            src.value,
            src.textStyle,
            src.offsetInSpan
        )
        Hilog.error(1,"Cangjie-Test", "build RichEditorTextSpanResult completed")
    }

    // Test function: invoke RichEditorImageSpanResult constructor
    func testBuildRichEditorImageSpanResult(src: RichEditorImageSpanResult): Unit {
        Hilog.error(1,"Cangjie-Test", "build RichEditorImageSpanResult")
        let des = RichEditorImageSpanResult(
            spanPosition: src.spanPosition,
            valuePixelMap: src.valuePixelMap,
            valueResourceStr: src.valueResourceStr,
            imageStyle: src.imageStyle,
            offsetInSpan: src.offsetInSpan
        )
        Hilog.error(1,"Cangjie-Test", "build RichEditorImageSpanResult completed")

        // invoke RichEditorImageSpanStyleResult member variables
        let imageStyle = des.imageStyle
        imageStyle.getOrThrow().size
        imageStyle.getOrThrow().verticalAlign
        imageStyle.getOrThrow().objectFit
        imageStyle.getOrThrow().layoutStyle
        testBuildRichEditorLayoutStyle(imageStyle.getOrThrow().layoutStyle.getOrThrow())
        imageCount++
    }

    // Test function: invoke RichEditorLayoutStyle constructor
    func testBuildRichEditorLayoutStyle(src: RichEditorLayoutStyle): Unit {
        Hilog.error(1,"Cangjie-Test", "build RichEditorLayoutStyle")
        let des1 = RichEditorLayoutStyle(margin: src.margin, borderRadius: src.borderRadius)
        let des2 = RichEditorLayoutStyle(margin: 16.fp, borderRadius: 16.fp)
        Hilog.error(1,"Cangjie-Test", "build RichEditorLayoutStyle completed")
    }
}