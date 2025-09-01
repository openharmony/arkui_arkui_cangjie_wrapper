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

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.component.Margin
internal import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.{AppResource}
import std.database.sql.Transaction

@Entry
@Component
class View_MenuBindContextMenu {
    @Builder
    func myBuilder() {
        Row() {
            Image(@r(app.media.startIcon)).size(width: 30.vp, height: 30.vp)
            Text("Builder 内容").width(300.px).onClick({
                evt => logger("Builder test: builder clicked!!!")
            })
        }.width(150)
    }

    @Builder
    func MyPreview() {
        Column() {
            Image(@r(app.media.background)).width(120).height(120)
        }
    }

    func build() {
        Scroll() {
            Column(space: 10) {
                Text("enableArrow, placement, arrowOffset")
                Button("BindContextMenu-1").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    // 测试 ContextMenuOptions 结构；
                    options: ContextMenuOptions(
                        enableArrow: true,
                        placement: Placement.Bottom,
                        arrowOffset: 20.vp,
                        borderRadius: BorderRadiuses(),
                        layoutRegionMargin: Margin()
                    )
                )

                Text(
                    "offset, backgroundColor, backgroundBlurStyle, aboutToAppear -> onAppear -> aboutToDisappear -> onDisappear")
                Button("BindContextMenu-2").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        offset: Position(x: 80.0, y: 80.0),
                        backgroundColor: Color.Green,
                        //                        backgroundBlurStyle: BlurStyle.Thin,
                        backgroundBlurStyle: BlurStyle.BackgroundUltraThick,
                        onAppear: {=> logger("ContextMenuOptions test: onAppear")},
                        onDisappear: {=> logger("ContextMenuOptions test: onDisappear")},
                        aboutToAppear: {=> logger("ContextMenuOptions test: aboutToAppear")},
                        aboutToDisappear: {=> logger("ContextMenuOptions test: aboutToDisappear")}
                    )
                )

                Text("preview, transition")
                Text("BindContextMenu-3")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.Gray)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(
                            preview: bind(this.MyPreview, this),
                            transition: TransitionEffect.SLIDE_SWITCH
                        )
                    )

                Text("preview, previewAnimationOptions[scale, transition]")
                Text("BindContextMenu-4")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.Gray)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(preview: bind(this.MyPreview, this),
                            //                            previewAnimationOptions: ContextMenuAnimationOptions(
                            //                                scale: (0.2, 0.7),
                            //                                transition: TransitionEffect
                            //                                    .OPACITY
                            //                                    .animation(AnimateParam(duration: 4000, curve: Curve.Ease))
                            //                            )
                        )
                    )

                Text("previewAnimationOptions: [hoverScale]")
                Text("BindContextMenu-5")
                    .width(200)
                    .height(80)
                    .backgroundColor(Color.Gray)
                    .textAlign(TextAlign.Center)
                    .margin(20)
                    .bindContextMenu(
                        builder: myBuilder,
                        responseType: ResponseType.LongPress,
                        options: ContextMenuOptions(preview: bind(this.MyPreview, this)
                            //                            previewAnimationOptions: ContextMenuAnimationOptions(hoverScale: (1.0, 0.5))
                        )
                    )

                Text("previewAnimationOptions: [scale] + [hoverScale]")
                Button("BindContextMenu-6").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(preview: bind(this.MyPreview, this)
                        //                        previewAnimationOptions: ContextMenuAnimationOptions(scale: (0.2, 0.7),hoverScale: (1.0, 0.5))
                    )
                )

                Text("transition + previewAnimationOptions: [hoverScale]")
                Button("BindContextMenu-7").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        preview: bind(this.MyPreview, this),
                        transition: TransitionEffect.SLIDE_SWITCH
                        //                        previewAnimationOptions: ContextMenuAnimationOptions(hoverScale: (1.0, 0.5))
                    )
                )

                Text("enableArrow + preview")
                Button("BindContextMenu-8").bindContextMenu(
                    builder: myBuilder,
                    responseType: ResponseType.LongPress,
                    options: ContextMenuOptions(
                        enableArrow: true,
                        preview: bind(this.MyPreview, this)
                    )
                )
            }
        }
    }
}
