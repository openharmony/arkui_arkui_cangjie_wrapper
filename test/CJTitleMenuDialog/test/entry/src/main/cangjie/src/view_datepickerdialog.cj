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
import ohos.hilog.Hilog

@Entry
@Component
class View_DatePickerDialog {
    //    let acceptButtonStyleCase1 = PickerDialogButtonStyle(
    //        `type`: ButtonType.Normal,
    //        style: ButtonStyleMode.NORMAL,
    //        role: ButtonRole.NORMAL,
    //        fontColor: Color.RED,
    //        fontSize: 26.fp,
    //        fontWeight: FontWeight.Bolder,
    //        fontStyle: FontStyle.Normal,
    //        fontFamily: "sans-serif",
    //        backgroundColor: 0x80834511,
    //        borderRadius: BorderRadiuses(topLeft: 20, topRight: 20, bottomLeft: 20, bottomRight: 20),
    //        primary: true
    //    )

    //    let cancelButtonStyleCase1 = PickerDialogButtonStyle(
    //        `type`: ButtonType.Normal,
    //        style: ButtonStyleMode.NORMAL,
    //        role: ButtonRole.NORMAL,
    //        fontColor: Color.BLUE,
    //        fontSize: 16.fp,
    //        fontWeight: FontWeight.Normal,
    //        fontStyle: FontStyle.Italic,
    //        fontFamily: "sans-serif",
    //        backgroundColor: 0x50182431,
    //        borderRadius: BorderRadiuses(topLeft: 10, topRight: 10, bottomLeft: 10, bottomRight: 10)
    //    )
    //    var  dataPickerDialogOptionCase1: DatePickerDialogOptions = DatePickerDialogOptions(
    //            start: DateTime.of(year: 2000, month: Month.of(1), dayOfMonth: 1),
    //            end: DateTime.of(year: 2100, month: Month.of(12), dayOfMonth: 31),
    //            selected: DateTime.of(year: 2010, month: Month.of(1), dayOfMonth: 1),
    //            lunar: true,
    //            lunarSwitch: true,
    //            showTime: true,
    //            useMilitaryTime: true,
    //            disappearTextStyle: PickerTextStyle(Color.PINK, MyFont(size: 22.fp, weight: FontWeight.Bold)),
    //            textStyle: PickerTextStyle(0xff00ff00, MyFont(size: 18.fp, weight: FontWeight.Normal)),
    //            selectedTextStyle: PickerTextStyle(0xff182431, MyFont(size: 14.fp, weight: FontWeight.Regular)),
    //            acceptButtonStyle: acceptButtonStyleCase1,
    //            cancelButtonStyle: cancelButtonStyleCase1,
    //            alignment: DialogAlignment.Center,
    //            maskRect: Rectangle(x: 5.vp, y: 5.vp, width: 90.percent, height: 90.percent),
    //            onCancel: {=> Hilog.info(0, "test", "DatePickerDialog:onCancel()")},
    //            onDateAccept: {
    //                value => Hilog.info(0, "test",
    //                    "DatePickerDialog:onDateAccept(): ${value.year}-${value.monthValue}-${value.dayOfMonth}")
    //            },
    //            onDateChange: {
    //                value => Hilog.info(0, "test",
    //                    "DatePickerDialog:onDateChange(): ${value.year}-${value.monthValue}-${value.dayOfMonth}")
    //            },
    //            backgroundColor: Color.GRAY,
    //            backgroundBlurStyle: BlurStyle.Regular,
    //            onDidAppear: {=> Hilog.info(0, "test", "DatePickerDialog:onDidAppear()")},
    //            onDidDisappear: {=> Hilog.info(0, "test", "DatePickerDialog:onDidDisappear()")},
    //            onWillAppear: {=> Hilog.info(0, "test", "DatePickerDialog:onWillAppear()")},
    //            onWillDisappear: {=> Hilog.info(0, "test", "DatePickerDialog:onWillDisappear()")},
    //            shadow: ShadowOptions(radius: 1.0, shadowType: ShadowType.COLOR),
    //            dateTimeOptions: DateTimeOptions(hour: "2-digit", minute: "numeric")
    //        )
    //    //边界值弹窗背板
    //    var  dataPickerDialogOptionErrorCase1: DatePickerDialogOptions = DatePickerDialogOptions(
    //        backgroundColor: Color.RED,
    //        backgroundBlurStyle: BlurStyle.BACKGROUND_ULTRA_THICK
    //    )
    //    var  dataPickerDialogOptionErrorCase2: DatePickerDialogOptions = DatePickerDialogOptions(
    //        backgroundColor: Color.RED,
    //    )
    //    //边界值按钮显示样式
    //    var  dataPickerDialogOptionErrorCase3: DatePickerDialogOptions = DatePickerDialogOptions(
    //        acceptButtonStyle: PickerDialogButtonStyle(primary: true),
    //        cancelButtonStyle: PickerDialogButtonStyle(primary: true)
    //    )
    //    var  dataPickerDialogOptionErrorCase4: DatePickerDialogOptions = DatePickerDialogOptions(
    //        backgroundColor: Color.RED,
    //    )
    //    //组合值
    //    var  dataPickerDialogOptionWithCase1: DatePickerDialogOptions = DatePickerDialogOptions(
    //        lunarSwitch: true,
    //    )
    //    var  dataPickerDialogOptionWithCase2: DatePickerDialogOptions = DatePickerDialogOptions(
    //        backgroundColor: Color.RED,
    //    )
    func build() {
        Column() {
            Button("显示DatePicker非默认弹窗").onClick({
                event =>
            //                    DatePickerDialog.show(options: dataPickerDialogOptionCase1)
            }).id("show_datePickerDialog1")
            Button("显示DatePicker默认弹窗").onClick({
                event =>
            //                        DatePickerDialog.show(options: DatePickerDialogOptions())
            }).id("show_datePickerDialog2")
            Button("显示默认弹窗").onClick({
                event =>
            //                        DatePickerDialog.show()
            }).id("show_datePickerDialog3")

            Button("显示DatePicker边界值弹窗背板").onClick({
                event =>
            //                        DatePickerDialog.show(options: dataPickerDialogOptionErrorCase1)
            }).id("show_datePickerDialog4")

            Button("显示DatePicker设置按钮显示样式").onClick({
                event =>
            //                        DatePickerDialog.show(options: dataPickerDialogOptionErrorCase3)
            }).id("show_datePickerDialog5")

            Button("显示DatePicker组合值").onClick({
                event =>
            //                        DatePickerDialog.show(options: dataPickerDialogOptionErrorCase1)
            }).id("show_datePickerDialog6")

            Button("显示DatePicker组合值").onClick({
                event =>
            //                        DatePickerDialog.show(options: dataPickerDialogOptionWithCase1)
            }).id("show_datePickerDialog7")
        }.width(100.percent)
    }
}
