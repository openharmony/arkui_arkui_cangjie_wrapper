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
import ohos.ui_test.*
import ohos.business_exception.*
import ohos.device_info.*
import ohos.hilog.*
import std.convert.*

@Test
class CanvasUTImageBitmap {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    private func scrollTo(view: String) {
        driver.delayMs(500)
        Hilog.error(1, "Cangjie-Test", "scrollTo ${view}")
        var isSuccess = true
        var count = 0
        do {
            try {
                let scrollBar = driver.findComponent(On().id("scroller"))
                scrollBar?.scrollSearch(On().id(view))?.click()
                driver.delayMs(800)
                isSuccess = true
            } catch (e: BusinessException) {
                Hilog.error(1, "Cangjie-Test", e.message)
                driver.pressBack()
                driver.delayMs(500)
                count = count + 1
                isSuccess = false
            }
        } while (!isSuccess && count < 5)
    }
    
    func hasComponent(id: String): Bool {
        let scrollBar = driver.findComponent(On().id("scroller"))
        scrollBar?.scrollSearch(On().id(id))
        return driver.findComponent(On().id(id)).isSome()
    }

    protected override func beforeAll() {
        driver.delayMs(500)
        let scrollBar = driver.findComponent(On().id("scroller"))
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar?.scrollSearch(On().id("CanvasDrawingImageBitmap"))?.click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        
    }
    
    func getContent(id: String): String {
        let strJson = getInspectorByKey(id)
        let obj = JsonValue.fromStr(strJson).asObject()
        let attrsInfo = obj.get("$attrs").getOrThrow().asObject()
        return attrsInfo.get("content").getOrThrow().toString()
    }
    
    func getFloat64FromText(id: String): Float64 {
        let str = getContent(id)
        return Float64.parse(str.trimAscii().removePrefix('"').removeSuffix('"'))
    }

    // ImageBitmap init
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapInitNormal1() {
        scrollTo("ViewImageBitmapInit")
        @Expect(hasComponent("imageBitmapInitNormal1"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapInitNormal2() {
        @Expect(hasComponent("imageBitmapInitNormal2"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapInitException() {
        @Expect(hasComponent("imageBitmapInitException"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapBoundary() {
        @Expect(hasComponent("imageBitmapInitBoundary"), true)
    }
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapInitNone() {
        @Expect(hasComponent("imageBitmapInitNone"), true)
        driver.pressBack()
    }
    
    // ImageBitmap width
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapWidth() {
        scrollTo("ViewImageBitmapWidth")
        @Expect(hasComponent("ImageBitmapWidth"), true)
        let width = getFloat64FromText("ImageBitmapWidthText")
        @Expect(width > 109.0 && width < 110.0, true)
        driver.pressBack()
    }
    
    // ImageBitmap height
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testImageBitmapHeight() {
        scrollTo("ViewImageBitmapHeight")
        @Expect(hasComponent("ImageBitmapHeight"), true)
        let width = getFloat64FromText("ImageBitmapHeightText")
        @Expect(width > 136.0 && width < 137.0, true)
        driver.pressBack()
    }
}
