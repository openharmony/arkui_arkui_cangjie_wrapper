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
import ohos.ui_test
import std.collection.ArrayList
import std.math.*
import ohos.device_info.*
import ohos.hilog.Hilog
import ohos.business_exception.*

@Test
class StateMgtAndControlUTLazyForEach {
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
        driver.delayMs(500)
        let scrollBar = driver.waitForComponent(On().id("scroller"), 500).getOrThrow()
        Hilog.error(1, "Cangjie-Test", "started")
        scrollBar.scrollSearch(On().id("StateMgtAndControl4LazyForeach")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    // ============================================================================
    // LazyForEach 测试用例
    // ============================================================================

    /**
     * TC_001: IDataSource数据源不带keyGenerator
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC001_BasicInitWithoutKeyGenerator() {
        scrollTo("ViewLazyforeachTC001")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_001] 开始测试: IDataSource数据源不带keyGenerator")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_001"), true)
        let expected = ["0: item0", "1: item1", "2: item2", "3: item3"]
        for (i in 0..3) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_001] 测试完成")
    }

    /**
     * TC_002: IDataSource数据源带keyGenerator
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC002_BasicInitWithKeyGenerator() {
        scrollTo("ViewLazyforeachTC002")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_002] 开始测试: IDataSource数据源带keyGenerator")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_002"), true)
        let expected = ["a", "b", "c"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_002] 测试完成")
    }

    /**
     * TC_003: 空数据源初始化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC003_EmptyDataSource() {
        scrollTo("ViewLazyforeachTC003")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_003] 开始测试: 空数据源初始化")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_003"), true)
        let emptyHint = driver.findComponent(On().id("empty_hint")).getOrThrow()
        @Expect(emptyHint.getText().contains("Data source is empty"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_003] 测试完成")
    }

    /**
     * TC_004: 单元素数据源初始化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC004_SingleElementDataSource() {
        scrollTo("ViewLazyforeachTC004")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_004] 开始测试: 单元素数据源初始化")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_004"), true)
        let item = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        @Expect(item.getText(), "1")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_004] 测试完成")
    }

    /**
     * TC_005: 大数据源初始化(验证懒加载)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC005_LargeDataSource() {
        scrollTo("ViewLazyforeachTC005")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_005] 开始测试: 大数据源初始化")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_005"), true)
        // 验证前几个元素存在（懒加载只渲染可见的）
        for (i in 0..4) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i}")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_005] 测试完成")
    }

    /**
     * TC_006: String类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC006_StringTypeData() {
        scrollTo("ViewLazyforeachTC006")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_006] 开始测试: String类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_006"), true)
        let expected = ["hello", "world"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_006] 测试完成")
    }

    /**
     * TC_007: Int64类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC007_Int64TypeData() {
        scrollTo("ViewLazyforeachTC007")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_007] 开始测试: Int64类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_007"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_007] 测试完成")
    }

    /**
     * TC_008: Float64类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC008_Float64TypeData() {
        scrollTo("ViewLazyforeachTC008")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_008] 开始测试: Float64类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_008"), true)
        let expected = ["1.100000", "2.200000", "3.300000"]
        for (i in 0..3) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_008] 测试完成")
    }

    /**
     * TC_009: Bool类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC009_BoolTypeData() {
        scrollTo("ViewLazyforeachTC009")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_009] 开始测试: Bool类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_009"), true)
        let expected = ["true", "false"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_009] 测试完成")
    }

    /**
     * TC_010: 自定义类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC010_CustomTypeData() {
        scrollTo("ViewLazyforeachTC010")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_010] 开始测试: 自定义类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_010"), true)
        let expected = ["1: item1", "2: item2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_010] 测试完成")
    }

    /**
     * TC_011: itemGenerator正确接收item和index参数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC011_ItemGeneratorParameters() {
        scrollTo("ViewLazyforeachTC011")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_011] 开始测试: itemGenerator参数验证")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_011"), true)
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText().contains("Item: ${i + 1}"), true)
            @Expect(item.getText().contains("Index: ${i}"), true)
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_011] 测试完成")
    }

    /**
     * TC_012: itemGenerator中使用index参数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC012_ItemGeneratorUseIndex() {
        scrollTo("ViewLazyforeachTC012")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_012] 开始测试: itemGenerator中使用index参数")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_012"), true)
        let expected = ["0: a", "1: b", "2: c"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_012] 测试完成")
    }

    /**
     * TC_013: itemGenerator生成复杂UI组件
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC013_ItemGeneratorComplexUI() {
        scrollTo("ViewLazyforeachTC013")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_013] 开始测试: itemGenerator生成复杂UI组件")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_013"), true)
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i + 1}")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_013] 测试完成")
    }

    /**
     * TC_014: itemGenerator中访问外部变量
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC014_ItemGeneratorAccessExternalVar() {
        scrollTo("ViewLazyforeachTC014")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_014] 开始测试: itemGenerator中访问外部变量")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_014"), true)
        let expected = ["Item_1", "Item_2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_014] 测试完成")
    }

    /**
     * TC_015: itemGenerator中修改外部状态
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC015_ItemGeneratorModifyState() {
        scrollTo("ViewLazyforeachTC015")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_015] 开始测试: itemGenerator中修改外部状态")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_015"), true)
        let countDisplay = driver.findComponent(On().id("count_display")).getOrThrow()
        @Expect(countDisplay.getText().contains("Count: 0"), true)
        // 点击按钮修改状态
        let button = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        button.click()
        driver.delayMs(500)
        let countAfter = driver.findComponent(On().id("count_display")).getOrThrow()
        @Expect(countAfter.getText().contains("Count: 1"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_015] 测试完成")
    }

    /**
     * TC_016: keyGenerator基于item生成key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC016_KeyGeneratorFromItem() {
        scrollTo("ViewLazyforeachTC016")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_016] 开始测试: keyGenerator基于item生成key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_016"), true)
        let expected = ["apple", "banana", "cherry"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_016] 测试完成")
    }

    /**
     * TC_017: keyGenerator基于index生成key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC017_KeyGeneratorFromIndex() {
        scrollTo("ViewLazyforeachTC017")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_017] 开始测试: keyGenerator基于index生成key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_017"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_017] 测试完成")
    }

    /**
     * TC_018: keyGenerator组合item和index
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC018_KeyGeneratorCombineItemIndex() {
        scrollTo("ViewLazyforeachTC018")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_018] 开始测试: keyGenerator组合item和index")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_018"), true)
        let expected = ["a", "b"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_018] 测试完成")
    }

    /**
     * TC_019: keyGenerator生成重复key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC019_KeyGeneratorDuplicateKey() {
        scrollTo("ViewLazyforeachTC019")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_019] 开始测试: keyGenerator生成重复key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_019"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_019] 测试完成")
    }

    /**
     * TC_020: keyGenerator生成空字符串key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC020_KeyGeneratorEmptyKey() {
        scrollTo("ViewLazyforeachTC020")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_020] 开始测试: keyGenerator生成空字符串key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_020"), true)
        let expected = ["1", "2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_020] 测试完成")
    }

    /**
     * TC_021: keyGenerator生成特殊字符key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC021_KeyGeneratorSpecialChars() {
        scrollTo("ViewLazyforeachTC021")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_021] 开始测试: keyGenerator生成特殊字符key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_021"), true)
        let expected = ["1", "2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_021] 测试完成")
    }

    /**
     * TC_022: IDataSource.totalCount()正确返回
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC022_DataSourceTotalCount() {
        scrollTo("ViewLazyforeachTC022")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_022] 开始测试: IDataSource.totalCount()正确返回")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_022"), true)
        let totalCountDisplay = driver.findComponent(On().id("total_count_display")).getOrThrow()
        @Expect(totalCountDisplay.getText().contains("TotalCount: 3"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_022] 测试完成")
    }

    /**
     * TC_023: IDataSource.getData()正确返回数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC023_DataSourceGetData() {
        scrollTo("ViewLazyforeachTC023")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_023] 开始测试: IDataSource.getData()正确返回数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_023"), true)
        let dataDisplay = driver.findComponent(On().id("data_display")).getOrThrow()
        @Expect(dataDisplay.getText().contains("Data[0]: item0"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_023] 测试完成")
    }

    /**
     * TC_024: 数据源添加数据(onDataAdd)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC024_DataSourceAddData() {
        scrollTo("ViewLazyforeachTC024")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_024] 开始测试: 数据源添加数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_024"), true)
        // 点击添加按钮
        let addButton = driver.findComponent(On().id("add_button")).getOrThrow()
        addButton.click()
        driver.delayMs(500)
        // 验证新元素存在
        let newItem = driver.findComponent(On().id("lazyforeach_item_3")).getOrThrow()
        @Expect(newItem.getText().contains("item3"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_024] 测试完成")
    }

    /**
     * TC_025: 数据源删除数据(onDataDelete)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC025_DataSourceDeleteData() {
        scrollTo("ViewLazyforeachTC025")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_025] 开始测试: 数据源删除数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_025"), true)
        // 点击删除按钮
        let deleteButton = driver.findComponent(On().id("delete_button")).getOrThrow()
        deleteButton.click()
        driver.delayMs(500)
        // 验证最后一个元素被删除
        let item2 = driver.findComponent(On().id("lazyforeach_item_2"))
        match (item2) {
            case None => Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_025] 正确：元素已删除")
            case Some(_) => Hilog.error(1, "Cangjie-Test", "[LazyForEach TC_025] 错误：元素应该被删除")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_025] 测试完成")
    }

    /**
     * TC_026: 数据源修改数据(onDataChange)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC026_DataSourceChangeData() {
        scrollTo("ViewLazyforeachTC026")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_026] 开始测试: 数据源修改数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_026"), true)
        // 点击修改按钮
        let changeButton = driver.findComponent(On().id("change_button")).getOrThrow()
        changeButton.click()
        driver.delayMs(500)
        // 验证第一个元素被修改
        let item0 = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        @Expect(item0.getText(), "modified_item0")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_026] 测试完成")
    }

    /**
     * TC_027: 数据源移动数据(onDataMove)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC027_DataSourceMoveData() {
        scrollTo("ViewLazyforeachTC027")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_027] 开始测试: 数据源移动数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_027"), true)
        // 点击移动按钮
        let moveButton = driver.findComponent(On().id("move_button")).getOrThrow()
        moveButton.click()
        driver.delayMs(500)
        // 验证元素位置已移动
        let item0 = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        let item2 = driver.findComponent(On().id("lazyforeach_item_2")).getOrThrow()
        @Expect(item0.getText(), "item0")
        @Expect(item2.getText(), "item2")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_027] 测试完成")
    }

    /**
     * TC_028: 数据源重新加载(onDataReloaded)
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC028_DataSourceReload() {
        scrollTo("ViewLazyforeachTC028")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_028] 开始测试: 数据源重新加载")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_028"), true)
        // 点击重新加载按钮
        let reloadButton = driver.findComponent(On().id("reload_button")).getOrThrow()
        reloadButton.click()
        driver.delayMs(500)
        // 验证数据仍然存在
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText().contains("item"), true)
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_028] 测试完成")
    }

    /**
     * TC_029: 只渲染可见项（懒加载特性）
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC029_LazyLoadVisibleItems() {
        scrollTo("ViewLazyforeachTC029")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_029] 开始测试: 只渲染可见项")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_029"), true)
        // 验证前几个可见元素存在
        for (i in 0..4) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i}")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_029] 测试完成")
    }

    /**
     * TC_032: keyGenerator对懒加载的影响
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC032_KeyGeneratorLazyLoad() {
        scrollTo("ViewLazyforeachTC032")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_032] 开始测试: keyGenerator对懒加载的影响")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_032"), true)
        // 验证前几个元素存在
        for (i in 0..4) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "item${i}")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_032] 测试完成")
    }

    /**
     * TC_033: LazyForEach在Column中使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC033_LazyForEachInColumn() {
        scrollTo("ViewLazyforeachTC033")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_033] 开始测试: LazyForEach在Column中使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_033"), true)
        let columnContainer = driver.findComponent(On().id("column_container")).getOrThrow()
        @Expect(columnContainer.getType(), "Column")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_033] 测试完成")
    }

    /**
     * TC_034: LazyForEach在Row中使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC034_LazyForEachInRow() {
        scrollTo("ViewLazyforeachTC034")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_034] 开始测试: LazyForEach在Row中使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_034"), true)
        let rowContainer = driver.findComponent(On().id("row_container")).getOrThrow()
        @Expect(rowContainer.getType(), "Row")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_034] 测试完成")
    }

    /**
     * TC_035: LazyForEach在Scroll中使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC035_LazyForEachInScroll() {
        scrollTo("ViewLazyforeachTC035")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_035] 开始测试: LazyForEach在Scroll中使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_035"), true)
        let scrollContainer = driver.findComponent(On().id("scroll_container")).getOrThrow()
        @Expect(scrollContainer.getType(), "Scroll")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_035] 测试完成")
    }

    /**
     * TC_036: LazyForEach与If条件组件组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC036_LazyForEachWithIf() {
        scrollTo("ViewLazyforeachTC036")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_036] 开始测试: LazyForEach与If条件组件组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_036"), true)
        // 验证初始状态显示列表
        for (i in 0..2) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText().contains("item"), true)
        }
        // 点击切换按钮
        let toggleButton = driver.findComponent(On().id("toggle_button")).getOrThrow()
        toggleButton.click()
        driver.delayMs(500)
        // 验证显示Empty
        let emptyText = driver.findComponent(On().id("empty_text")).getOrThrow()
        @Expect(emptyText.getText(), "Empty")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_036] 测试完成")
    }

    /**
     * TC_037: itemGenerator中嵌套LazyForEach
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC037_NestedLazyForEach() {
        scrollTo("ViewLazyforeachTC037")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_037] 开始测试: itemGenerator中嵌套LazyForEach")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_037"), true)
        // 验证父元素存在
        let parent0 = driver.findComponent(On().id("parent_0")).getOrThrow()
        @Expect(parent0.getText().contains("Parent: 1"), true)
        // 验证子元素存在
        let child00 = driver.findComponent(On().id("child_0_0")).getOrThrow()
        @Expect(child00.getText().contains("Child: a"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_037] 测试完成")
    }

    /**
     * TC_038: itemGenerator中使用条件渲染
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC038_ItemGeneratorConditionalRender() {
        scrollTo("ViewLazyforeachTC038")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_038] 开始测试: itemGenerator中使用条件渲染")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_038"), true)
        // 验证正数显示数字
        let item2 = driver.findComponent(On().id("lazyforeach_item_2")).getOrThrow()
        @Expect(item2.getText(), "1")
        // 验证非正数显示zero
        let item0 = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        @Expect(item0.getText(), "zero")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_038] 测试完成")
    }

    /**
     * TC_039: 带/不带keyGenerator混合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC039_MixedWithWithoutKeyGenerator() {
        scrollTo("ViewLazyforeachTC039")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_039] 开始测试: 带/不带keyGenerator混合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_039"), true)
        // 验证第一个列表（不带keyGenerator）
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach1_item_${i}")).getOrThrow()
            @Expect(item.getText(), ["a", "b"][i])
        }
        // 验证第二个列表（带keyGenerator）
        for (i in 0..1) {
            let item = driver.findComponent(On().id("lazyforeach2_item_${i}")).getOrThrow()
            @Expect(item.getText(), ["c", "d"][i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_039] 测试完成")
    }

    /**
     * TC_040: LazyForEach与状态管理组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC040_LazyForEachWithState() {
        scrollTo("ViewLazyforeachTC040")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_040] 开始测试: LazyForEach与状态管理组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_040"), true)
        // 点击添加按钮
        let addButton = driver.findComponent(On().id("add_button")).getOrThrow()
        addButton.click()
        driver.delayMs(500)
        // 验证新元素存在
        let newItem = driver.findComponent(On().id("lazyforeach_item_2")).getOrThrow()
        @Expect(newItem.getText(), "3")
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_040] 测试完成")
    }

    /**
     * TC_041: LazyForEach与事件处理组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC041_LazyForEachWithEvent() {
        scrollTo("ViewLazyforeachTC041")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_041] 开始测试: LazyForEach与事件处理组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_041"), true)
        // 点击第一个按钮
        let button0 = driver.findComponent(On().id("lazyforeach_item_0")).getOrThrow()
        button0.click()
        driver.delayMs(500)
        // 验证点击的元素被记录
        let clickedDisplay = driver.findComponent(On().id("clicked_display")).getOrThrow()
        @Expect(clickedDisplay.getText().contains("apple"), true)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_041] 测试完成")
    }

    /**
     * TC_042: LazyForEach与样式组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC042_LazyForEachWithStyles() {
        scrollTo("ViewLazyforeachTC042")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_042] 开始测试: LazyForEach与样式组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_042"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..3) {
            let item = driver.findComponent(On().id("lazyforeach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_042] 测试完成")
    }

    /**
     * TC_043: 数据源totalCount为0
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testLazyForEachTC043_DataSourceTotalCountZero() {
        scrollTo("ViewLazyforeachTC043")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_043] 开始测试: 数据源totalCount为0")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_043"), true)
        let totalCountDisplay = driver.findComponent(On().id("total_count_display")).getOrThrow()
        @Expect(totalCountDisplay.getText().contains("TotalCount: 0"), true)
        // 验证没有元素被渲染
        let item0 = driver.findComponent(On().id("lazyforeach_item_0"))
        match (item0) {
            case None => Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_043] 正确：没有元素被渲染")
            case Some(_) => Hilog.error(1, "Cangjie-Test", "[LazyForEach TC_043] 错误：不应该有元素")
        }
        Hilog.info(1, "Cangjie-Test", "[LazyForEach TC_043] 测试完成")
    }
}

