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
import std.collection.{ArrayList, HashMap}

class initialOptionNone {
    init(){
    }
    static func getGridRowSizeOption(): GridRowSizeOption {
        var ret = GridRowSizeOption()
        ret.xs = Option<Length>.None
        ret.sm = Option<Length>.None
        ret.md = Option<Length>.None
        ret.lg = Option<Length>.None
        ret.xl = Option<Length>.None
        ret.xxl = Option<Length>.None
        return ret
    }

    static func getGridRowOptions(): GridRowOptions {
        var ret = GridRowOptions()
        ret.xs = Option<Int32>.None
        ret.sm = Option<Int32>.None
        ret.md = Option<Int32>.None
        ret.lg = Option<Int32>.None
        ret.xl = Option<Int32>.None
        ret.xxl = Option<Int32>.None
        return ret
    }

    static func getEdgeWidths(): EdgeWidths {
        var ret = EdgeWidths()
        ret.top = Option<Length>.None
        ret.right = Option<Length>.None
        ret.bottom = Option<Length>.None
        ret.left = Option<Length>.None
        return ret
    }
    
}

@Entry
@Component
class ViewAddCov {

    func build() {
        Column {
            GridRow(
                gutter: GutterOption(x: Option<GridRowSizeOption>.None, y: Option<GridRowSizeOption>.None),
                columns: GridRowOptions(Option<Int32>.None),
                direction: GridRowDirection.RowReverse) {
                GridCol() {
                    Row() {
                        Text("grid_row_1")
                    }
                }
            }.height(-10)

            GridRow(
                gutter: GutterOption(x: GridRowSizeOption(Option<Length>.None), y: initialOptionNone.getGridRowSizeOption()),
                columns: initialOptionNone.getGridRowOptions(),
                direction: GridRowDirection.RowReverse) {
                GridCol(span: Option<GridColOptions>.None, offset: Option<GridColOptions>.None,
                    order: Option<GridColOptions>.None) {
                    Row() {
                        Text("grid_col_attr_1")
                            .fontColor(Color.Gray)
                            .fontSize(12)
                    }
                        .width(100.percent)
                        .height(40.vp)
                }
                    .height(Option<Length>.None)
                    .borderColor(Color.Blue)
                    .borderWidth(2.vp)
                    .span(GridColOptions(1))
                    .gridColOffset(GridColOptions(xs: -1, sm: 2, md: 3, lg: 4, xl: 1, xxl: 2))
                    .order(GridColOptions(xs: 1, sm: -2, md: 3, lg: 4, xl: 1, xxl: 2))
                    .id("grid_col_attr_1")
            }.height(Option<Length>.None)
            
            Flex(){}.width(Option<Length>.None).height(Option<Length>.None)
            Flex(direction: FlexDirection.RowReverse){}.size(width: -10, height: -10)
            
            Column(space: 10) {
                Row().width(-10).height(-10)
                Row().width(Option<Length>.None).height(Option<Length>.None)
            }
            .width(Option<Length>.None)
            .height(Option<Length>.None)
            .id("my_col_1")

            Text() {
                Span(Option<ResourceStr>.None)
                    .fontSize(-1)
                    .fontColor(Option<ResourceColor>.None)
                    .fontWeight(Option<FontWeight>.None)
                    .fontFamily(Option<ResourceStr>.None)
                    .decoration(decorationType: Option<TextDecorationType>.None,
                      color: Option<ResourceColor>.None)
                Span(Option<ResourceStr>.None)
                    .fontSize(Option<Length>.None)
            }.id("spanComponent1")

            RelativeContainer()
            .guideLine([
                GuideLineStyle(Option<String>.None, Option<Axis>.None, Option<GuideLinePosition>.None)
            ])
            .barrier([
                BarrierStyle(Option<String>.None, Option<BarrierDirection>.None, Option<Array<String>>.None)
            ])
            Blank(min: 100).height(Option<Length>.None)
            Blank(min: 100).height(-10)

            RichText(Option<ResourceStr>.None)

            Stack().width(Option<Length>.None).height(Option<Length>.None)
            Stack().size(width: -10, height: -10)

            Search(value: "", icon: @r(app.media.startIcon))
                .placeholderColor(Option<ResourceColor>.None)
                .border(width: Option<Length>.None, color: Option<ResourceColor>.None,
                    radius: Option<Length>.None, style: Option<BorderStyle>.None)
                .borderWidth(Option<Length>.None)
                .height(Option<Length>.None)

            Search(value: "", icon: @r(app.media.startIcon))
                .borderWidth(1.percent)
                .height(-1)

            Text(Option<ResourceStr>.None).width(Option<Length>.None)
                .height(Option<Length>.None)
                .maxFontSize(-1)
            Text("test option none").width(-1).height(-1)
                .maxFontSize(Option<Length>.None)
                .minFontSize(Option<Length>.None)


            TextArea()
            .placeholderColor(Option<ResourceColor>.None)
            .maxLength(Option<UInt32>.None)
            .fontSize(Option<Length>.None)
            .borderWidth(1.percent)

            TextArea()
            .fontColor(Option<ResourceColor>.None)
            .borderWidth(Option<Length>.None)

            TextArea()
            .height(Option<Length>.None).padding(Option<Length>.None)
            .border(width: 1.vp, color: Color.Blue, radius: 3.vp, style: BorderStyle.Dashed)
            .borderWidth(Option<EdgeWidths>.None)

            TextArea()
            .height(-1)
            .padding(top: Option<Length>.None, right: Option<Length>.None,
                bottom: Option<Length>.None, left: Option<Length>.None)
            .margin(top: Option<Length>.None, right: Option<Length>.None,
                bottom: Option<Length>.None, left: Option<Length>.None)
            .border(width: Option<Length>.None)
            .borderWidth(initialOptionNone.getEdgeWidths())
        }
        .width(100.percent).padding(top: 5)
    }
}
