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
import std.collection.{ArrayList, HashMap}
import std.time.*
import std.sync.*
// import ohos.concurrency.*
import std.math.*

extend RefreshStatus {
    public func toString() {
        match (this) {
            case Inactive => "Inactive"
            case Drag => "Drag"
            case OverDrag => "OverDrag"
            case Refresh => "Refresh"
            case Done => "Done"
            case _ => "Done"
        }
    }
}

@Entry
@Component
class View_Refresh {
    @State
    var isRefreshing: Bool = false
    @State
    var status: String = "Inactive"
    @State
    var onRefreshStatus: String = "noRefresh"
    @State
    var onOffsetStatus: String = "noChange"
    @State
    var ratio: Float64 = 0.5
    @State
    var maxRefreshingHeight: Float64 = 100.0

    func build() {
        Column() {
            Text(status)
                .size(width: 50.percent, height: 25.vp)
                .borderWidth(1)
                .borderColor(Color.Black)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .textAlign(TextAlign.Center)
                .fontSize(15)
                .margin(top: 20.vp)
                .id("StatusText")
            Text(onRefreshStatus)
                .size(width: 50.percent, height: 25.vp)
                .borderWidth(1)
                .borderColor(Color.Black)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .textAlign(TextAlign.Center)
                .fontSize(15)
                .margin(top: 20.vp)
                .id("OnRefreshText")
            Text(onOffsetStatus)
                .size(width: 50.percent, height: 25.vp)
                .borderWidth(1)
                .borderColor(Color.Black)
                .backgroundColor(0xFFFFFF)
                .borderRadius(15)
                .textAlign(TextAlign.Center)
                .fontSize(15)
                .margin(top: 20.vp)
                .id("OnOffsetText")

            Refresh(RefreshOptions(refreshing: @Binder(isRefreshing))) {
                Column {
                //                    LazyForEach(
                //                        myDataSource,
                //                        itemGeneratorFunc: {
                //                            element: Int64, index: Int64 => Text(element.toString())
                //                                .size(width: 50.percent, height: 50.vp)
                //                                .borderWidth(1)
                //                                .borderColor(Color.Black)
                //                                .backgroundColor(0xFFFFFF)
                //                                .borderRadius(15)
                //                                .textAlign(TextAlign.Center)
                //                                .fontSize(30)
                //                                .margin(top: 20.vp)
                //                        }
                //                    )
                }.width(100.percent).backgroundColor(0x89CFF0)
            }
                .width(100.percent)
                .height(100.percent)
                .id("refresh")
                .onRefreshing(
                    {
                        =>
                        onRefreshStatus = "Refresh"

                        Timer.once(2000 * Duration.millisecond) {
                            => launch {
                                this.isRefreshing = false
                                onRefreshStatus = "noRefresh"
                                onOffsetStatus = "noChange"
                            }
                        }
                    }
                )
                .onStateChange({
                    refreshStatus: RefreshStatus => status = refreshStatus.toString()
                })
                .backgroundColor(0x89CFF0)

            Refresh(RefreshOptions(refreshing: @Binder(isRefreshing))) {}
                .width(100.percent)
                .height(100.percent)
                .id("refresh_default_attr")

            Refresh(RefreshOptions(refreshing: @Binder(isRefreshing))) {}
                .width(100.percent)
                .height(100.percent)
                .id("refresh_set_attr")
        }
    }
}
