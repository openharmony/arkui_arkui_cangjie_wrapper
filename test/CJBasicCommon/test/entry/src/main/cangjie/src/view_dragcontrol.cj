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

import ohos.i18n.*
import ohos.resource_manager.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize

@Entry
@Component
class ViewDragControl {
    @Builder
    func dragPreviewBuilder() {
        Text("dragPreview")
        .width(150)
        .height(50)
        .fontSize(20)
        .borderRadius(10)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .backgroundColor(Color.Red)
    }

    @Builder
    func menuBuilder() {
        Flex(direction: FlexDirection.Column) {
            Text('Test menu item 1').fontSize(20).width(200).height(50).textAlign(TextAlign.Center)
            Divider().height(10)
            Text('Test menu item 2').fontSize(20).width(200).height(50).textAlign(TextAlign.Center)
        }
        .width(200)
        .height(200)
    }

    let color = Array<UInt8>(80000, repeat:100)
    let opts = InitializationOptions( UniqueImageSize(200, 200))

    func build() {
        Column {
            Image(@r(app.media.startIcon)).width(200).height(200).id("image1")
            .dragPreview("")
            .bindContextMenu(builder: this.menuBuilder, responseType: ResponseType.RightClick)

            Button("test drag control 1.").width(200).height(200).id("button1")
            .dragPreview("")
            .bindContextMenu(builder: this.menuBuilder, responseType: ResponseType.RightClick)

            Button("test drag control 2.").width(200).height(200).id("button2")
            .dragPreview("button1")

            // defalt
            Image(@r(app.media.startIcon)).width(200).height(200).id("image2")
        }
        .width(100.percent)
    }
}
