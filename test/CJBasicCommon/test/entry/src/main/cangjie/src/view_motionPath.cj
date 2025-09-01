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

import ohos.base.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*

@Entry
@Component
class View_MotionPath {
    @State
    var toggle: Bool = true

    func build() {
        Column {
            Button('click me')
                .id("motionPathButton_id")
                .margin(50.vp)
                // rotatable 跟路径的方向保持一致
                // from 路径长度的初始百占比位置
                // to 路径长度的结束占比比例
                // path Mstart Lend固定写法，点位是由布局决定，中间添加路径节点。起点和终点点位是由alignItems的布局决定的，可以设置水平和竖直
                .onClick {
                    e => animateTo(
                        AnimateParam(duration: 4000, curve: Curve.Linear),
                        {=> this.toggle = !this.toggle} // 通过this.toggle变化组件的位置
                    )
                }
        }.width(100.percent).height(100.percent).alignItems(getAlign()).id("motionPath_id")
    }
    func getAlign() {
        if (this.toggle) {
            HorizontalAlign.Start //水平布局，垂直布局用FlexAlign.Start
        } else {
            HorizontalAlign.End
        }
    }
}
