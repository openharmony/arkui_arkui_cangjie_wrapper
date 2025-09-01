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

/*
import ohos.base.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.prompt_action.PromptAction
import kit.LocalizationKit.*
import kit.ArkUI.*

@Entry
@Component
class View_DragTest {
   @State
   var targetImage: String = ""
   @State
   var targetText: String = ""
   @State
   var imageWidth: Float64 = 0.0
   @State
   var imageHeight: Float64 = 0.0
   @State
   var imgState: Visibility = Visibility.Visible
   @State
   var abstractContent: String = "abstract"
   @State
   var textContent: String = ""
   @State
   var backGroundColor: Color = Color.TRANSPARENT

   var clickCount: Int64 = 0

   @State
   var parsedDragBehavior: String = ""

   @State
   var parsedDragResult: String = ""

   var arrPreDragStatus: Array<PreDragStatus> = [
       PreDragStatus.ACTION_DETECTING_STATUS,
       PreDragStatus.READY_TO_TRIGGER_DRAG_ACTION,
       PreDragStatus.PREVIEW_LIFT_STARTED,
       PreDragStatus.PREVIEW_LIFT_FINISHED,
       PreDragStatus.PREVIEW_LANDING_STARTED,
       PreDragStatus.PREVIEW_LANDING_FINISHED,
       PreDragStatus.ACTION_CANCELED_BEFORE_DRAG
   ]
   @State
   var parsedPreDragResult: String = ""

   var rectResult: RectResult = RectResult(1.0, 1.0, 1.0, 1.0)
   var touchTestInfo: TouchTestInfo = TouchTestInfo(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, rectResult, "id")
   var touchResult1: TouchResult = TouchResult(TouchTestStrategy.DEFAULT)
   var touchResult2: TouchResult = TouchResult(TouchTestStrategy.FORWARD_COMPETITION)
   var touchResult3: TouchResult = TouchResult(TouchTestStrategy.FORWARD)
//    var externalString: ExternalString = ExternalString("ExternalString")
//    var cTouchResult: CTouchResult = CTouchResult(2, externalString)
//    var touchResult4: TouchResult = TouchResult(cTouchResult)

   @Builder
   func pixelMapBuilder() {
       Column() {
           Image(@r(app.media.startIcon))
               .width(120)
               .height(120)
               .backgroundColor(Color.Yellow)
       }
   }
   func PreDragChange(status: PreDragStatus): Unit {
       match (status) {
           case PreDragStatus.READY_TO_TRIGGER_DRAG_ACTION => backGroundColor = Color.Red
           case PreDragStatus.ACTION_CANCELED_BEFORE_DRAG => backGroundColor = Color.Blue
           case PreDragStatus.PREVIEW_LANDING_FINISHED => backGroundColor = Color.Blue
           case _ => ()
       }
   }
   func parseDragBehavior(v: DragBehavior): String {
       match (v) {
           case DragBehavior.MOVE => "MOVE"
           case DragBehavior.COPY => "COPY"
           case _ => "UNKNOWN"
       }
   }
   func parseDragResult(v: DragResult): String {
       match (v) {
           case DragResult.DRAG_DEFAULT => "DRAG_DEFAULT"
           case DragResult.DRAG_FAILED => "DRAG_FAILED"
           case DragResult.DRAG_CANCELED => "DRAG_CANCELED"
           case DragResult.DROP_ENABLED => "DROP_ENABLED"
           case DragResult.DROP_DISABLED => "DROP_DISABLED"
           case _ => "UNKNOWN"
       }
   }
   func parsePreDragStatus(v: PreDragStatus): String {
       match (v) {
           case PreDragStatus.ACTION_DETECTING_STATUS => "ACTION_DETECTING_STATUS"
           case PreDragStatus.READY_TO_TRIGGER_DRAG_ACTION => "READY_TO_TRIGGER_DRAG_ACTION"
           case PreDragStatus.PREVIEW_LIFT_STARTED => "PREVIEW_LIFT_STARTED"
           case PreDragStatus.PREVIEW_LIFT_FINISHED => "PREVIEW_LIFT_FINISHED"
           case PreDragStatus.PREVIEW_LANDING_STARTED => "PREVIEW_LANDING_STARTED"
           case PreDragStatus.PREVIEW_LANDING_FINISHED => "PREVIEW_LANDING_FINISHED"
           case PreDragStatus.ACTION_CANCELED_BEFORE_DRAG => "ACTION_CANCELED_BEFORE_DRAG"
           case _ => "UNKNOWN"
       }
   }
   func build() {
       Row() {
           Column() {
               if (true) {
                   Column() {}
               } else {
               }
               List() {
                   ListItem() {
                       Text("ListItem1")
                           .fontSize(18)
                           .width(100.percent)
                           .height(40)
                           .margin(10)
                   }
                       .id("listItem1")
                       .onDragStart(
                           {
                               event: DragEvent, extra: ?String =>
                               if (let Some(v) <- extra) {
                                   PromptAction.showToast(message: v)
                               }
                               return DragItemInfo(builder: bind(pixelMapBuilder, this), extraInfo: "ListItem1")
                           }
                       )
                       .onPreDrag() {
                           status: PreDragStatus => PreDragChange(status)
                       }
                   ListItem() {
                       Text("ListItem2")
                           .fontSize(18)
                           .width(100.percent)
                           .height(40)
                           .margin(10)
                   }
                       .onDragStart(
                           {
                               event: DragEvent, extra: ?String => if (let Some(v) <- extra) {
                                   PromptAction.showToast(message: v)
                                   Hilog.info(1,"1","Cangjie-App", "### extra ${v}")
                                   return bind(pixelMapBuilder, this)
                               } else {
                                   return {=>}
                               }
                           })
                       .id("listItem2")
               }.onDrop(
                   {
                       event: DragEvent, extra: ?String => if (let Some(v) <- extra) {
                           PromptAction.showToast(message: v)
                           Hilog.info(1,"1","Cangjie-App", "### extra ${v}")
                       }
                   })
               Text("Start Drag")
                   .fontSize(18)
                   .width(100.percent)
                   .height(40)
                   .margin(10)
                   .backgroundColor(0x008888)
               Image(@r(app.media.startIcon))
                   .id("drag_img")
                   .width(100)
                   .height(100)
                   .margin(left: 15)
                   .visibility(imgState)
                   .onDragStart(
                       {
                           event: DragEvent, extra: ?String =>
                           match (extra) {
                               case Some(v) => Hilog.info(1,"1","Cangjie-App", "### extra ${v}")
                               case _ => ()
                           }
                           Hilog.info(1,"1","Cangjie-App", "### onDragStart getWindowX() ${event.getWindowX()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragStart getWindowY() ${event.getWindowY()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragStart getDisplayX() ${event.getDisplayX()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragStart getDisplayY() ${event.getDisplayY()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragStart getModifierKeyState ${event.getModifierKeyState(["aaa"])}")
                       }
                   )
                   .onDrop({
                       event: DragEvent, extra: ?String => Hilog.info(1,"1","Cangjie-App", "### onDrop Image onDrop")
                   })
                   .onDragMove(
                       {
                           event: DragEvent, extra: ?String =>
                           Hilog.info(1,"1","Cangjie-App", "### onDragMove getVelocityX() ${event.getVelocityX()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragMove getVelocityY() ${event.getVelocityY()}")
                           Hilog.info(1,"1","Cangjie-App", "### onDragMove getVelocity() ${event.getVelocity()}")
                           Hilog.info(1,"1","Cangjie-App",
                               "### onDragMove getPreviewRect x ${event .getPreviewRect() .x .value} width ${event .getPreviewRect() .width .value}"
                           )
                       }
                   )
                   .onDragEnd(
                       {
                           event: DragEvent, extra: ?String => match (event.getResult()) {
                               case DragResult.DRAG_SUCCESSFUL => PromptAction.showToast(message: "Drag Success")
                               case _ => PromptAction.showToast(message: "Drag Failed")
                           }
                       })
               Text("test drag event")
                   .width(100.percent)
                   .height(100)
                   .margin(left: 15)
                   .copyOption(CopyOptions.InApp)
               TextArea(placeholder: "please input words")
                   .copyOption(CopyOptions.InApp)
                   .width(100.percent)
                   .height(50)
               Search(placeholder: "please input words")
                   .searchButton("Search")
                   .width(100.percent)
                   .height(80)
                   .textFont(size: 20)

               Column() {
                   Text("This is abstract")
                       .fontSize(20)
                       .width(100.percent)
               }
                   .margin(left: 40, top: 20)
                   .width(100.percent)
                   .height(100)
                   .backgroundColor(this.backGroundColor)

               Column {
                   Button("Change DragBehavior")
                       .id("changeDragBehavior")
                       .onClick { e =>
                               clickCount++

                       }
                   Text(parsedDragBehavior).id("parsedDragBehavior")
               }

               Column {
                   Button("Change DragResult")
                       .id("changeDragResult")
                       .onClick { e =>

                               clickCount++
                       }
                   Text(parsedDragResult).id("parsedDragResult")
               }

               Column {
                   Button("Change PreDragStatus")
                       .id("changePreDragStatus")
                       .onClick { e =>
                           var PDS = arrPreDragStatus[clickCount]
                           parsedPreDragResult = parsePreDragStatus(PDS)
                           if(clickCount == arrPreDragStatus.size-1){
                               clickCount = 0
                           } else {
                               clickCount++
                           }
                       }
                   Text(parsedPreDragResult).id("parsedPreDragResult")
               }

           }
               .width(45.percent)
               .height(100.percent)
               .onDragLeave({
                   event: DragEvent, extra: ?String => Hilog.info(1,"1","Cangjie-App", "### onDragLeave")
               })
               .onDrop({
                   dragEvent: DragEvent, extra: ?String => ()
               })

           Column() {
               Text("Drag Target Area")
                   .fontSize(20)
                   .width(100.percent)
                   .height(100.percent)
                   .margin(10)
                   .backgroundColor(0x008888)
                   .onDrop(
                       {
                           dragEvent: DragEvent, extra: ?String =>
                           Hilog.info(1,"1","Cangjie-App", "### onDrop")
                           dragEvent.setResult(DragResult.DRAG_DEFAULT)
                           dragEvent.setResult(DragResult.DRAG_FAILED)
                           dragEvent.setResult(DragResult.DRAG_CANCELED)
                           dragEvent.setResult(DragResult.DROP_ENABLED)
                           dragEvent.setResult(DragResult.DROP_DISABLED)
                           dragEvent.setResult(DragResult.DRAG_SUCCESSFUL)
                           PromptAction.showToast(
                               message: "${dragEvent.useCustomDropAnimation}, ${parseDragBehavior(dragEvent.dragBehavior)}"
                           )
                       }
                   )
                   .onDragEnter({
                       event: DragEvent, extra: ?String => Hilog.info(1,"1","Cangjie-App", "### onDragEnter")
                   })
                   .onDragLeave({
                       event: DragEvent, extra: ?String => Hilog.info(1,"1","Cangjie-App", "### onDragLeave")
                   })
           }
       }
   }
}
*/