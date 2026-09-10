# 仓颉 ArkUI 封装架构（Cangjie Wrapper Architecture）

> 信息来源：`README_zh.md`、`bundle.json`、各 `BUILD.gn` 与源码目录实际结构（可在本仓直接核对）。

## 1. 定位

`arkui_cangjie_wrapper` 是 ArkUI 开发框架的**仓颉声明式 UI 前端**，让开发者用仓颉语言开发 standard 设备应用 UI。能力包括：UI 组件、UI 上下文、状态管理宏、动画、绘制、交互事件。API 处于 **Beta** 阶段。

## 2. 分层架构

```
┌─────────────────────────────────────────────────────┐
│ 接口层（面向应用开发者，仓颉 API）                      │
│  UI 组件声明 / UI 上下文声明 / 状态管理宏              │
├─────────────────────────────────────────────────────┤
│ 框架层（本仓实现，ohos/ 目录）                         │
│  UI 组件封装（component/*）  UI 上下文封装（ui_context）│
│  状态管理运行时（state_management + state_macro_manage）│
├─────────────────────────────────────────────────────┤
│ FFI 层（跨语言边界）                                   │
│  仓颉侧：foreign 声明 + @C 结构体（本仓）              │
│  C++ 侧：FfiOHOSAceFramework* 实现（arkui_ace_engine）│
│  基础库：ohos.ffi / ohos.labels（cangjie_ark_interop）│
├─────────────────────────────────────────────────────┤
│ ArkUI 引擎（ace_engine，NG 节点树/渲染）               │
└─────────────────────────────────────────────────────┘
```

- **接口层**：`kit/ArkUI/index.cj` 汇总导出（`public import ohos.arkui.component.*` 等），是 SDK/API 面向开发者的稳定边界。
- **框架层**：组件封装实现在 `ohos/arkui/component/<name>/`；状态管理由宏（`state_macro_manage`，编译期展开）+ 运行时（`state_management`）组成；UI 上下文在 `ohos/arkui/ui_context/`。
- **FFI 层**：每个组件在 `<name>.cj` 中用 `foreign {}` 块声明 `FfiOHOSAceFramework<Component><Action>` 函数；复杂参数用 `@C` 结构体（组件本地 `@C struct XxxOptional` 或 `component/native_struct/` 共享结构体）。详见 `docs/ffi/FFI_Bridge_Knowledge_Base.md`。

## 3. 目录职责（与 README_zh.md §目录一致，含实现细节）

```
arkui_cangjie_wrapper/
├── figures/                       # README 架构图
├── kit/ArkUI/                     # ArkUI Kit 化接口导出（index.cj）
├── ohos/                          # 仓颉 ArkUI 框架实现
│   ├── ohos.cj / BUILD.gn         # 顶层包 ohos
│   ├── arkui/
│   │   ├── arkui.cj / BUILD.gn
│   │   ├── component/             # ~80 个组件目录（text/button/flex/canvas/navigation/...）
│   │   │   ├── common/            # CommonMethod/CommonComponent 基类、通用枚举 cj_enum.cj
│   │   │   ├── native_struct/     # 跨 FFI 的 @C 共享结构体（native_view.cj 等）
│   │   │   ├── util/              # 资源/长度转换工具（cj_util.cj）
│   │   │   └── <name>/            # 单组件：<name>.cj + <name>_attr.cj + BUILD.gn
│   │   ├── component_utils/       # 组件工具（cj_component_utils.cj）
│   │   ├── shape/                 # 图形绘制（circle/ellipse/path/rect/shape_base）
│   │   ├── state_macro_manage/    # 状态管理宏定义（宏包 macro package）
│   │   ├── state_management/      # 状态管理运行时（observed_*、storage、view_stack_processor）
│   │   └── ui_context/            # UIContext（router/prompt_action/animator/font/measure）
│   ├── base/                      # 基础类型（length/color/resource/callback_type...）
│   └── curves/                    # 动画曲线 cj_curves.cj
├── test/CJ*/                      # 设备侧测试套件（DevEco 工程）
├── BUILD.gn                       # 目标注册表
└── bundle.json                    # 部件元数据（subsystem=arkui, part=arkui_cangjie_wrapper）
```

## 4. 上下游依赖（bundle.json `deps.components`）

| 依赖仓 | 用途 |
| --- | --- |
| `cangjie_ark_interop` | FFI 基础库 `ohos.ffi`、API 等级 `ohos.labels.APILevel`、`ohos.business_exception`；API 文档与开发指南 |
| `ace_engine` | C++ 侧 FFI 实现（`cj_frontend_ohos`，见组件 BUILD.gn `external_deps`）与 UI 引擎 |
| `hiviewdfx_cangjie_wrapper` | Hilog 日志 |
| `global_cangjie_wrapper` | 资源管理（`ohos.resource`，组件 `cj_external_deps`） |
| `multimedia_cangjie_wrapper` | Image 组件图像能力 |
| `arkweb_cangjie_wrapper` | Web 组件 |
| `access_token` | 授权与鉴权 |
| `startup_cangjie_wrapper` | 启动能力 |

## 5. 关键设计约束（摘要，完整版见 AGENTS.md §3）

1. 组件对外 API = `sealed interface XxxAttribute <: CommonMethod<XxxAttribute>`，属性方法参数为 `?T`，返回自身以链式调用。
2. FFI 函数命名 `FfiOHOSAceFramework<Component><Action>`，双侧签名必须一致。
3. 宏（`state_macro_manage`）在编译期展开并改写变量声明（生成 `stateVarDecl_*_` 混淆名），不要手改展开结果。
4. 新公共包必须注册进根 `BUILD.gn` 的 `arkui_cangjie_wrapper_packages_ohos` 并同步 `kit/ArkUI/index.cj`。
