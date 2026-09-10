# 组件开发指南（Component Development Guide）

> 模板取自真实代码 `ohos/arkui/component/button/`（button.cj 826 行 / button_attr.cj / BUILD.gn），新增或修改组件严格对照此模式。配套技能：`.claude/skills/cangjie-component-api-design/`。

## 1. 一个组件目录的"四件套"

```text
ohos/arkui/component/<name>/
├── <name>.cj        # 枚举类型、Options、foreign FFI 声明、组件构造函数
├── <name>_attr.cj   # sealed interface <Name>Attribute（属性方法声明）
└── BUILD.gn         # ohos_cangjie_shared_library 目标

+ 根 BUILD.gn 注册（必做）
```

## 2. `<name>.cj` 骨架（真实模式）

```cangjie
// 文件头：Apache-2.0 License 注释 + Beta 声明注释（对照现有文件）
package ohos.arkui.component.<name>

import ohos.arkui.component.common.{CommonMethodComponent, ...}
import ohos.arkui.component.native_struct.{...}
import ohos.arkui.component.util.{...}
import ohos.base.{Length, ResourceStr, ResourceColor, ...}
import ohos.labels.{APILevel}
import ohos.business_exception.BusinessException

foreign {
    func FfiOHOSAceFramework<Name>Create(): Unit
    func FfiOHOSAceFramework<Name>CreateWithOptions(option: <Name>Optional): Unit
    func FfiOHOSAceFramework<Name>SetXxx(value: Int32): Unit
}

// 创建参数 struct：命名沿用仓内 <Name>Optional 惯例。
// 注意：它不携带 Option 语义——`?T` 的 None 已在仓颉侧兜底为默认值后再构造；
// 若需跨 FFI 表达"未设置"，必须为字段增加 hasXxx: Bool 标记位（双侧同步）。
@C
struct <Name>Optional {
    <Name>Optional(let shape: Int32, let stateEffect: Bool) {}
}

// 对外枚举：@Derive[Equatable] + public enum，每个成员单独标注 @!APILevel
// since 必须取当期实际系统版本（本仓当前示例为 "22"，随版本演进更新，勿盲抄历史值）
@Derive[Equatable]
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum <Name>Type {
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Normal |
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    Capsule
}
```

要点：

- `foreign` 块内是**声明**，实现在 `arkui_ace_engine`（`cj_frontend_ohos`），命名 `FfiOHOSAceFramework<组件><动作>`。
- `@C struct` 字段顺序即 C ABI 布局，禁止重排；`Option<T>` 不能直接跨 FFI——`None` 在仓颉侧兜底为默认值后再构造 `@C` struct；需要保留"未设置"语义时加 `hasXxx: Bool` 标记位。
- 对外枚举用 `@Derive[Equatable]` + `public enum`，成员逐一标注 `@!APILevel`。
- `@!APILevel` 采用上方多行排版（与仓内现有代码一致）；`since` 按当期系统版本填写。

## 3. `<name>_attr.cj` 骨架（真实模式）

```cangjie
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface <Name>Attribute <: CommonMethod<<Name>Attribute> {
    /**
     * Text size.
     *
     * @param { ?Length } value - The font size.
     * @returns { <Name>Attribute } - The attribute of the component.
     * @default 0
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func fontSize(value: ?Length): <Name>Attribute
}
```

要点：

- `sealed interface`，继承 `CommonMethod<Self>`（通用属性/事件由此提供，勿重复声明）。
- 属性方法参数一律 `?T`（`None` = 不设置/用默认），返回自身接口类型以支持链式调用。
- 每个方法带完整英文 doc 注释与 `@!APILevel`；**默认值写在方法 doc 注释内的 `@default` 行**（如上例），不要在方法体外挂孤立的 `@default` 注释。

## 4. BUILD.gn 模板（照抄 button/BUILD.gn）

```gn
import("//build/templates/cangjie/cjc.gni")

ohos_cangjie_shared_library("ohos.arkui.component.<name>") {
  sources = ["<name>.cj", "<name>_attr.cj"]
  cj_deps = [
    "../../../base:ohos.base",
    "../common:ohos.arkui.component.common",
    "../native_struct:ohos.arkui.component.native_struct",
    "../util:ohos.arkui.component.util",
  ]
  cj_external_deps = [
    "cangjie_ark_interop:ohos.ffi",
    "cangjie_ark_interop:ohos.labels",
    "cangjie_ark_interop:ohos.business_exception",
    "global_cangjie_wrapper:ohos.resource",
  ]
  external_deps = ["ace_engine:cj_frontend_ohos"]
  cjc_args = ["--no-sub-pkg"]
  subsystem_name = "arkui"
  part_name = "arkui_cangjie_wrapper"
}
```

## 5. 新增组件检查清单（Done Definition）

1. [ ] 三件套文件齐备，License 头完整。
2. [ ] 根 `BUILD.gn`：加入 `arkui_cangjie_wrapper_packages_ohos` 列表（否则 SDK 收集不到）。
3. [ ] 需要对外导出的公共类型，确认经 `ohos/arkui/component/BUILD.gn` → `kit/ArkUI/index.cj` 链路可见。
4. [ ] FFI 命名遵循 `FfiOHOSAceFramework<Name><Action>`，双侧签名一致（跨仓改动已在 PR 说明）。
5. [ ] 编译通过：`./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie --gn-args sdk_build_cangjie=true`（全量仓颉 SDK，见 `docs/build/Build_Guide.md` §2）。
6. [ ] 设备侧验证：在 `test/` 对应组件族套件中补用例（见 `docs/testing/Testing_Guide.md`），或注明未验证原因。
