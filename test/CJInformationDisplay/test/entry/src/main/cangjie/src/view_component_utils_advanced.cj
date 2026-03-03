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
 * ComponentUtils 模块高级测试
 * 包含：Transform 变换信息测试、容器组件测试、布局场景测试、动态变化场景测试、边界条件测试
 */
@Entry
@Component
class ViewComponentUtilsAdvanced {
    @State var width: Float64 = 150.0
    @State var height: Float64 = 75.0
    @State var translateX: Float64 = 0.0
    @State var translateY: Float64 = 0.0
    @State var scaleX: Float32 = 1.0
    @State var scaleY: Float32 = 1.0
    @State var angle: Float32 = 0.0
    @State var isVisible: Bool = true
    @State var translateInfo: String = "点击按钮获取translate信息"
    @State var translateYInfo: String = "点击按钮获取Y轴平移"
    @State var translateXYZInfo: String = "点击按钮获取组合平移"
    @State var scaleInfo: String = "点击按钮获取scale信息"
    @State var scaleUniformInfo: String = "点击按钮获取等比例缩放"
    @State var scaleCenterInfo: String = "点击按钮获取缩放中心点"
    @State var rotateInfo: String = "点击按钮获取rotate信息"
    @State var rotateCenterInfo: String = "点击按钮获取旋转中心点"
    @State var transformInfo: String = "点击按钮获取transform矩阵"
    @State var comboTranslateScaleInfo: String = "点击按钮获取平移+缩放"
    @State var comboTranslateRotateInfo: String = "点击按钮获取平移+旋转"
    @State var comboAllInfo: String = "点击按钮获取全组合变换"
    @State var columnInfo: String = "点击按钮获取Column组件信息"
    @State var rowInfo: String = "点击按钮获取Row组件信息"
    @State var stackInfo: String = "点击按钮获取Stack组件信息"
    @State var layoutFixedInfo: String = "点击按钮获取固定布局坐标"
    @State var flexLayoutInfo: String = "点击按钮获取Flex布局坐标"
    @State var dynamicSizeInfo: String = "点击按钮获取动态尺寸"
    @State var dynamicPositionInfo: String = "点击按钮获取动态位置"
    @State var dynamicScaleInfo: String = "点击按钮获取动态缩放"
    @State var dynamicRotateInfo: String = "点击按钮获取动态旋转"
    @State var zeroSizeInfo: String = "点击按钮获取零尺寸"
    @State var largeSizeInfo: String = "点击按钮获取超大尺寸"
    @State var disabledInfo: String = "点击按钮获取禁用组件信息"
    
    func build() {
        Scroll() {
            Column() {
                // ========== 四、Transform 变换信息测试 ==========
                Text("四、Transform 变换信息测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("4.1 translate 平移信息").fontSize(16)
                Text("X 轴平移获取").fontSize(14)
                Text("X轴平移")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF0000FF)
                    .translate(x: 50.px, y: 0.px)
                    .id("translate_x")
                
                Button("获取translate信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("translate_x")
                    this.translateInfo = "Translate: (${info.translate.x}, ${info.translate.y}, ${info.translate.z})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.translateInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_translate_info")
                
                Text("Y 轴平移获取").fontSize(14)
                Text("Y轴平移")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF00FF00)
                    .translate(x: 0.px, y: 30.px)
                    .id("translate_y")
                
                Button("获取Y轴平移").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("translate_y")
                    this.translateYInfo = "Translate Y: ${info.translate.y}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.translateYInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_translate_y_info")
                
                Text("组合平移（x, y, z）").fontSize(14)
                Text("组合平移")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFF0000)
                    .translate(x: 50.px, y: 30.px, z: 0.px)
                    .id("translate_xyz")
                
                Button("获取组合平移").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("translate_xyz")
                    this.translateXYZInfo = "Translate XYZ: (${info.translate.x}, ${info.translate.y}, ${info.translate.z})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.translateXYZInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_translate_xyz_info")
                
                Text("4.2 scale 缩放信息").fontSize(16)
                Text("X 轴缩放因子获取").fontSize(14)
                Text("X轴缩放")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFFFF00)
                    .scale(x: 1.5, y: 1.0)
                    .id("scale_x")
                
                Button("获取scale信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("scale_x")
                    this.scaleInfo = "Scale: (${info.scale.x}, ${info.scale.y}, ${info.scale.z}), Center: (${info.scale.centerX}, ${info.scale.centerY})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.scaleInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_scale_info")
                
                Text("等比例缩放验证").fontSize(14)
                Text("等比例缩放")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF00FFFF)
                    .scale(x: 1.2, y: 1.2)
                    .id("scale_uniform")
                
                Button("获取等比例缩放").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("scale_uniform")
                    this.scaleUniformInfo = "Uniform Scale: ${info.scale.x} = ${info.scale.y}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.scaleUniformInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_scale_uniform_info")
                
                Text("缩放中心点坐标获取").fontSize(14)
                Text("缩放中心点")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF0000FF)
                    .scale(x: 1.3, y: 1.3, centerX: 50.px, centerY: 25.px)
                    .id("scale_center")
                
                Button("获取缩放中心点").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("scale_center")
                    this.scaleCenterInfo = "Scale Center: (${info.scale.centerX}, ${info.scale.centerY})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.scaleCenterInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_scale_center_info")
                
                Text("4.3 rotate 旋转信息").fontSize(16)
                Text("2D 旋转（Z 轴旋转）").fontSize(14)
                Text("Z轴旋转")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF00FF00)
                    .rotate(angle: 45.0)
                    .id("rotate_z")
                
                Button("获取rotate信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("rotate_z")
                    this.rotateInfo = "Rotate: angle=${info.rotate.angle}, axis=(${info.rotate.x}, ${info.rotate.y}, ${info.rotate.z}), Center: (${info.rotate.centerX}, ${info.rotate.centerY})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.rotateInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_rotate_info")
                
                Text("旋转中心点坐标获取").fontSize(14)
                Text("旋转中心点")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFF0000)
                    .rotate(angle: 30.0, centerX: 50.px, centerY: 25.px)
                    .id("rotate_center")
                
                Button("获取旋转中心点").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("rotate_center")
                    this.rotateCenterInfo = "Rotate Center: (${info.rotate.centerX}, ${info.rotate.centerY})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.rotateCenterInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_rotate_center_info")
                
                Text("4.4 transform 变换矩阵").fontSize(16)
                Text("组合变换的矩阵表示").fontSize(14)
                Text("组合变换")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFFFF00)
                    .translate(x: 20.px, y: 20.px)
                    .scale(x: 1.2, y: 1.2)
                    .rotate(angle: 15.0)
                    .id("transform_combo")
                
                Button("获取transform矩阵").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("transform_combo")
                    this.transformInfo = "Transform matrix size: ${info.transform.size}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.transformInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_transform_info")
                
                Text("4.5 组合变换测试").fontSize(16)
                Text("平移 + 缩放组合").fontSize(14)
                Text("平移+缩放")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFFC0CB)
                    .translate(x: 30.px, y: 20.px)
                    .scale(x: 1.3, y: 1.3)
                    .id("combo_translate_scale")
                
                Button("获取平移+缩放").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("combo_translate_scale")
                    this.comboTranslateScaleInfo = "Translate: (${info.translate.x}, ${info.translate.y}), Scale: (${info.scale.x}, ${info.scale.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.comboTranslateScaleInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_combo_translate_scale_info")
                
                Text("平移 + 旋转组合").fontSize(14)
                Text("平移+旋转")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF00FFFF)
                    .translate(x: 40.px, y: 30.px)
                    .rotate(angle: 45.0)
                    .id("combo_translate_rotate")
                
                Button("获取平移+旋转").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("combo_translate_rotate")
                    this.comboTranslateRotateInfo = "Translate: (${info.translate.x}, ${info.translate.y}), Rotate: angle=${info.rotate.angle}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.comboTranslateRotateInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_combo_translate_rotate_info")
                
                Text("平移 + 缩放 + 旋转组合").fontSize(14)
                Text("全组合")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF0000FF)
                    .translate(x: 50.px, y: 40.px)
                    .scale(x: 1.2, y: 1.2)
                    .rotate(angle: 60.0)
                    .id("combo_all")
                
                Button("获取全组合变换").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("combo_all")
                    this.comboAllInfo = "Translate: (${info.translate.x}, ${info.translate.y}), Scale: (${info.scale.x}, ${info.scale.y}), Rotate: angle=${info.rotate.angle}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.comboAllInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_combo_all_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 五、组件类型覆盖测试（容器组件和特殊组件） ==========
                Text("五、组件类型覆盖测试（容器组件）").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("5.2 容器组件").fontSize(16)
                Text("Column 组件信息获取").fontSize(14)
                Column() {
                    Text("Column子组件1").fontSize(14).width(150).height(40).backgroundColor(0xFF0000FF)
                    Text("Column子组件2").fontSize(14).width(150).height(40).backgroundColor(0xFF00FF00)
                }
                .width(200)
                .height(120)
                .backgroundColor(0x33808080)
                .id("container_column")
                
                Button("获取Column组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("container_column")
                    this.columnInfo = "Column Size: ${info.size.width}x${info.size.height}"
                })
                .width(200)
                .height(40)
                .margin(top: 10)
                
                Text(this.columnInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_column_info")
                
                Text("Row 组件信息获取").fontSize(14)
                Row() {
                    Text("Row子组件1").fontSize(14).width(80).height(50).backgroundColor(0xFFFF0000)
                    Text("Row子组件2").fontSize(14).width(80).height(50).backgroundColor(0xFFFFFF00)
                }
                .width(200)
                .height(80)
                .margin(top: 10)
                .id("container_row")
                
                Button("获取Row组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("container_row")
                    this.rowInfo = "Row Size: ${info.size.width}x${info.size.height}"
                })
                .width(200)
                .height(40)
                .margin(top: 10)
                
                Text(this.rowInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_row_info")
                
                Text("Stack 组件信息获取").fontSize(14)
                Stack() {
                    Text("Stack底层").fontSize(16).width(150).height(80).backgroundColor(0xFF0000FF)
                    Text("Stack顶层").fontSize(16).width(100).height(60).backgroundColor(0xB3FF0000)
                }
                .width(200)
                .height(120)
                .margin(top: 10)
                .id("container_stack")
                
                Button("获取Stack组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("container_stack")
                    this.stackInfo = "Stack Size: ${info.size.width}x${info.size.height}"
                })
                .width(200)
                .height(40)
                .margin(top: 10)
                
                Text(this.stackInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_stack_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 六、布局场景测试 ==========
                Text("六、布局场景测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("6.1 固定布局").fontSize(16)
                Text("绝对定位组件坐标获取").fontSize(14)
                Text("固定布局")
                    .fontSize(16)
                    .width(150)
                    .height(60)
                    .backgroundColor(0xFF0000FF)
                    .margin(left: 50, top: 20)
                    .id("layout_fixed")
                
                Button("获取固定布局坐标").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("layout_fixed")
                    this.layoutFixedInfo = "Fixed Layout LocalOffset: (${info.localOffset.x}, ${info.localOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.layoutFixedInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_layout_fixed_info")
                
                Text("6.3 Flex 布局").fontSize(16)
                Text("Flex 容器内组件坐标获取").fontSize(14)
                Flex(direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceAround) {
                    Text("Flex1").fontSize(14).width(80).height(50).backgroundColor(0xFFFF0000).id("flex_item1")
                    Text("Flex2").fontSize(14).width(80).height(50).backgroundColor(0xFFFFFF00).id("flex_item2")
                }
                .width(200)
                .height(80)
                .margin(top: 10)
                .id("layout_flex")
                
                Button("获取Flex布局坐标").onClick({ e =>
                    let flexInfo = ComponentUtils.getRectangleById("layout_flex")
                    let item1Info = ComponentUtils.getRectangleById("flex_item1")
                    let item2Info = ComponentUtils.getRectangleById("flex_item2")
                    this.flexLayoutInfo = "Flex: (${flexInfo.localOffset.x}, ${flexInfo.localOffset.y}), " +
                                         "Item1: (${item1Info.localOffset.x}, ${item1Info.localOffset.y}), " +
                                         "Item2: (${item2Info.localOffset.x}, ${item2Info.localOffset.y})"
                })
                .width(200)
                .height(40)
                .margin(top: 10)
                
                Text(this.flexLayoutInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_flex_layout_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 七、动态变化场景测试 ==========
                Text("七、动态变化场景测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("7.2 尺寸动态变化").fontSize(16)
                Text("状态变化导致的尺寸改变").fontSize(14)
                Text("动态尺寸")
                    .fontSize(16)
                    .width(this.width)
                    .height(this.height)
                    .backgroundColor(0xFFFF0000)
                    .onClick({ e =>
                        this.width = if (this.width == 150.0) { 200.0 } else { 150.0 }
                        this.height = if (this.height == 75.0) { 100.0 } else { 75.0 }
                    })
                    .id("size_dynamic_state")
                
                Button("获取动态尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("size_dynamic_state")
                    this.dynamicSizeInfo = "Dynamic Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.dynamicSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_dynamic_size_info")
                
                Text("7.3 位置动态变化").fontSize(16)
                Text("动画过程中的坐标获取").fontSize(14)
                Text("动态位置")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFFFFFF00)
                    .translate(x: this.translateX, y: this.translateY)
                    .onClick({ e =>
                        this.translateX = if (this.translateX == 0.0) { 50.0 } else { 0.0 }
                        this.translateY = if (this.translateY == 0.0) { 30.0 } else { 0.0 }
                    })
                    .id("position_dynamic")
                
                Button("获取动态位置").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("position_dynamic")
                    this.dynamicPositionInfo = "Translate: (${info.translate.x}, ${info.translate.y}), LocalOffset: (${info.localOffset.x}, ${info.localOffset.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.dynamicPositionInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_dynamic_position_info")
                
                Text("7.4 变换动态变化").fontSize(16)
                Text("缩放动画过程中的信息获取").fontSize(14)
                Text("动态缩放")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF00FFFF)
                    .scale(x: this.scaleX, y: this.scaleY)
                    .onClick({ e =>
                        this.scaleX = if (this.scaleX == 1.0) { 1.5 } else { 1.0 }
                        this.scaleY = if (this.scaleY == 1.0) { 1.5 } else { 1.0 }
                    })
                    .id("transform_dynamic_scale")
                
                Button("获取动态缩放").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("transform_dynamic_scale")
                    this.dynamicScaleInfo = "Dynamic Scale: (${info.scale.x}, ${info.scale.y})"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.dynamicScaleInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_dynamic_scale_info")
                
                Text("旋转动画过程中的信息获取").fontSize(14)
                Text("动态旋转")
                    .fontSize(16)
                    .width(100)
                    .height(50)
                    .backgroundColor(0xFF808080)
                    .rotate(angle: this.angle)
                    .onClick({ e =>
                        this.angle = if (this.angle == 0.0) { 45.0 } else { 0.0 }
                    })
                    .id("transform_dynamic_rotate")
                
                Button("获取动态旋转").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("transform_dynamic_rotate")
                    this.dynamicRotateInfo = "Dynamic Rotate: angle=${info.rotate.angle}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.dynamicRotateInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_dynamic_rotate_info")
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== 八、边界条件测试 ==========
                Text("八、边界条件测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("8.2 特殊尺寸").fontSize(16)
                Text("零尺寸组件（width=0, height=0）").fontSize(14)
                Text("零尺寸")
                    .fontSize(16)
                    .width(0)
                    .height(0)
                    .backgroundColor(0xFF0000FF)
                    .id("boundary_size_zero")
                
                Button("获取零尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("boundary_size_zero")
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
                
                Text("8.4 特殊状态").fontSize(16)
                Text("禁用组件信息获取").fontSize(14)
                Button("禁用按钮")
                    .width(150)
                    .height(50)
                    .enabled(false)
                    .id("boundary_disabled")
                
                Button("获取禁用组件信息").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("boundary_disabled")
                    this.disabledInfo = "Disabled Button Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.disabledInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_disabled_info")
                
                Divider().margin(top: 10, bottom: 10)   
                       
                Text("超大尺寸组件（超出屏幕）").fontSize(14)
                Text("超大尺寸")
                    .fontSize(16)
                    .width(2000)
                    .height(2000)
                    .backgroundColor(0x4DFF0000)
                    .id("boundary_size_large")
                
                Button("获取超大尺寸").onClick({ e =>
                    let info = ComponentUtils.getRectangleById("boundary_size_large")
                    this.largeSizeInfo = "Large Size: ${info.size.width}x${info.size.height}"
                })
                .width(150)
                .height(40)
                .margin(top: 10)
                
                Text(this.largeSizeInfo)
                    .fontSize(14)
                    .width(100.percent)
                    .margin(top: 5)
                    .id("text_large_size_info")
                }
            }
            .width(100.percent)
            .padding(left: 10, right: 10, top: 10, bottom: 10)
        .id("scroller")
    }
}
