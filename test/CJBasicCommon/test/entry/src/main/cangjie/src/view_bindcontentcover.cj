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
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.common.*
import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import std.math.MathExtension
import ohos.ark_interop.*
import ohos.ui_test.*
import std.collection.ArrayList

@Entry
@Component
class ViewBindContentCover {
    var ModalTransition1: ModalTransition = ModalTransition.Alpha
    var ModalTransition2: ModalTransition = ModalTransition.Default
    var ModalTransition3: ModalTransition = ModalTransition.None

    @State var isShow: Bool = false
    @State var message: String = '123'

    public func onAppear() {
        Hilog.info(1, "Cangjie-Test", "BindContentCover onAppear.")
        this.message = "BindContentCover onAppear."
    }
    public func onDisappear() {
        Hilog.info(1, "Cangjie-Test", "BindContentCover onDisappear.")
        this.message = "BindContentCover onDisappear."
    }

    @Builder
    public func myBuilder() {
        Column() {
            Button("close modal 1")
            .margin(10)
            .fontSize(20)
            .onClick({ e
              => this.isShow = false;
            })
            .id("button2")

            Text(this.message)
            .id("text1")
        }
        .width(100.percent)
        .height(100.percent)
        .justifyContent(FlexAlign.Center)
    }
    func build() {
        Column {
            Button("transition modal 1")
            .onClick({ e
              => this.isShow = true
            })
            .fontSize(20)
            .margin(10)
            .bindContentCover(this.isShow, myBuilder, options: ContentCoverOptions(
                 modalTransition: ModalTransition.None,
                 backgroundColor: Color.Green,
                 onAppear: Option.None,
                 onDisappear: Option.None,
                 onWillAppear: Option.None,
                 onWillDisappear: Option.None)
            )
            .bindContentCover(this.isShow, myBuilder, options: ContentCoverOptions(
                 modalTransition: ModalTransition.Default,
                        transition: TransitionEffect.SLIDE_SWITCH,
                 onAppear: onAppear,
                 onDisappear: onDisappear,
                 onWillAppear: { => },
                 onWillDisappear: { => },
                 onWillDismiss: { dismiss => })
            )
            .bindContentCover(this.isShow, myBuilder, options: ContentCoverOptions(
                 modalTransition: ModalTransition.Alpha,
                 backgroundColor: Color.Green,
                 onAppear: onAppear,
                 onDisappear: onDisappear)
            )
            .id("bindContentCover")

            Text(this.message)
            .id("text2")
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .width(100.percent)
        .height(100.percent)
    }
}