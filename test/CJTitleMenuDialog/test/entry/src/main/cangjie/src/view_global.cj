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
import ohos.hilog.Hilog
import std.sync.Timer

@Entry
@Component
class ViewGlobal {
    @State
    var time: Int64 = 0
    @State
    var timeSring: String = "Nothing happen"
    var timer_1: Timer = Timer.once(Duration.Zero, {=> Hilog.info(0, "timer_1", "timer_1")})
    var timer_2: Timer = Timer.once(Duration.Zero, {=> Hilog.info(0, "timer_2", "timer_2")})

    func build() {
        Column() {
            Button("SysCap_exist").onClick(
                {
                    etv =>
                    //                    if(canIUse("SystemCapability.Location.Location.Core")){
                    //                        Hilog.info(0, "SysCap", "支持系统能力SystemCapability.Location.Location.Core")
                    //                    }
                    //                    else{
                    Hilog.info(0, "SysCap", "不支持系统能力SystemCapability.Location.Location.Core")
                //                    }
                })
            Button("SysCap_not_exist").onClick(
                {
                    etv =>
                    //                    if(canIUse("SystemCapability.PCService.FileGuard")){
                    //                        Hilog.info(0, "SysCap", "支持系统能力SystemCapability.PCService.FileGuard")
                    //                    }
                    //                    else{
                    Hilog.info(0, "SysCap", "不支持系统能力SystemCapability.PCService.FileGuard")
                //                    }
                })

            Text(this.timeSring).id("timer_1")
            Text("Timer value：${this.time} s").id("timer_2")
            Column() {
                Button("Timer setTimeout")
                    .id("Timer setTimeout")
                    .onClick(
                        {
                            etv => this.timer_1 = Timer.once(1000 * Duration.millisecond,
                                {
                                    => this.timeSring = "do after 1s delay"
                                })
                        })
                Button("Timer setInterval")
                    .id("Timer setInterval")
                    .onClick(
                        {
                            etv => this.timer_2 = Timer.repeat(1000 * Duration.millisecond, 1000 * Duration.millisecond,
                                {
                                    => this.time++
                                })
                        })
                Button("cancelTimer")
                    .id("cancelTimer")
                    .onClick(
                        {
                            etv =>
                            this.timeSring = "Nothing happen"
                            this.time = 0
                            this.timer_1.cancel()
                            this.timer_2.cancel()
                        }
                    )
            }
            Column() {
                Button("Timer setTimeout_Zero")
                    .id("Timer setTimeout_Zero")
                    .onClick(
                        {
                            etv => this.timer_1 = Timer.once(Duration.Zero, {
                                => this.timeSring = "do after 1s delay"
                            })
                        })
                Button("Timer setTimeout_Max")
                    .id("Timer setTimeout_Max")
                    .onClick(
                        {
                            etv => try {
                                this.timer_1 = Timer.once(Duration.Max + Duration.second,
                                    {
                                        => this.timeSring = "do after 1s delay"
                                    })
                            } catch (e: Exception) {
                                logger("setTimeout_Max " + e.toString())
                            }
                        })
                Button("Timer setTimeout_Min")
                    .id("Timer setTimeout_Min")
                    .onClick(
                        {
                            etv => try {
                                this.timer_1 = Timer.once(Duration.Min - Duration.second,
                                    {
                                        => this.timeSring = "do after 1s delay"
                                    })
                            } catch (e: Exception) {
                                logger("setTimeout_Min " + e.toString())
                            }
                        })
            }
            Column() {
                Button("Timer setInterval_Delay_Zero")
                    .id("Timer setInterval_Delay_Zero")
                    .onClick(
                        {
                            etv => this.timer_2 = Timer.repeat(Duration.Zero, 1000 * Duration.millisecond,
                                {
                                    => this.time++
                                })
                        })
                Button("Timer setInterval_Delay_Max")
                    .id("Timer setInterval_Delay_Max")
                    .onClick(
                        {
                            etv => try {
                                this.timer_2 = Timer.repeat(Duration.Max + Duration.second, 1000 * Duration.millisecond,
                                    {
                                        => this.time++
                                    })
                            } catch (e: Exception) {
                                logger("setInterval_Delay_Max " + e.toString())
                            }
                        })
                Button("Timer setInterval_Delay_Min")
                    .id("Timer setInterval_Delay_Min")
                    .onClick(
                        {
                            etv => try {
                                this.timer_2 = Timer.repeat(Duration.Min - Duration.second, 1000 * Duration.millisecond,
                                    {
                                        => this.time++
                                    })
                            } catch (e: Exception) {
                                logger("setInterval_Delay_Min " + e.toString())
                            }
                        })
            }
            Column() {
                Button("Timer setInterval_Interval_Zero")
                    .id("Timer setInterval_Interval_Zero")
                    .onClick(
                        {
                            etv => try {
                                this.timer_2 = Timer.repeat(Duration.Zero, Duration.Zero, {
                                    => this.time++
                                })
                            } catch (e: Exception) {
                                logger("setInterval_Interval_Zero " + e.toString())
                            }
                        })
                Button("Timer setInterval_Interval_Max")
                    .id("Timer setInterval_Interval_Max")
                    .onClick(
                        {
                            etv => try {
                                this.timer_2 = Timer.repeat(Duration.Zero, Duration.Max + Duration.second,
                                    {
                                        => this.time++
                                    })
                            } catch (e: Exception) {
                                logger("setInterval_Interval_Max " + e.toString())
                            }
                        })
                Button("Timer setInterval_Interval_Min")
                    .id("Timer setInterval_Interval_Min")
                    .onClick(
                        {
                            etv => try {
                                this.timer_2 = Timer.repeat(Duration.Zero, Duration.Min - Duration.second,
                                    {
                                        => this.time++
                                    })
                            } catch (e: Exception) {
                                logger("setInterval_Interval_Min " + e.toString())
                            }
                        })
            }
        }
    }
}
