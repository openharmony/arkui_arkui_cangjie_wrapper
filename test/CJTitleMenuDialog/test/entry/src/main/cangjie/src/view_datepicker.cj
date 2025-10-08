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
import std.time.*

@Entry
@Component
class ViewDatePicker {
    @State
    var isLunar: Bool = false
    @State
    var selectedDate: DateTime = DateTime.of(year: 2025, month: Month.of(12), dayOfMonth: 13)
    //    var dialog: DatePickerDialog = DatePickerDialog()
    var msg: String = ""
    var font1: Font = Font(family: @r(app.string.fontFamily))
    //    var dataPickerDialogOption: DatePickerDialogOptions = DatePickerDialogOptions(
    //        maskRect: Rectangle(),
    //        offset: Offset(1, 1),
    //        alignment: DialogAlignment.TopStart,
    //        disappearTextStyle: PickerTextStyle(Color.Red, Font()),
    //        textStyle: PickerTextStyle(Color.Blue, Font()),
    //        selectedTextStyle: PickerTextStyle(Color.Gray, Font()),
    //        dateTimeOptions: DateTimeOptions()
    //    )
    //    var dataPickerDialogOption2: DatePickerDialogOptions = DatePickerDialogOptions()

    func build() {
        Scroll() {
            Column() {
                Row() {
                    Button("显示DatePicker弹窗")
                        .onClick({
                            event => this.msg = "显示DatePicker弹窗"
                        //                                DatePickerDialog.show(options: dataPickerDialogOption)
                        })
                        .id("show_datePickerDialog")

                    Button("显示DatePicker默认弹窗")
                        .onClick({
                            event => this.msg = "显示DatePicker默认弹窗"
                        //                                DatePickerDialog.show(options: dataPickerDialogOption2)
                        })
                        .id("show_datePickerDialog2")

                    Button("显示默认弹窗").onClick({
                        event => this.msg = "显示默认弹窗"
                    //                                DatePickerDialog.show()
                    }).id("show_datePickerDialog3")
                }
                Button('切换公历农历').onClick({
                    event => this.isLunar = !this.isLunar
                }).id("switch").width(200.vp)

                // 基础场景用例：合法属性设置
                DatePicker(
                    start: DateTime.of(year: 1994, month: Month.of(12), dayOfMonth: 13),
                    end: DateTime.of(year: 2030, month: Month.of(12), dayOfMonth: 13),
                    selected: this.selectedDate
                )
                    .id("DatePickerV1")
                    .disappearTextStyle(
                        PickerTextStyle(color: 0xfffa9600,
                            font: Font(size: 20.fp, weight: FontWeight.Bolder, family: "HarmonyOS Sans",
                                style: FontStyle.Normal)))
                    .textStyle(
                        PickerTextStyle(color: 0xffff0000,
                            font: Font(size: 18.fp, weight: FontWeight.Bold, family: "HarmonyOS Sans Italic",
                                style: FontStyle.Italic)))
                    .selectedTextStyle(
                        PickerTextStyle(color: 0xff0000ff,
                            font: Font(size: 14.fp, weight: FontWeight.Lighter, family: "HarmonyOS Sans Italic",
                                style: FontStyle.Italic)))
                    .lunar(this.isLunar)
                    .onDateChange(
                        {
                            res =>
                            this.selectedDate = DateTime.of(year: res.year, month: res.month, dayOfMonth: res.dayOfMonth)
                            Hilog.info(1, "1", "1",
                                "DatePickerV1 select current date is: " + res.year.toString() + "-" +
                                    res.month.toString() + "-" + res.dayOfMonth.toString())
                        }
                    )
                    .margin(top: 30)
                Text(this.selectedDate.format("yyyy-MM-dd")).id("selectedDateText")

                // 基础场景用例：默认属性设置
                DatePicker()
                    .id("DatePickerDefault")
                    //                    .disappearTextStyle()
                    .textStyle(PickerTextStyle())
                    .selectedTextStyle(PickerTextStyle())
                    .margin(top: 50)

                // 基础场景用例：异常场景设置1
                DatePicker(
                    start: DateTime.of(year: 1994, month: Month.of(12), dayOfMonth: 13),
                    end: DateTime.of(year: 1993, month: Month.of(12), dayOfMonth: 13),
                ).id("DatePickerException1").margin(top: 50)

                // 基础场景用例：异常场景设置2
                DatePicker(
                    start: DateTime.of(year: 1994, month: Month.of(12), dayOfMonth: 13),
                    end: DateTime.of(year: 1993, month: Month.of(12), dayOfMonth: 13),
                    selected: DateTime.of(year: 1969, month: Month.of(12), dayOfMonth: 31)
                )
                    .id("DatePickerException2")
                    .margin(top: 50)
                    .disappearTextStyle(PickerTextStyle(font: Font(size: 15.fp, family: @r(app.string.fontFamily))))
                    .textStyle(PickerTextStyle(font: Font(size: 16.fp, family: @r(app.string.fontFamily))))
                    .selectedTextStyle(PickerTextStyle(font: Font(size: 17.fp, family: @r(app.string.fontFamily))))
                    .opacity(0.8)

                DatePicker(selected: DateTime.of(year: 1969, month: Month.of(12), dayOfMonth: 31)).id("selectChange")
            }.width(100.percent)
        }
    }
}
