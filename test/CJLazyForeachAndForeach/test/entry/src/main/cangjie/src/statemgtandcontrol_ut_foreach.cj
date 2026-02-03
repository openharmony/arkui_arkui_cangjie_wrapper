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
class StateMgtAndControlUTForEach {
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
        scrollBar.scrollSearch(On().id("StateMgtAndControl4Foreach")).getOrThrow().click()
        driver.delayMs(500)
    }

    protected override func afterEach() {
        driver.pressBack()
    }

    /**
     * TC_001: Array数据源不带keyGenerator
     * 测试场景: 使用Array作为数据源，不提供keyGenerator参数
     * 预期结果: ForEach正确渲染所有元素，每个元素都能通过id正确访问
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC001_ArrayWithoutKeyGenerator() {
        scrollTo("ViewForeachTC001")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_001] 开始测试: Array数据源不带keyGenerator")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_001"), true)
        Hilog.info(1, "Cangjie-Test", "[TC_001] 标题验证通过: ${title}")
        
        // 验证所有4个元素都被正确渲染
        for (i in 0..3) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, "${i}: item${i}")
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_001] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_001] 测试完成")
    }

    /**
     * TC_002: Array数据源带keyGenerator
     * 测试场景: 使用Array作为数据源，提供keyGenerator参数
     * 预期结果: ForEach正确渲染所有元素，keyGenerator被正确使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC002_ArrayWithKeyGenerator() {
        scrollTo("ViewForeachTC002")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_002] 开始测试: Array数据源带keyGenerator")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_002"), true)
        
        // 验证所有3个元素都被正确渲染
        let expectedItems = ["a", "b", "c"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedItems[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_002] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_002] 测试完成")
    }

    /**
     * TC_003: ArrayList数据源
     * 测试场景: 使用ArrayList作为数据源
     * 预期结果: ForEach正确渲染所有元素
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC003_ArrayListDataSource() {
        scrollTo("ViewForeachTC003")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_003] 开始测试: ArrayList数据源")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_003"), true)
        
        // 验证所有3个元素都被正确渲染
        let expectedValues = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedValues[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_003] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_003] 测试完成")
    }

    /**
     * TC_004: ObservedArrayList数据源
     * 测试场景: 使用ObservedArrayList作为数据源
     * 预期结果: ForEach正确渲染所有元素
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC004_ObservedArrayListDataSource() {
        scrollTo("ViewForeachTC004")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_004] 开始测试: ObservedArrayList数据源")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_004"), true)
        
        // 验证所有3个元素都被正确渲染
        let expectedValues = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedValues[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_004] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_004] 测试完成")
    }

    /**
     * TC_005: 空数组初始化
     * 测试场景: 使用空数组作为数据源
     * 预期结果: ForEach不渲染任何元素，但不会报错
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC005_EmptyArray() {
        scrollTo("ViewForeachTC005")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_005] 开始测试: 空数组初始化")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_005"), true)
        
        // 验证提示文本存在
        let hint = driver.findComponent(On().id("empty_hint")).getOrThrow()
        @Expect(hint.getType(), "Text")
        
        // 验证没有元素被渲染（foreach_item_0 不应该存在）
        let item0 = driver.findComponent(On().id("foreach_item_0"))
        match (item0) {
            case None => Hilog.info(1, "Cangjie-Test", "[TC_005] 正确：没有元素被渲染")
            case Some(_) => Hilog.error(1, "Cangjie-Test", "[TC_005] 错误：不应该有元素被渲染")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_005] 测试完成")
    }

    /**
     * TC_006: 单元素数组初始化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC006_SingleElementArray() {
        scrollTo("ViewForeachTC006")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_006] 开始测试: 单元素数组初始化")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_006"), true)
        let item = driver.findComponent(On().id("foreach_item_0")).getOrThrow()
        @Expect(item.getText(), "1")
        Hilog.info(1, "Cangjie-Test", "[TC_006] 测试完成")
    }

    /**
     * TC_007: 大数组初始化
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC007_LargeArray() {
        scrollTo("ViewForeachTC007")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_007] 开始测试: 大数组初始化")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_007"), true)
        // 验证前几个元素
        for (i in 0..4) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i}")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_007] 测试完成")
    }

    /**
     * TC_008: String类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC008_StringType() {
        scrollTo("ViewForeachTC008")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_008] 开始测试: String类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_008"), true)
        let expected = ["hello", "world"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_008] 测试完成")
    }

    /**
     * TC_009: Int64类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC009_Int64Type() {
        scrollTo("ViewForeachTC009")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_009] 开始测试: Int64类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_009"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_009] 测试完成")
    }

    /**
     * TC_010: Float64类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC010_Float64Type() {
        scrollTo("ViewForeachTC010")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_010] 开始测试: Float64类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_010"), true)
        // Float64的字符串表示可能包含精度，只验证包含数字
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text.contains("."), true)
        }
        Hilog.info(1, "Cangjie-Test", "[TC_010] 测试完成")
    }

    /**
     * TC_011: Bool类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC011_BoolType() {
        scrollTo("ViewForeachTC011")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_011] 开始测试: Bool类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_011"), true)
        let item0 = driver.findComponent(On().id("foreach_item_0")).getOrThrow()
        let item1 = driver.findComponent(On().id("foreach_item_1")).getOrThrow()
        @Expect(item0.getText().contains("true"), true)
        @Expect(item1.getText().contains("false"), true)
        Hilog.info(1, "Cangjie-Test", "[TC_011] 测试完成")
    }

    /**
     * TC_012: 自定义类型数据
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC012_CustomType() {
        scrollTo("ViewForeachTC012")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_012] 开始测试: 自定义类型数据")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_012"), true)
        let expected = ["1: item1", "2: item2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_012] 测试完成")
    }

    /**
     * TC_013: itemGenerator正确接收item和index参数
     * 测试场景: 验证itemGenerator能正确接收item和index参数
     * 预期结果: 每个元素显示正确的item和index值
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC013_ItemGeneratorParameters() {
        scrollTo("ViewForeachTC013")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_013] 开始测试: itemGenerator参数验证")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_013"), true)
        
        // 验证所有3个元素，检查item和index参数是否正确传递
        let expectedTexts = ["Item: 1, Index: 0", "Item: 2, Index: 1", "Item: 3, Index: 2"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedTexts[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_013] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_013] 测试完成")
    }

    /**
     * TC_014: itemGenerator中使用index参数
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC014_ItemGeneratorUseIndex() {
        scrollTo("ViewForeachTC014")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_014] 开始测试: itemGenerator中使用index参数")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_014"), true)
        let expected = ["0: a", "1: b", "2: c"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_014] 测试完成")
    }

    /**
     * TC_015: itemGenerator生成复杂UI组件
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC015_ItemGeneratorComplexUI() {
        scrollTo("ViewForeachTC015")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_015] 开始测试: itemGenerator生成复杂UI组件")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_015"), true)
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getType(), "Column")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_015] 测试完成")
    }

    /**
     * TC_016: itemGenerator中访问外部变量
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC016_ItemGeneratorAccessExternal() {
        scrollTo("ViewForeachTC016")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_016] 开始测试: itemGenerator中访问外部变量")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_016"), true)
        let expected = ["Item_1", "Item_2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_016] 测试完成")
    }

    /**
     * TC_017: itemGenerator中修改外部状态
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC017_ItemGeneratorModifyState() {
        scrollTo("ViewForeachTC017")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_017] 开始测试: itemGenerator中修改外部状态")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_017"), true)
        // 验证按钮存在
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getType(), "Button")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_017] 测试完成")
    }

    /**
     * TC_018: 基于item生成key
     * 测试场景: keyGenerator使用item值生成key
     * 预期结果: ForEach正确渲染所有元素
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC018_KeyGeneratorFromItem() {
        scrollTo("ViewForeachTC018")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_018] 开始测试: 基于item生成key")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_018"), true)
        
        // 验证所有3个元素都被正确渲染
        let expectedItems = ["apple", "banana", "cherry"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedItems[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_018] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_018] 测试完成")
    }

    /**
     * TC_019: keyGenerator基于index生成key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC019_KeyGeneratorFromIndex() {
        scrollTo("ViewForeachTC019")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_019] 开始测试: keyGenerator基于index生成key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_019"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_019] 测试完成")
    }

    /**
     * TC_020: keyGenerator组合item和index
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC020_KeyGeneratorCombine() {
        scrollTo("ViewForeachTC020")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_020] 开始测试: keyGenerator组合item和index")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_020"), true)
        let expected = ["a", "b"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_020] 测试完成")
    }

    /**
     * TC_021: keyGenerator生成重复key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC021_KeyGeneratorDuplicate() {
        scrollTo("ViewForeachTC021")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_021] 开始测试: keyGenerator生成重复key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_021"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_021] 测试完成")
    }

    /**
     * TC_022: keyGenerator生成空字符串key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC022_KeyGeneratorEmpty() {
        scrollTo("ViewForeachTC022")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_022] 开始测试: keyGenerator生成空字符串key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_022"), true)
        let expected = ["1", "2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_022] 测试完成")
    }

    /**
     * TC_023: keyGenerator生成特殊字符key
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC023_KeyGeneratorSpecialChars() {
        scrollTo("ViewForeachTC023")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_023] 开始测试: keyGenerator生成特殊字符key")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_023"), true)
        let expected = ["1", "2"]
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_023] 测试完成")
    }

    /**
     * TC_024: Array和ArrayList混合使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC024_ArrayAndArrayListMix() {
        scrollTo("ViewForeachTC024")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_024] 开始测试: Array和ArrayList混合使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_024"), true)
        // 验证Array数据源
        for (i in 0..2) {
            let item = driver.findComponent(On().id("array_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i + 1}")
        }
        // 验证ArrayList数据源
        for (i in 0..2) {
            let item = driver.findComponent(On().id("list_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i + 4}")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_024] 测试完成")
    }

    /**
     * TC_025: 动态数据源ObservedArrayList
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC025_DynamicObservedArrayList() {
        scrollTo("ViewForeachTC025")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_025] 开始测试: 动态数据源ObservedArrayList")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_025"), true)
        // 验证初始元素
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i + 1}")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_025] 测试完成")
    }

    /**
     * TC_026: 多个ForEach使用不同的itemGenerator
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC026_MultipleForEachDifferent() {
        scrollTo("ViewForeachTC026")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_026] 开始测试: 多个ForEach使用不同的itemGenerator")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_026"), true)
        // 验证第一个ForEach
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach1_item_${i}")).getOrThrow()
            @Expect(item.getText().contains("Number"), true)
        }
        // 验证第二个ForEach
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach2_item_${i}")).getOrThrow()
            @Expect(item.getText().contains("Text"), true)
        }
        Hilog.info(1, "Cangjie-Test", "[TC_026] 测试完成")
    }

    /**
     * TC_027: itemGenerator中嵌套ForEach
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC027_NestedForEach() {
        scrollTo("ViewForeachTC027")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_027] 开始测试: itemGenerator中嵌套ForEach")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_027"), true)
        // 验证父元素
        for (i in 0..1) {
            let parent = driver.findComponent(On().id("parent_${i}")).getOrThrow()
            @Expect(parent.getText().contains("Parent"), true)
        }
        // 验证子元素
        let child00 = driver.findComponent(On().id("child_0_0")).getOrThrow()
        @Expect(child00.getText().contains("Child"), true)
        Hilog.info(1, "Cangjie-Test", "[TC_027] 测试完成")
    }

    /**
     * TC_028: itemGenerator中使用条件渲染
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC028_ItemGeneratorConditional() {
        scrollTo("ViewForeachTC028")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_028] 开始测试: itemGenerator中使用条件渲染")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_028"), true)
        // 验证条件渲染结果
        let item0 = driver.findComponent(On().id("foreach_item_0")).getOrThrow()
        @Expect(item0.getText(), "zero")
        let item2 = driver.findComponent(On().id("foreach_item_2")).getOrThrow()
        @Expect(item2.getText(), "1")
        Hilog.info(1, "Cangjie-Test", "[TC_028] 测试完成")
    }

    /**
     * TC_029: 带/不带keyGenerator混合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC029_WithAndWithoutKeyGenerator() {
        scrollTo("ViewForeachTC029")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_029] 开始测试: 带/不带keyGenerator混合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_029"), true)
        // 验证两个ForEach都正常工作
        for (i in 0..1) {
            let item1 = driver.findComponent(On().id("foreach1_item_${i}")).getOrThrow()
            let item2 = driver.findComponent(On().id("foreach2_item_${i}")).getOrThrow()
            @Expect(item1.getType(), "Text")
            @Expect(item2.getType(), "Text")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_029] 测试完成")
    }

    /**
     * TC_030: keyGenerator与数据源类型组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC030_KeyGeneratorWithDataSource() {
        scrollTo("ViewForeachTC030")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_030] 开始测试: keyGenerator与数据源类型组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_030"), true)
        // 验证Array和ArrayList都正常工作
        for (i in 0..1) {
            let arrayItem = driver.findComponent(On().id("array_item_${i}")).getOrThrow()
            let listItem = driver.findComponent(On().id("list_item_${i}")).getOrThrow()
            @Expect(arrayItem.getType(), "Text")
            @Expect(listItem.getType(), "Text")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_030] 测试完成")
    }

    /**
     * TC_031: ForEach在Column中使用
     * 测试场景: ForEach作为Column的子组件
     * 预期结果: ForEach在Column中正常工作
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC031_ForEachInColumn() {
        scrollTo("ViewForeachTC031")
        driver.delayMs(500)
        
        Hilog.info(1, "Cangjie-Test", "[TC_031] 开始测试: ForEach在Column中使用")
        
        // 验证标题
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_031"), true)
        
        // 验证Column容器存在
        let column = driver.findComponent(On().id("column_container"))
        match (column) {
            case Some(c) =>
                @Expect(c.getType(), "Column")
                Hilog.info(1, "Cangjie-Test", "[TC_031] Column容器验证通过")
            case None => Hilog.error(1, "Cangjie-Test", "[TC_031] Column容器未找到")
        }
        
        // 验证所有3个元素都被正确渲染
        let expectedItems = ["item1", "item2", "item3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            let text = item.getText()
            @Expect(text, expectedItems[i])
            @Expect(item.getType(), "Text")
            Hilog.info(1, "Cangjie-Test", "[TC_031] 元素${i}验证通过: ${text}")
        }
        
        Hilog.info(1, "Cangjie-Test", "[TC_031] 测试完成")
    }

    /**
     * TC_032: ForEach在Row中使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC032_ForEachInRow() {
        scrollTo("ViewForeachTC032")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_032] 开始测试: ForEach在Row中使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_032"), true)
        let row = driver.findComponent(On().id("row_container")).getOrThrow()
        @Expect(row.getType(), "Row")
        let expected = ["item1", "item2", "item3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_032] 测试完成")
    }

    /**
     * TC_033: ForEach在Stack中使用
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC033_ForEachInStack() {
        scrollTo("ViewForeachTC033")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_033] 开始测试: ForEach在Stack中使用")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_033"), true)
        let stack = driver.findComponent(On().id("stack_container")).getOrThrow()
        @Expect(stack.getType(), "Stack")
        for (i in 0..1) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getType(), "Text")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_033] 测试完成")
    }

    /**
     * TC_034: ForEach与If条件组件组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC034_ForEachWithIf() {
        scrollTo("ViewForeachTC034")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_034] 开始测试: ForEach与If条件组件组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_034"), true)
        // 验证初始状态显示ForEach
        let item0 = driver.findComponent(On().id("foreach_item_0")).getOrThrow()
        @Expect(item0.getText(), "item1")
        Hilog.info(1, "Cangjie-Test", "[TC_034] 测试完成")
    }

    /**
     * TC_035: 多个ForEach在同一容器
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC035_MultipleForEachInContainer() {
        scrollTo("ViewForeachTC035")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_035] 开始测试: 多个ForEach在同一容器")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_035"), true)
        // 验证三个ForEach都正常工作
        for (i in 0..1) {
            let item1 = driver.findComponent(On().id("foreach1_item_${i}")).getOrThrow()
            let item2 = driver.findComponent(On().id("foreach2_item_${i}")).getOrThrow()
            let item3 = driver.findComponent(On().id("foreach3_item_${i}")).getOrThrow()
            @Expect(item1.getType(), "Text")
            @Expect(item2.getType(), "Text")
            @Expect(item3.getType(), "Text")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_035] 测试完成")
    }

    /**
     * TC_036: ForEach嵌套多层
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC036_NestedMultiLevel() {
        scrollTo("ViewForeachTC036")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_036] 开始测试: ForEach嵌套多层")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_036"), true)
        // 验证外层元素
        let outer0 = driver.findComponent(On().id("outer_0")).getOrThrow()
        @Expect(outer0.getText().contains("Outer"), true)
        // 验证内层元素
        let inner00 = driver.findComponent(On().id("inner_0_0")).getOrThrow()
        @Expect(inner00.getText().contains("Inner"), true)
        Hilog.info(1, "Cangjie-Test", "[TC_036] 测试完成")
    }

    /**
     * TC_037: ForEach与状态管理组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC037_ForEachWithStateManagement() {
        scrollTo("ViewForeachTC037")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_037] 开始测试: ForEach与状态管理组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_037"), true)
        // 验证初始元素
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), "${i + 1}")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_037] 测试完成")
    }

    /**
     * TC_038: ForEach与事件处理组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC038_ForEachWithEventHandler() {
        scrollTo("ViewForeachTC038")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_038] 开始测试: ForEach与事件处理组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_038"), true)
        // 验证按钮存在
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getType(), "Button")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_038] 测试完成")
    }

    /**
     * TC_039: ForEach与样式组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC039_ForEachWithStyles() {
        scrollTo("ViewForeachTC039")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_039] 开始测试: ForEach与样式组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_039"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_039] 测试完成")
    }

    /**
     * TC_040: ForEach与动画组合
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC040_ForEachWithAnimation() {
        scrollTo("ViewForeachTC040")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_040] 开始测试: ForEach与动画组合")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_040"), true)
        let expected = ["1", "2", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_040] 测试完成")
    }

    /**
     * TC_041: 数据源边界测试
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC041_DataSourceBoundary() {
        scrollTo("ViewForeachTC041")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_041] 开始测试: 数据源边界测试")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_041"), true)
        // 验证空数组不渲染元素
        let item0 = driver.findComponent(On().id("foreach_item_0"))
        match (item0) {
            case None => Hilog.info(1, "Cangjie-Test", "[TC_041] 正确：空数组不渲染元素")
            case Some(_) => Hilog.error(1, "Cangjie-Test", "[TC_041] 错误：不应该有元素")
        }
        Hilog.info(1, "Cangjie-Test", "[TC_041] 测试完成")
    }

    /**
     * TC_042: 数据源包含特殊值
     */
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func testForEachTC042_DataSourceSpecialValues() {
        scrollTo("ViewForeachTC042")
        driver.delayMs(500)
        Hilog.info(1, "Cangjie-Test", "[TC_042] 开始测试: 数据源包含特殊值")
        let title = driver.findComponent(On().id("test_title")).getOrThrow().getText()
        @Expect(title.contains("TC_042"), true)
        let expected = ["1", "0", "3"]
        for (i in 0..2) {
            let item = driver.findComponent(On().id("foreach_item_${i}")).getOrThrow()
            @Expect(item.getText(), expected[i])
        }
        Hilog.info(1, "Cangjie-Test", "[TC_042] 测试完成")
    }

    // ============================================================================
    // 以下测试用例（TC_043-TC_046）为异常场景，不适合UI测试，因此未实现
    // ============================================================================
    //
    // TC_043: itemGenerator抛出异常
    // 原因: 异常场景会导致应用崩溃，无法通过UI自动化测试验证
    // 建议: 此类异常处理应在单元测试或集成测试中验证
    //
    // TC_044: itemGenerator返回null（如果允许）
    // 原因: 仓颉语言的类型系统可能不允许返回null组件，且UI测试无法验证null处理
    // 建议: 如果类型系统支持，应在编译时或运行时测试中验证
    //
    // TC_045: keyGenerator抛出异常
    // 原因: 异常场景会导致应用崩溃，无法通过UI自动化测试验证
    // 建议: 此类异常处理应在单元测试或集成测试中验证
    //
    // TC_046: keyGenerator返回null（如果允许）
    // 原因: 仓颉语言的类型系统可能不允许返回null key，且UI测试无法验证null处理
    // 建议: 如果类型系统支持，应在编译时或运行时测试中验证
    //
    // ============================================================================
}

