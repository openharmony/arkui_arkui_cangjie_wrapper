package ohos_app_cangjie_entry

import std.unittest.testmacro.*
import std.unittest.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.ui_test.*

@Test
class Reusable_UT_1 {
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
                let scrollBar = driver.findComponent(On().id("scroller")).getOrThrow()
                scrollBar.scrollSearch(On().id(view)).getOrThrow().click()
                driver.delayMs(500)
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

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("CangjieReuse")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func reuseIf() {
        scrollTo("View_If")
        let button = driver.findComponent(On().id("reuse_if_scroller"))
        button?.click()
        driver.delayMs(300)
        let Inspector = getInspectorByKey("if_txt_60")
        let obj = JsonValue.fromStr(Inspector).asObject()
        let fill = obj.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()

        @Expect(fill, "\"60\"")
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func reuseLazy() {
        scrollTo("View_Lazyforeach")
        let button = driver.findComponent(On().id("reuse_lazy_scroller"))
        button?.click()
        driver.delayMs(500)
        let Inspector = getInspectorByKey("Child_49")
        let obj = JsonValue.fromStr(Inspector).asObject()
        let fill = obj.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()

        @Expect(fill, "\"Child_49\"")
    }

    @TestCase
    @Tag[APILevel26, TestLevel0]
    func reuseMulti() {
        scrollTo("View_Multitype")
        let button = driver.findComponent(On().id("reuse_mul_scroller"))
        button?.click()
        driver.delayMs(500)
        let Inspector = getInspectorByKey("compA_18")
        let obj = JsonValue.fromStr(Inspector).asObject()
        let fill = obj.get("$attrs").getOrThrow().asObject().get("content").getOrThrow().toString()

        @Expect(fill, "\"Item 18 Child Component A\"")
    }
}