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
 * Created on 24/03/2025
 */
package ohos_app_cangjie_entry
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.shape.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.hiviewdfx.hi_app_event.Event
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.createImageSource
import ohos.multimedia.image.DecodingOptions
import ohos.multimedia.image.Size
import std.collection.{ ArrayList, HashMap }

@Entry
@Component
class ViewShape{
    //var ellipsesh = EllipseShape(width: 2.0, height: 2.0)
    //var ellipsetest = EllipseShape(width: 2.0.vp,height:2.0.vp)
    var color: Array<UInt8> = Array<UInt8>(96, {i => UInt8(i + 1)})
    let opts: InitializationOptions = InitializationOptions(Size(4, 6), editable: true, pixelFormat: Rgba8888)
    var pix: PixelMap = createPixelMap(color, opts)
    func build(){
        Column(){
             Shape() {
                Rect().width(300).height(50)
                Ellipse().width(300).height(50).offset(x:0,y:30)
                Path().width(300).height(10).commands('M0 0 L900 0').offset(x:0,y:120)
              }.viewPort(x:-2,y:-2,width:304,height:130)
                .strokeDashArray([20])
                .strokeDashOffset(10)
              .strokeLineCap(LineCapStyle.Round)
              .strokeLineJoin(LineJoinStyle.Round)
              .antiAlias(true)
            .id('ShapeTest')
            Shape() {
                Rect()
                    .width(300)
                    .height(50)
                    .radiusWidth(3)
                    .radiusHeight(5)
                    .radius(3)
            }
                .width(350)
                .height(80)
                .viewPort()
                .fill(0x317AF7)
                .stroke(Color.Black)
                .strokeWidth(10)
            .id('RectTest')
            Shape() {
                    Rect().width(30).height(50)
                    .radiusWidth(3)
                    .radiusHeight(5)
                    .radius([3, 3, 5])
                  }
                  .width(30)
                  .height(80)
                  .viewPort()
                  .fill(0x317AF7)
                  .fillOpacity(0.5)
                    .offset(x:0,y:60)
                  .stroke(Color.Black)
                  .strokeWidth(10)
            .id('OffsetTest')
            Shape() {
                    Rect().width(30).height(50)
                  }
                  .width(30)
                  .height(80)
                  .viewPort()
                  .fill(0x317AF7)
                    .offset(x:10.0.vp,y:60.0.vp)
                  .stroke(Color.Black)
                  .strokeWidth(10)
                  .strokeOpacity(2.0)
            .id('OffsetLengthTest')
            Shape() {
                    Rect().width(30).height(50)
                  }
                  .width(30)
                  .height(80)
                  .viewPort()
                  .fill(0x317AF7)
                    .offset(x:10.0.vp,y:60.0.vp)
                  .stroke(Color.Black)
                  .strokeWidth(10)
            .id('OffsetLengthTest')
            Shape() {
                    Ellipse()
                  }
                  .size(width:350,height:100)
                  .viewPort()
                  .fill(0x317AF7)
                    .offset(x:0,y:60)
                  .stroke(Color.Black)
                  .strokeWidth(10)
                    .strokeOpacity(0.5)
            .id('SizeTest')
            Shape() {
                Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
              }
              .width(300)
              .height(200)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .strokeLineJoin(LineJoinStyle.Miter)
              .strokeMiterLimit(5.0)
            .id('PathTest')
            Shape() {
                Rect()
              }.width(65.0.vp)
              .height(20.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .strokeLineJoin(LineJoinStyle.Miter)
              .strokeOpacity(@r(app.string.content_opacity))
              .strokeMiterLimit(5.0)
            .id('WHTest')
             Shape() {
                Rect()
              }
              .size(width:100.0.vp,height:70.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .fillOpacity(0.5)
            .id('SizeLengthTest')
            Shape() {
                Rect()
              }
              .size(width:100.0.vp,height:70.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .mesh([3.0,3.0],3,3)
              .fillOpacity(@r(app.string.content_opacity))
            .id('MeshTest')
            Shape() {
                Rect()
              }
              .size(width:100.0.vp,height:70.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .mesh([3.00,3.00],3,3)
            .id('MeshFTest')
            Shape() {
                Rect()
              }
              .size(width:100.0.vp,height:70.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .mesh([3.00,3.00],3,3).maskShape(RectShape().size(width:10.0.vp,height:7.0.vp).offset(x:1.0.vp,y:1.0.vp))
            .id('ChipsizeTest')
            Shape() {
                Rect()
              }
              .size(width:100.0.vp,height:70.0.vp)
              .viewPort(
                x: -20,
                y: -5,
                width: 310,
                height: 90
              )
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .mesh([3.00,3.00],3,3).maskShape(RectShape().width(10.0.vp).height(7.0.vp).offset(x:1.0.vp,y:1.0.vp))
            .id('ChopWHTest')

            Shape()
            .maskShape(PathShape())
            Shape(value: this.pix)
            .maskShape(PathShape(width:10.0.vp,height:10.0.vp))
        }
   }
}
