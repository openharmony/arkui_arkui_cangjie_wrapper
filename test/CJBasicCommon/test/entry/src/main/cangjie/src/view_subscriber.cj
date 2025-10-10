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
import std.collection.ArrayList

class TestObserver <: Observer {
    public TestObserver() {

    }

    public func onStateUpdate(info: String, dependentElmtIds: ArrayList<Int64>): Unit {

    }

    public func onStateUpdate(info: String): Unit {

    }
    public func notifyRead(info: String): Unit {

    }
    public func id(): Int64 {
        return 1
    }
    public func aboutToBeDeleted(): Unit {

    }
}

@Entry
@Component
class ViewSubscriber {

    @State var size: String = "0"

    func build() {
        Column(space: 10) {
            Text(size).width(20.vp).id("show")

            Button("size").onClick ({ e =>
//                this.size = SubscriberManager.getInstance().sizeOfManager().toString()
            }).id("size")

            Button("ShowInfo").onClick ({
                e =>
//                SubscriberManager.getInstance().dumpSubscriberInfo()
            }).id("info")

            Button("get").onClick ({
                e =>
                let p0 = TestObserver()
                SubscriberManager.getInstance().add(p0)
                SubscriberManager.getInstance().add(p0)
                SubscriberManager.getInstance().get(2)
            }).id("get")
        }
    }
}