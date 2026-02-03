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

import std.collection.ArrayList

/**
 * 测试用例中使用的共享类型定义
 */

/**
 * 自定义类型，用于测试自定义数据类型
 */
public class CustomItem {
    let value: Int64
    let name: String
    
    public init(value: Int64, name: String) {
        this.value = value
        this.name = name
    }
}


/**
 * TC_037: itemGenerator中嵌套LazyForEach
 */
class NestedItem {
    let value: Int64
    let children: ArrayList<String>
    
    public init(value: Int64, children: ArrayList<String>) {
        this.value = value
        this.children = children
    }
}
