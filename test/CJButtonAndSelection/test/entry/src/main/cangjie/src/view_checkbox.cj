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

/**
 * Created on 2024/6/28
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Checkbox {
    @State
    var message: String = ""
    //var checkBoxC: CheckBoxConfiguration = CheckBoxConfiguration(name: "CheckBoxConfiguration", selected: true, triggerChange: {isTrigger => })

    func build() {
        Flex(justifyContent: FlexAlign.SpaceAround) {
            Checkbox()
                .select(true)
                .selectedColor(0xed6f21)
                .shape(CheckBoxShape.RoundedSquare)
                .size(width: 50.vp, height: 50.vp)
                .padding(10.vp)
                .responseRegion(Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent))
//                .mark(size: 10.vp)
                .id("checkboxComponent")

            Checkbox()
                .shape(CheckBoxShape.Circle)
                .selectedColor(@r(app.color.blue_23C452))
                .onChange({
                    value: Bool => message = "isChanged"
                })
                .width(50)
                .height(50)
//                .mark()
//                .responseRegionArray(
//                [Rectangle(x: 0.vp, y: 100.percent, width: 100.percent, height: 100.percent),
//                    Rectangle(x: 100.percent, y: 0.vp, width: 50.percent, height: 100.percent)])
                .padding(top: 10, right: 10, bottom: 10, left: 10)
                .id("checkboxComponent1")

            Checkbox(indicatorBuilder: { => })
            Text(message).width(50.percent).height(20.vp).borderColor(0x055555).id("text")
        }.height(400.vp)
    }
}
