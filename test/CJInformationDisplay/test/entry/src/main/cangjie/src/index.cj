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

internal import ohos.arkui.component.*
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.resource.__GenerateResource__
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

@Entry
@Component
class MyView {
    func build() {
        Scroll() {
            Column {
                ForEach(
                    UT_views,
                    itemGeneratorFunc: {
                        viewName: String, _: Int64 => Button(viewName).fontSize(16).width(100.percent).height(50).id(
                            viewName).borderRadius(10).onClick ({
                            evt => getUIContext().getRouter().pushUrl(url: viewName)
                        })
                    }
                )
            }.width(100.percent).margin(top: 5)
        }.id("scroller")
    }
}
