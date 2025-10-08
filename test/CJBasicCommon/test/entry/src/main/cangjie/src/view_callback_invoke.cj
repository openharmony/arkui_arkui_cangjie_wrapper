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

///**
// * Created on 2025/3/27
// */
package ohos_app_cangjie_entry
//
//
//import ohos.base.*
//import ohos.arkui.component.*
//import ohos.arkui.state_management.*
//import ohos.arkui.state_macro_manage.*
//import ohos.base.Callback1ArgumentWithReturn
//import ohos.base.CallbackWithReturn
//import ohos.base.Callback2Argument
//import ohos.base.Callback3ArgumentWithReturn
//
//@Entry
//@Component
//class ViewCallbackInvoke {
//    func build() {
//        Row {
//            Column {
//                Text(Callback1().invoke(32))
//                    .fontSize(50)
//                    .fontWeight(FontWeight.Bold)
//                    .id('callback1')
//                Text(Callback().invoke())
//                    .fontSize(50)
//                    .fontWeight(FontWeight.Bold)
//                    .id('callback')
//                Button('callback2')
//                    .onClick { e =>
//                    Callback2().invoke('1', '2')
//                }.id("callback2")
//                Text(Callback3().invoke('1', '2', '3'))
//                    .fontSize(50)
//                    .fontWeight(FontWeight.Bold)
//                    .id('callback3')
//            }.width(100.percent)
//        }.height(100.percent)
//    }
//}
//
//class Callback1 <: Callback1ArgumentWithReturn<Int64, String> {
//    override public func invoke(arg1: Int64): String {
//    	return "Received: ${arg1}"
//    }
//}
//
//class Callback <: CallbackWithReturn<String> {
//    override public func invoke(): String {
//    	return "Callback"
//    }
//}
//
//class Callback2 <: Callback2Argument<String, String> {
//    override public func invoke(arg1:String, arg2:String):Unit {
//    	print('arg1: ' + arg1)
//        print('arg2: ' + arg2)
//    }
//}
//
//class Callback3 <: Callback3ArgumentWithReturn<String, String, String, String> {
//    override public func invoke(arg1: String, arg2: String, arg3: String) {
//    	return arg1 + arg2 + arg3
//    }
//}