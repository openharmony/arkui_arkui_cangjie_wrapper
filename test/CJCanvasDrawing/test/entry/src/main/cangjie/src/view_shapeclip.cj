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
import ohos.arkui.shape.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewShapeClip {
    var array1: Array<(Length, Length)> = [(5,6),(5,6),(8,9),(8,9)]
    var array2: Array<(Length , Length)> = [(5.0,6.0),(5.0,6.0),(8.0,9.0),(8.0,9.0)]
    func build() {
        Column() {
            Text("ShapeRect and Rect view.")
            Rect(width: 100, height: 50).fill(Color.Red).radius(array1)
            Rect(width: 100.0, height: 50.0).fill(Color.Gray).radius(array2)
            Text("clip").fontSize(12)
            Row() {
                Image(@r(app.media.startIcon)).width(500).height(280)
            }.clip(true).borderRadius(20).id("test_row_1")
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).width(500).height(280).clipShape(CircleShape(width: 280, height: 280)).id(
                "image1")
            Text("secend end").fontSize(12)
            Text("mask").fontSize(12)
            Image(@r(app.media.startIcon)).maskShape(RectShape(width: 500, height: 140).fill(0xff0000)).width(500).height(
                140).id("image2")
            Image(@r(app.media.startIcon)).maskShape(RectShape(width: 200.0, height: 100.0).radiusWidth(8.0).radiusHeight(8.0).radius(3.0).fill(0xff0000))
            .width(500).height(140)
            Image(@r(app.media.startIcon)).maskShape(RectShape(width: 200, height: 100).radiusWidth(8).radiusHeight(8).radius(3).fill(0xff0000))
            .width(500).height(140)
            Text("first end").fontSize(12)
            Image(@r(app.media.startIcon)).maskShape(CircleShape(width: 140.0, height: 140.0).fill(0xff0000)).width(500).height(
                140).id("image3")
            Text("secend end").fontSize(12).clipShape(CircleShape())
        }
    }
}
