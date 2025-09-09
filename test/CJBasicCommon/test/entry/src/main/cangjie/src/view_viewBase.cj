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
 * Created on 2024/6/27
 */
package ohos_app_cangjie_entry

import ohos.base.*
import ohos.font.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class ViewViewBase {
    @State
    var message: String = "Hello Cangjie"

    protected override func updateWithJson(json: String): Unit {
        Hilog.error(1,"Cangjie-Test","updateWithJson ${json}")
    }

    func build() {
        Row {
            Column {
                Text("width_resource")
                        .bindPopup(true, CustomPopupOptions(showInSubWindow: false, builder: { => }, onStateChange: {event => }, onWillDismiss: {action => }))
                    .id("width_resource")

                Text(this.message)
                    .constraintSize()
                    .aspectRatio(0.5)
                    .flexGrow(0.5)
                    .transition(TransitionEffect.OPACITY, {isT =>})
                    .flexShrink(0.5)
                    .borderRadius(topLeft: 1.vp)

                Button("button4")
                    .keyboardShortcut("keyboardShortcut", [ModifierKey.Alt])
                    .borderWidth(EdgeWidths())
                    .backgroundImagePosition(Alignment.TopEnd)
                    .backgroundImagePosition(Alignment.Start)
                    .backgroundImagePosition(Alignment.Center)
                    .onClick({ e => LegalCallCheck.check(this)}).id("button4")

                __Recycle__()

                __Recycle__(){}
            }.width(100.percent)
        }.height(100.percent)
    }
}
