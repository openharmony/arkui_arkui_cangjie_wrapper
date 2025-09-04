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
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize
import ohos.arkui.component_snapshot.*
import kit.LocalizationKit.*

@Entry
@Component
class View_Component_Snapshot {
    @Builder
    func RandomBuilder() {
        Flex(direction: FlexDirection.Column) {
            Text('Test menu item 1')
            .fontSize(20)
            .width(200)
            .height(50)
            .textAlign(TextAlign.Center)
            Divider().height(10)
            Text('Test menu item 2')
            .fontSize(20)
            .width(200)
            .height(50)
            .textAlign(TextAlign.Center)
            Image(@r(app.media.app_icon))
            .width(200)
            .height(200)
        }
        .width(200)
        .height(200)
        .id("builder")
    }

    let color = Array<UInt8>(96, repeat:100)
    let opts = InitializationOptions(UniqueImageSize(4, 6))
    @State var pixmap1: PixelMap = createPixelMap(color, opts)
    @State var pixmap2: PixelMap = createPixelMap(color, opts)
    @State var pixmap3: PixelMap = createPixelMap(color, opts)
    @State var errcode1: Int32 = 0
    @State var errcode2: Int32 = 0
    @State var errMes: String = ""
    var inx: Int64 = 0
    var inx2: Int64 = 0
    var inx3: Int64 = 0
    let componentIdList: Array<String> = ["root", "incorrect_id"]

    func build() {
        Column() {
            Row() {
                Image(@r(app.media.app_icon)).autoResize(true).width(100).height(100).margin(5).id("root")
            }

            //TEST GET
            Image(this.pixmap1).width(100).height(100).border(width: 1.vp).margin(5)

            Button("click to generate UI snapshot").id("generate_UI_snapshot")
            .onClick({ e =>
                    this.inx = (this.inx + 1) % 2
            })
            .margin(10)

            Text("${this.errcode1}").id("errcode1")

            //TEST CREATE FROM BUILDER
            Image(this.pixmap2).width(200).height(200).border(width: 1.vp).margin(5)

            Button("click to generate offscreen UI snapshot").id("generate_offscreen_UI_snapshot")
            .onClick({ e =>
                let buildList: Array<() -> Unit> = [{ => this.RandomBuilder(this).build() }, { => }]
                if (this.inx2 == 2) {
                        this.inx2 = 0
                } else {
                        this.inx2++
                }
            })

            Text("${this.errcode2}").id("errcode2")

            //TEST GETSYNC
            Row() {
                Image(this.pixmap3).width(100).height(100).border(width: 1.vp).margin(5)
            }

            Button("click to generate UI snapshot synchronously").id("generate_UI_snapshot_synchronously")
            .onClick({ e =>
                try {
                    this.errMes = "no error"
                } catch (e: BusinessException) {
                    this.pixmap3 = createPixelMap(Array<UInt8>(96, { i => UInt8(i+1) }), opts)
                	this.errMes = "${e.message} code: ${e.code}"
                }
                this.inx3 = (this.inx3 + 1) % 2
            })
            .margin(10)

            Text(this.errMes).id("errMes")
        }
        .width(100.percent)
    }
}