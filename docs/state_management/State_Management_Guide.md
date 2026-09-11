# 状态管理指南（State Management Guide）

> 全部宏定义位于 `ohos/arkui/state_macro_manage/`（`macro package`，编译期展开）；运行时位于 `ohos/arkui/state_management/`。
> 宏清单以 grep `public macro` 实际结果为准（2026-09 核对），**不存在的宏（如 @ObjectLink、@Extend）不要臆造**。

## 1. 全部宏清单

### 组件级状态变量（用于 `@Component` class 内 `var`）

| 宏 | 定义文件 | 说明 |
| --- | --- | --- |
| `@State` | `cj_state_define.cj` | 组件内部状态，变更触发 UI 刷新 |
| `@Prop` | `cj_prop_define.cj` | 单向同步父组件传入值 |
| `@Link` | `cj_link_define.cj` | 双向同步 |
| `@Provide` / `@Consume` | `cj_provide_define.cj` / `cj_consume_define.cj` | 跨层级双向/单向（`@Provide(key)`、`@Consume(key)` 可带 key） |
| `@Watch["funcName"]` | `cj_watch_define.cj` | 监听被装饰变量变化回调；须与其他状态宏组合使用（`@Watch["cb"] @State var ...` 或 `@State @Watch["cb"] var ...` 两种顺序均支持，见宏实现） |
| `@Publish` | `cj_publish_define.cj` | `@Observed` class 内发布变量（见 test 示例 `@Observed class Name { @Publish var title }`） |
| `@StorageLink` / `@StorageProp` | `cj_app_storage_define.cj` | 与 AppStorage 双向/单向同步 |
| `@LocalStorageLink` / `@LocalStorageProp` | `cj_local_storage_define.cj` | 与 LocalStorage 同步 |

### 类/结构装饰宏

| 宏 | 定义文件 | 说明 |
| --- | --- | --- |
| `@Entry` / `@Entry(attr)` | `cj_entry_define.cj` | 页面入口组件 |
| `@Component` | `cj_component_define.cj` | 自定义组件 |
| `@Reusable` | `cj_reusable_define.cj` | 可复用组件 |
| `@Observed` | `cj_observed_define.cj` | 可观察 class |
| `@Preview` | `cj_entry_define.cj` | 预览 |
| `@HybridComponentEntry` | `cj_entry_define.cj` | 混合开发入口 |
| `@CustomDialog` | `cj_customdialog_define.cj` | 自定义弹窗 |
| `@Builder` | `cj_builder_define.cj` | 构造函数（UI 片段） |
| `@BuilderParam` | `cj_builder_param_define.cj` | 组件的 builder 参数 |
| `@Binder` | `cj_binder_define.cj` | 绑定器 |

### 资源宏

| 宏 | 定义文件 | 说明 |
| --- | --- | --- |
| `@r(...)` | `cj_resource_define.cj` | 资源引用，如 `@r(app.string.xxx)` |
| `@rawfile(...)` | `cj_resource_define.cj` | rawfile 资源引用 |

> 注意：本仓**未提供** `@ObjectLink`、`@Extend`、`@Styles` 宏；`@Observed` class 的嵌套观察依赖 `@Publish`。README_zh.md 明确状态管理 V2 暂不支持。

## 2. 用法示例（来自 `test/CJButtonAndSelection/.../view_button.cj`，可编译）

```cangjie
import ohos.arkui.state_macro_manage.*

@Observed
class Name {
    @Publish var title: String = "English"
}

@Entry
@Component
class ViewButton {
    @Watch[onChanged]
    @State
    var name: Name = Name(title: "myBook")

    func onChanged() {}

    @State
    var isOn: Bool = false

    func build() {
        Flex() {
            Button(@r(app.string.button_label))
            Text(this.name.title)
        }
    }
}
```

## 3. 宏实现要点（改宏前必读）

- 宏包 `state_macro_manage` 会在编译期**改写变量声明**，生成 `stateVarDecl_<name>_<n>_` 形式的混淆标识符（`cj_watch_define.cj` 的 `isMangled` 正则 `^stateVarDecl_[a-zA-Z0-9_]*_$` 可证）。**禁止**在业务代码或文档外引用这些生成名，更不要手动"修复"。
- 宏内的语法检查走 `UISyntaxChecker`（`diag_*.cj` 诊断报告体系），扩展宏校验规则时改 `diag_rules.cj`/`diag_syntax.cj` 而非绕过。
- 修改任何 `cj_*_define.cj` 都影响所有仓颉 UI 代码编译产物，属高风险变更（AGENTS.md §3），需评审并在 PR 中说明影响面。
- `state_management/`（运行时）与 `state_macro_manage/`（宏）职责分离：变量观察/订阅在 `observed_*`、`subscriber_manager.cj`；UI 栈在 `view_stack_processor.cj`。改状态行为通常两处联动。
