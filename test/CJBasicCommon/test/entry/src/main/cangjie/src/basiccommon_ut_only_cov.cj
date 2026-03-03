/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ohos.arkui.ui_context.*
import std.math.MathExtension
import ohos.ark_interop.*
import ohos.ui_test.*
import std.collection.ArrayList
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize
import ohos.display.Orientation as DisplayOrientation
import ohos.display.*
import ohos.callback_invoke.*
internal import kit.ArkUI.{isFoldable, getFoldStatus, getFoldDisplayMode, getCurrentFoldCreaseRegion, FoldCreaseRegion,
    getDefaultDisplaySync, getAllDisplays, DisplayState, DisplayOrientation as orientation, DisplayRect,
    WaterfallDisplayAreaRects, CutoutInfo, FoldDisplayMode}

import ohos.window.{Window, WindowStage, WindowCallbackType, WindowEventType, WindowStageEventType,
    Size, WindowStatusType, TitleButtonRect, SystemBarProperties, Orientation,createWindow,findWindow,WindowType,getLastWindow,shiftAppWindowFocus,
    AvoidAreaType,WindowProperties,ColorSpace, Configuration as WindowConfig, Rect as WindowRect, AvoidArea}

@Test
class BasicCommonOnlyCov {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.info(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
        Hilog.info(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("BasicCommonBranchCov")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCommon() {
        scrollTo("ViewCovCommonModule")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testViewCovPersistentStorage() {
        scrollTo("ViewCovPersistentStorage")
    }

    
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testCommonComponent() {
        scrollTo("ViewCovCommonComponent")
    }
}