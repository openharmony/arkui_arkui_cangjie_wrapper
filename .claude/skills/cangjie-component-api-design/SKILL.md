---
name: cangjie-component-api-design
description: Use when adding a new UI component or modifying a component's public API (attribute methods, enums, options) in arkui_arkui_cangjie_wrapper. Ensures the Cangjie wrapper follows the repo's real sealed-interface + foreign-FFI patterns.
metadata:
  author: openharmony
  scope: repo
  stage: design
  domain: arkui
  capability: component-api-design
  version: 1.1.0
  status: stable
---

# 仓颉组件 API 设计（arkui_cangjie_wrapper）

以本仓真实代码为准：标准模板是 `ohos/arkui/component/button/`（button.cj + button_attr.cj + BUILD.gn）。**动手前先读 button 三件套与 `docs/components/Component_Development_Guide.md`。**

## 模式规则（与 ArkTS 不同，勿套用 ArkTS 写法）

1. **属性接口**：`sealed interface XxxAttribute <: CommonMethod<XxxAttribute>`，方法返回自身接口类型实现链式调用；参数一律 `?T`（`None` = 不设置，走默认值）。禁止返回 `Unit` 的属性方法。
2. **API 标注**：对外类型（enum/interface/func）用 `@!APILevel[since: "<当期版本>", syscap: "SystemCapability.ArkUI.ArkUI.Full"]`；**`since` 必须按当期实际系统版本填写**（本文示例中的 "22" 对应本仓当前版本，随版本演进更新，勿盲抄历史值）；public enum 的**每个成员**都要单独标注；`@since` 只增不改。
3. **枚举**：`@Derive[Equatable]` + `public enum`；枚举值变更影响兼容性（AGENTS.md §3 ask-before 项）。
4. **FFI**：`foreign {}` 声明命名 `FfiOHOSAceFramework<Name><Action>`；`Option<T>` 不可跨 FFI，创建参数用 `@C struct <Name>Optional`（全平铺类型，命名沿用仓内惯例）。**该 struct 不携带 Option 语义**——`?T` 的 `None` 已在仓颉侧兜底为默认值后再构造；若需跨边界表达"未设置"，必须为字段增加 `hasXxx: Bool` 标记位（双侧同步）。
5. **默认值文档**：默认值写在方法 doc 注释内的 `@default` 行；不要在方法体外挂孤立的 `@default` 注释。
6. **不要**在本仓实现引擎逻辑——只做封装与声明，C++ 实现在 `arkui_ace_engine:cj_frontend_ohos`。

## 新增组件步骤

1. 建目录 `ohos/arkui/component/<name>/`，照 `Component_Development_Guide.md` §2-§4 模板写三件套。
2. 根 `BUILD.gn`：把 `ohos.arkui.component.<name>` 加入 `arkui_cangjie_wrapper_packages_ohos`（**漏掉则 SDK 收集不到**）。
3. 公共类型经 `component/BUILD.gn` 与 `kit/ArkUI/index.cj` 导出。
4. FFI 双侧对齐（用 skill `cangjie-ffi-signature-sync`）。
5. 编译验证（全量仓颉 SDK，**不支持单仓/单模块/kit 单独编译**）：
   `./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie --gn-args sdk_build_cangjie=true`
6. `test/` 对应套件补用例或说明未验证原因。

## 自检清单

- [ ] 对照 button 模式：sealed interface、?T 参数、链式返回、@!APILevel 全覆盖
- [ ] License 头 + Beta 注释
- [ ] foreign 命名与双侧签名一致
- [ ] 根 BUILD.gn 已注册
- [ ] 编译通过
