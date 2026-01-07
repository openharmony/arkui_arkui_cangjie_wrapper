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
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*
import ohos.hilog.Hilog
import ohos.display.FoldStatus
import ohos.window.WindowType
import ohos.window.Orientation as WindowOrientation

@Test
class HideUT {

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testSlideEffect() {
        let emumValue = SlideEffect.Start
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testSheetType() {
        let emumValue = SheetType.ContentCover
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testIndexerAlign() {
        let emumValue = IndexerAlign.Start
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testInputType() {
        let emumValue = InputType.NumberPassword
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testTextAlign() {
        let emumValue = TextAlign.Justify
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testTextOverflow() {
        let emumValue = TextOverflow.Marquee
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testWordBreak() {
        let emumValue = WordBreak.Hyphenation
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testImageSize() {
        let emumValue = ImageSize.Fill
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testImageFit() {
        let emumValue = ImageFit.TopStart
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testScrollDirection() {
        let emumValue = ScrollDirection.None
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testSliderStyle() {
        let emumValue = SliderStyle.None
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testSwiperDisplayMode() {
        let emumValue = SwiperDisplayMode.AutoLinear
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testEdge() {
        let emumValue = Edge.Center
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testCopyOptions() {
        let emumValue = CopyOptions.CrossDevice
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testTouchType() {
        let emumValue = TouchType.HoverEnter
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testSourceType() {
        let emumValue = SourceType.Key
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testMouseAction() {
        let emumValue = MouseAction.EnterWindow
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testKeySource() {
        let emumValue = KeySource.Joystick
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testFunctionKey() {
        let emumValue = FunctionKey.DpadUp
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testPlaybackSpeed() {
        let emumValue = PlaybackSpeed.SpeedForward050X
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testStickyStyle() {
        let emumValue = StickyStyle.Both
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testRichEditorSpanType() {
        let emumValue = RichEditorSpanType.Builder
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testImageSpanAlignment() {
        let emumValue = ImageSpanAlignment.FollowParagraph
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testColoringStrategy() {
        let emumValue = ColoringStrategy.Average
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testContentType() {
        let emumValue = ContentType.PassportNumber
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testDismissReason() {
        let emumValue = DismissReason.Slide
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testTextAreaType() {
        let emumValue = TextAreaType.OneTimeCode
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testBarStyle() {
        let emumValue = BarStyle.SafeAreaPadding
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testFoldStatus() {
        let emumValue = FoldStatus.FoldStatusExpandedWithSecondExpanded
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testWindowType() {
        let emumValue = WindowType.TypeInputMethod
    }

    @TestCase
    @Skip
    @Tag[APILevel22, TestLevel0]
    func testWindowOrientation() {
        let emumValue = WindowOrientation.AutoRotationUnspecified
    }
}