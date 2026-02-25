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
import ohos.arkui.shape.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.__GenerateResource__

/**
 * Shape 模块 maskShape 和 clipShape 接口高级测试
 * 包含：EllipseShape 测试、PathShape 测试、组合使用测试、属性影响测试、不同组件测试
 */
@Entry
@Component
class ViewShapeMaskClipException {
    func build() {
        Scroll() {
            Column() {
                // ========== 九、异常场景测试 ==========
                Text("九、异常场景测试").fontSize(18).fontWeight(FontWeight.Bold)
                
                Text("9.1 maskShape 参数异常").fontSize(16)
                Text("maskShape(None) - 空值处理（编译错误，无法演示）").fontSize(14)
                Text("maskShape(未初始化的 Shape) - 运行时错误（无法演示）").fontSize(14)
                
                Text("9.2 clipShape 参数异常").fontSize(16)
                Text("clipShape(None) - 允许（取消裁剪）").fontSize(14)
                Image(@r(app.media.startIcon))
                    .width(200).height(200)
                    .clipShape(CircleShape(width: 200, height: 200))
                    .clipShape(Option<BaseShape>.None)
                    .id("exception_clip_none")
                
                Text("9.3 Shape 属性异常").fontSize(16)
                Text("无效颜色值处理（无法演示，需运行时验证）").fontSize(14)
                Text("负尺寸处理（无法演示，需运行时验证）").fontSize(14)
                Text("无效路径命令处理（无法演示，需运行时验证）").fontSize(14)
                
                Text("9.4 组件状态异常").fontSize(16)
                Text("已销毁组件调用 maskShape/clipShape - 错误处理（无法演示）").fontSize(14)
                Text("动态修改参数 - 状态同步（需运行时验证）").fontSize(14)
                
                Text("测试完成").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 20, bottom: 20)
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

