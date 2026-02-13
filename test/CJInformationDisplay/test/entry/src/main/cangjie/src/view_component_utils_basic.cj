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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component_utils.*
import ohos.resource.__GenerateResource__

/**
 * ComponentUtils 模块基础测试
 * 包含：接口基础测试、Size 信息测试、Offset 坐标测试
 */
@Entry
@Component
class ViewComponentUtilsBasic {
    @State var sizeInfo: String = "点击按钮获取尺寸信息"
    @State var offsetInfo: String = "点击按钮获取坐标信息"
    @State var componentInfo: String = "点击按钮获取完整信息"
    @State var windowOffsetInfo: String = "点击按钮获取windowOffset信息"
    @State var screenOffsetInfo: String = "点击按钮获取screenOffset信息"
    @State var fixedSizeInfo: String = "点击按钮获取固定尺寸"
    @State var percentSizeInfo: String = "点击按钮获取百分比尺寸"
    @State var autoSizeInfo: String = "点击按钮获取自适应尺寸"
    @State var zeroSizeInfo: String = "点击按钮获取零尺寸"
    @State var localOffsetInfo: String = "点击按钮获取localOffset"
    @State var parentChildInfo: String = "点击按钮获取父子组件坐标"
    @State var textComponentInfo: String = "点击按钮获取Text组件信息"
    @State var imageComponentInfo: String = "点击按钮获取Image组件信息"
    @State var buttonComponentInfo: String = "点击按钮获取Button组件信息"
    
    func build() {
        Scroll() {
            Column() {
                // ========== 一、接口基础测试 ==========
                Text("一、接口基础测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("1.1 getRectangleById 接口定义验证").fontSize(16)
                Text("固定宽高的组件尺寸获取").fontSize(14)
                Text("测试组件")
                    .fontSize(16)
                    .width(200)
                    .height(100)
                    .backgroundColor(0xFF0000FF)
                    .id("basic_fixed_size")
                
                Button("获取组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("basic_fixed_size")
                    this.componentInfo = "Size: ${info.size.width}x${info.size.height}, " +
                                        "LocalOffset: (${info.localOffset.x}, ${info.localOffset.y})"
                })
                .width(200)
                .height(50)
                .margin(top: 10)
                
                Text(this.componentInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_component_info")
                
                Text("1.2 ComponentInfo 属性验证").fontSize(16)
                Text("size 属性验证").fontSize(14)
                Text("测试组件 - size")
                    .fontSize(16)
                    .width(150)
                    .height(80)
                    .backgroundColor(0xFF00FF00)
                    .id("attr_size")
                
                Button("获取size信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("attr_size")
                    this.sizeInfo = "Width: ${info.size.width}, Height: ${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.sizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_size_info")
                
                Text("localOffset 属性验证").fontSize(14)
                Text("测试组件 - localOffset")
                    .fontSize(16)
                    .width(120)
                    .height(60)
                    .backgroundColor(0xFFFF0000)
                    .margin(left: 50, top: 20)
                    .id("attr_local_offset")
                
                Button("获取localOffset信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("attr_local_offset")
                    this.offsetInfo = "LocalOffset: (${info.localOffset.x}, ${info.localOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.offsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_offset_info")
                
                Text("windowOffset 属性验证").fontSize(14)
                Text("测试组件 - windowOffset")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFFFF00)
                    .id("attr_window_offset")
                
                Button("获取windowOffset信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("attr_window_offset")
                    this.windowOffsetInfo = "WindowOffset: (${info.windowOffset.x}, ${info.windowOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.windowOffsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_window_offset_info")
                
                Text("screenOffset 属性验证").fontSize(14)
                Text("测试组件 - screenOffset")
                    .fontSize(16)
                    .width(180)
                    .height(90)
                    .backgroundColor(0xFFFFC0CB)
                    .id("attr_screen_offset")
                
                Button("获取screenOffset信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("attr_screen_offset")
                    this.screenOffsetInfo = "ScreenOffset: (${info.screenOffset.x}, ${info.screenOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.screenOffsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_screen_offset_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 二、Size 信息测试 ==========
                Text("二、Size 信息测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("2.1 基础尺寸获取").fontSize(16)
                Text("固定宽高的组件尺寸获取").fontSize(14)
                Text("固定尺寸")
                    .fontSize(16)
                    .width(200)
                    .height(100)
                    .backgroundColor(0xFF0000FF)
                    .id("size_fixed")
                
                Button("获取固定尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("size_fixed")
                    this.fixedSizeInfo = "Fixed Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.fixedSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_fixed_size_info")
                
                Text("百分比宽高的组件尺寸获取").fontSize(14)
                Text("百分比尺寸")
                    .fontSize(16)
                    .width(50.percent)
                    .height(80)
                    .backgroundColor(0xFF00FF00)
                    .id("size_percent")
                
                Button("获取百分比尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("size_percent")
                    this.percentSizeInfo = "Percent Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.percentSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_percent_size_info")
                
                Text("自适应内容的组件尺寸获取").fontSize(14)
                Text("自适应尺寸")
                    .fontSize(16)
                    .backgroundColor(0xFFFF0000)
                    .id("size_auto")
                
                Button("获取自适应尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("size_auto")
                    this.autoSizeInfo = "Auto Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.autoSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_auto_size_info")
                
                Text("零尺寸组件处理（width=0 或 height=0）").fontSize(14)
                Text("零尺寸")
                    .fontSize(16)
                    .width(0)
                    .height(0)
                    .backgroundColor(0xFFFFFF00)
                    .id("size_zero")
                
                Button("获取零尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("size_zero")
                    this.zeroSizeInfo = "Zero Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.zeroSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_zero_size_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 三、Offset 坐标测试 ==========
                Text("三、Offset 坐标测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("3.1 localOffset 本地偏移").fontSize(16)
                Text("固定布局中的本地偏移").fontSize(14)
                Text("固定布局")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF0000FF)
                    .margin(left: 30, top: 20)
                    .id("offset_local_fixed")
                
                Button("获取localOffset").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("offset_local_fixed")
                    this.localOffsetInfo = "LocalOffset: (${info.localOffset.x}, ${info.localOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.localOffsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_local_offset_info")
                
                Text("3.2 windowOffset 窗口偏移").fontSize(16)
                Text("窗口内组件偏移获取").fontSize(14)
                Text("窗口偏移")
                    .fontSize(16)
                    .width(150)
                    .height(75)
                    .backgroundColor(0xFFFFC0CB)
                    .id("offset_window")
                
                Button("获取windowOffset").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("offset_window")
                    this.windowOffsetInfo = "WindowOffset: (${info.windowOffset.x}, ${info.windowOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.windowOffsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_window_offset_info_2")
                
                Text("3.3 screenOffset 屏幕偏移").fontSize(16)
                Text("屏幕绝对坐标获取").fontSize(14)
                Text("屏幕偏移")
                    .fontSize(16)
                    .width(180)
                    .height(90)
                    .backgroundColor(0xFF00FFFF)
                    .id("offset_screen")
                
                Button("获取screenOffset").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("offset_screen")
                    this.screenOffsetInfo = "ScreenOffset: (${info.screenOffset.x}, ${info.screenOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.screenOffsetInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_screen_offset_info_2")
                
                Text("3.4 坐标关系验证").fontSize(16)
                Text("父子组件坐标关系验证").fontSize(14)
                Column() {
                    Text("父组件")
                        .fontSize(16)
                        .width(200)
                        .height(100)
                        .backgroundColor(0x4D808080)
                        .id("parent_component")
                    
                    Text("子组件")
                        .fontSize(16)
                        .width(150)
                        .height(75)
                        .backgroundColor(0xFF0000FF)
                        .margin(left: 25, top: 10)
                        .id("child_component")
                }
                .width(250)
                .height(150)
                .margin(top: 10)
                
                Button("获取父子组件坐标").onClick({ e =>
                    let parentInfo = ComponentUtils.getRectangleById("parent_component")
                    let childInfo = ComponentUtils.getRectangleById("child_component")
                    this.parentChildInfo = "Parent: (${parentInfo.localOffset.x}, ${parentInfo.localOffset.y}), " +
                                          "Child: (${childInfo.localOffset.x}, ${childInfo.localOffset.y})"
                })
                .width(200)
                .height(40)
                .margin(top: 10)
                
                Text(this.parentChildInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_parent_child_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 四、组件类型覆盖测试（基础组件） ==========
                Text("四、组件类型覆盖测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("4.1 基础组件").fontSize(16)
                Text("Text 组件信息获取").fontSize(14)
                Text("Text组件")
                    .fontSize(16)
                    .width(150)
                    .height(60)
                    .backgroundColor(0xFF0000FF)
                    .id("component_text")
                
                Button("获取Text组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("component_text")
                    this.textComponentInfo = "Text Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.textComponentInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_text_component_info")
                
                Text("Image 组件信息获取").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(150)
                    .height(100)
                    .id("component_image")
                
                Button("获取Image组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("component_image")
                    this.imageComponentInfo = "Image Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.imageComponentInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_image_component_info")
                
                Text("Button 组件信息获取").fontSize(14)
                Button("Button组件")
                    .width(150)
                    .height(50)
                    .id("component_button")
                
                Button("获取Button组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("component_button")
                    this.buttonComponentInfo = "Button Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.buttonComponentInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_button_component_info")
                
                Divider().margin(top: 10, bottom: 10)
            }
            .width(100.percent)
            .padding(left: 10, right: 10, top: 10, bottom: 10)
        }
        .id("scroller")
    }
}
