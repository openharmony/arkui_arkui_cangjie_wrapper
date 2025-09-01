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

let ls = LocalStorage()
let tmp = ls.setOrCreate<Int64>("PropA", 47)

@Entry[ls]
@Component
class View_LocalStorage {
    @LocalStorageLink["count"]
    var count: Int64 = 0
    func build() {
        Row {
            Column {
                Text("${count}").id("parentText").width(count.vp)
                Button("+").onClick {
                    e => count += 10
                }.id("parentBtn")
                Son1()
                Son2()
                Son3()
            //                Son4()
            }.width(100.percent)
        }.height(100.percent)
    }

    protected override func aboutToDisappear() {
        ls.aboutToBeDeleted()
        return
    }
}

@Component
class Son1 {
    @LocalStorageLink["count"]
    var count: Int64 = 0
    func build() {
        Column(space: 10) {
            // 修改会同步到其他组件中
            Button("-").onClick {
                e => count -= 10
            }.id("sonBtn")
        }
    }
}

/**
    补充校验内容：
        setOrCreate() 已有属性set()
        get() 未找到对应属性/对应属性为None
        set() 未找到对应属性/传入新值为None
 */
@Component
class Son2 {
    //prework
    let nullInt: ?Int64 = None
    let ls2 = LocalStorage()
    let k2create = ls2.setOrCreate("k2", 42)

    // 设置 (k1,None)
    let k1create = ls2.setOrCreate("k1", nullInt) //true

    //set() lowerfalse
    let k0set = ls2.set<Int64>("k0", 42) //k0不存在 false

    //get upperNone [Expected]
    let k1get = ls2.get<Int64>("k1") //k1无值 None

    //get lowerNone
    let k0get = ls2.get<Int64>("k0") //k0不存在 None

    // setOrCreate() matched case
    let k1reCreate = ls2.setOrCreate("k1", 24) // true

    //set() upperfalse
    let k2set = ls2.set("k2", nullInt) //false

    func build() {
        Column(space: 10) {
            Text("k1create: ${k1create}").id("Son2k1create")
            Text("k0set: ${k0set}").id("Son2k0set")
            Text("k1get: ${k1get}").id("Son2k1get")
            Text("k0get: ${k0get}").id("Son2k0get")
            Text("k1reCreate: ${k1reCreate}").id("Son2k1reCreate")
            Text("k2set: ${k2set}").id("Son2k2set")
        }
    }
}

/**
    补充校验内容：
    delete() 成功删除/未找到属性
    clear() 成功清除
 */
@Component
class Son3 {
    // prework
    let ls3 = LocalStorage()
    let k1set = ls3.setOrCreate("k1", 42)
    let k2set = ls3.setOrCreate("k2", 42)

    let size1 = ls3.size() // 2
    let deleteK1 = ls3.delete("k1") // found & true
    let deleteK0 = ls3.delete("k0") // mismatched & false
    let size2 = ls3.size() // 1
    let clear = ls3.clear() // true
    let size3 = ls3.size() // 0
    func build() {
        Column(space: 10) {
            Text("size1: ${size1}").id("Son3size1")
            Text("deleteK1: ${deleteK1}").id("Son3deleteK1")
            Text("deleteK0: ${deleteK0}").id("Son3deleteK0")
            Text("size2: ${size2}").id("Son3size2")
            Text("clear: ${clear}").id("Son3clear")
            Text("size3: ${size3}").id("Son3size3")
        }
    }
}

/**
    补充校验内容
    link<T>()   未找到属性值/传入参数为 None
    `prop`<T>()  未找到属性值
 */
@Component
class Son4 {
    // prework
    let nullInt: ?Int64 = None
    let ls4 = LocalStorage()
    let k1create = ls4.setOrCreate("k1", nullInt)

    // prop() upper None
    //    let setProp1 = ls4.`prop`<temppp>("k1") // 原参数为None 返回None
    // link() lower None
    //    let setLink1 = ls4.link<Int64>("k0") // 不存在此参数 返回None
    // link() upper None
    //    let setLink2 = ls4.link<Int64>("k1") // 原参数为None 返回None

    func build() {
        Column(space: 10) {
            //            Text("setProp1: ${setProp1}").id("Son4setProp1")
            //            Text("setLink1: ${setLink1}").id("Son4setLink1")
            //            Text("setLink2: ${setLink2}").id("Son4setLink2")
        }
    }
}
