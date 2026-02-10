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

/**
 * TC_095: @State Variable Used in Image Component
 * Test Scenario: Use @State variable to control Image's src and other properties
 * Expected Result: Image correctly displays, automatically updates when state changes
 */

@Entry
@Component
class ViewComponentTC095 {
    @State var imageSrc: String = "common/icon.png"
    @State var imageWidth: Float64 = 100.0
    @State var imageHeight: Float64 = 100.0
    @State var imageOpacity: Float64 = 1.0

    func build(): Unit {
        Column() {
            Text("TC_095: @State Variable Used in Image Component")
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin(top: 10, bottom: 10)
                .id("test_title")

            Text("Image Source: ${this.imageSrc}")
                .fontSize(14)
                .id("image_src_display")

            Text("Size: ${this.imageWidth} x ${this.imageHeight}")
                .fontSize(14)
                .id("image_size_display")

            Text("Opacity: ${this.imageOpacity}")
                .fontSize(14)
                .id("image_opacity_display")

            Image(this.imageSrc)
                .width(this.imageWidth)
                .height(this.imageHeight)
                .opacity(this.imageOpacity)
                .id("state_image")

            Button("Change Image Size")
                .id("change_size_button")
                .onClick({ e => 
                    this.imageWidth = 150.0
                    this.imageHeight = 150.0
                })

            Button("Change Opacity")
                .id("change_opacity_button")
                .onClick({ e => 
                    if (this.imageOpacity > 0.5) {
                        this.imageOpacity = 0.5
                    } else {
                        this.imageOpacity = 1.0
                    }
                })

            Button("Reset")
                .id("reset_button")
                .onClick({ e => 
                    this.imageWidth = 100.0
                    this.imageHeight = 100.0
                    this.imageOpacity = 1.0
                })
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
        .backgroundColor(0xF1F3F5)
    }
}

