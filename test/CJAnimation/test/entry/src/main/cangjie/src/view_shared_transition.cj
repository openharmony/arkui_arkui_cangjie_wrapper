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

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource.*

@Entry
@Component
class ViewSharedTransition {
    @State var text: String = "HomePage"

    func build() {
        Column() {
            Text("HomePage").id("homePageText")
            Image(@r(app.media.startIcon))
                .width(150.vp)
                .height(150.vp)
                .sharedTransition("sharedImage",
                    options: SharedTransitionOptions(duration: 800, curve: Curve.Rhythm, delay: 8000))
                .id("homePageImage")

                Button("pushValidPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionValid")})
                    .margin(top: 120)
                    .id("homePagePushValidButton")
                Button("pushInvalidPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionInvalid")})
                    .margin(top: 20)
                    .id("homePagePushInvalidButton")
                Button("pushIdNotEqPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionIdNotEq")})
                    .margin(top: 20)
                    .id("homePagePushIdNotEqButton")
                Button("pushBoundaryPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionBoundary")})
                    .margin(top: 20)
                    .id("homePagePushBoundaryButton")
                Button("pushNoCallPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionNoCall")})
                    .margin(top: 20)
                    .id("homePagePushNoCallButton")
                Button("pushNoSetPage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionNoSet")})
                    .margin(top: 20)
                    .id("homePagePushNoSetButton")
                Button("pushOptionNonePage")
                    .onClick({ e => getUIContext().getRouter().pushUrl(url: "ViewSharedTransitionOptionNone")})
                    .margin(top: 20)
                    .id("homePagePushOptionNoneButton")

                Button("back")
                    .onClick({ e => getUIContext().getRouter().back()})
                    .margin(top: 20)
                    .id("homePageBackButton")
        }
        .width(100.percent)
        .height(100.percent)
        .alignItems(HorizontalAlign.Start)
    }
}
