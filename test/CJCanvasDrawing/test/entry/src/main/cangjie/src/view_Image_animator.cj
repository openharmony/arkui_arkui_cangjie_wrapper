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
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewImageAnimator {
    @State
    var value: Int32 = 1

    //    @State
    //    var state: AnimationStatus = AnimationStatus.Initial
    @State
    var reverse: Bool = false
    @State
    var iterations: Int32 = 1

    func build() {
        Column() {
            //            ImageAnimator().images(
            //                [
            //                    ImageFrameInfo(src: @r(app.media.background), duration: 1000, width: 0.vp, height: 0.vp, top: 0.vp,
            //                        left: 0.vp),
            //                    ImageFrameInfo(src: @r(app.media.foreground), duration: 1000, width: 0.vp, height: 0.vp, top: 0.vp,
            //                        left: 0.vp),
            //                    ImageFrameInfo(src: @r(app.media.startIcon), duration: 1000, width: 0.vp, height: 0.vp, top: 0.vp,
            //                        left: 0.vp)
            //                ]
            //            ).duration(2000).state(this.state).reverse(this.reverse).fixedSize(false).preDecode(1).fillMode(
            //                FillMode.None).iterations(this.iterations).width(340).height(240).margin(top: 100).onStart(
            //                {
            //                => Hilog.info(1,"1","1","Start")
            //            }).onPause({
            //                => Hilog.info(1,"1","1","Pause")
            //            }).onRepeat({
            //                => Hilog.info(1,"1","1","")
            //            }).onCancel({
            //                => Hilog.info(1,"1","1","Cancel")
            //            }).onFinish(
            //                {
            //                    =>
            //                    Hilog.info(1,"1","1","Finish")
            //                    this.state = AnimationStatus.Stopped
            //                }
            //            )
            Row() {
                Button("start").width(100).padding(5).fontSize(16.0).borderRadius(topLeft: 3.vp, topRight: 3.vp,
                    bottomLeft: 3.vp, bottomRight: 3.vp).onClick({
                    _ =>
                    //                    this.state = AnimationStatus.Running
                    Hilog.info(1,"1","1","Finish")
                }).margin(5).id("start")
                Button("pause").width(100).fontColor(@r(app.color.blue_23C452)).padding(5).fontFamily(
                    @r(app.string.DEFAULT_FONT)).border(width: 1.vp, color: Color.Blue, radius: 3.vp,
                    style: BorderStyle.Dashed).onClick({
                    _ =>
                    //                    this.state = AnimationStatus.Paused // 显示当前帧图片
                    Hilog.info(1,"1","1","Finish")
                }).margin(5).id("pause")
                Button("stop").width(100).padding(5).fontFamily("HarmonyOS Sans").fontSize(@r(app.string.control_Width)).
                    fontStyle(FontStyle.Normal).onClick({
                    _ =>
                    //                    this.state = AnimationStatus.Stopped // 显示动画的起始帧图片
                    Hilog.info(1,"1","1","Finish")
                }).margin(5).id("stop")
            }

            Row() {
                Button("reverse").width(100).padding(5).onClick({
                    _ => this.reverse = !this.reverse
                }).margin(5).id("reverse")
                Button("once").width(100).padding(5).onClick({
                    _ => this.iterations = 1
                }).margin(5).id("once")
                Button("infinite").width(100).padding(5).onClick({
                    _ => this.iterations = -1 // 无限循环播放
                }).margin(5).id("infinite")

                Button("aaaa").size(width: (-1.0).vp,
                    height: (-1.0).vp).width((-1.0).vp).height(
                    (-1.0).vp)
            }
        }.width(100.percent).height(100.percent)
    }
}
