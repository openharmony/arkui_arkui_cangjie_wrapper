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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

// 新增组件模板：与 ohos/arkui/component/button/button.cj、button_attr.cj 真实模式一致。
// 使用方法：将 <Name> 替换为组件名，按注释裁剪；不要引入本模板之外的写法。
// 注意：@!APILevel 的 since 必须按当期实际系统版本填写（本文件以 "22" 为例，随版本演进更新）。

package ohos.arkui.component.<name>

import ohos.arkui.component.common.CommonMethod
import ohos.base.{Length, ResourceColor, ResourceStr}
import ohos.labels.{APILevel}

// 1) FFI 声明：命名 FfiOHOSAceFramework<Name><Action>；C++ 实现在 arkui_ace_engine:cj_frontend_ohos
foreign {
    func FfiOHOSAceFramework<Name>Create(): Unit

    func FfiOHOSAceFramework<Name>CreateWithOptions(option: <Name>Optional): Unit

    func FfiOHOSAceFramework<Name>SetDemoFlag(flag: Bool): Unit
}

// 2) 创建参数：@C struct，字段全为可跨 FFI 的平铺类型；字段顺序即 C ABI 布局，禁止重排。
//    命名沿用仓内 <Name>Optional 惯例；它不携带 Option 语义——`?T` 的 None 已在
//    仓颉侧兜底为默认值后再构造。若需跨 FFI 表达"未设置"，必须为字段增加
//    hasXxx: Bool 标记位（双侧同步）。
@C
struct <Name>Optional {
    <Name>Optional(
        let demoFlag: Bool,
        let demoType: Int32
    ) {}
}

// 3) 对外枚举：@Derive[Equatable] + public enum，每个成员单独标注 @!APILevel
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum <Name>Type {
    /**
     * Common style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    /**
     * Special style.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Special
}

// 4) 属性接口：sealed interface + CommonMethod<Self>，参数 ?T，返回自身以支持链式调用
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface <Name>Attribute <: CommonMethod<<Name>Attribute> {
    /**
     * Demo width.
     *
     * @param { ?Length } value - The width of the component.
     * @returns { <Name>Attribute } - The attribute of the component.
     * @default 0
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func demoWidth(value: ?Length): <Name>Attribute
}
