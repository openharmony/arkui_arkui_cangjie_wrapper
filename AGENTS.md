# AGENTS.md — arkui_arkui_cangjie_wrapper 编码代理指引

## 1. 适用范围与职责

- 本文件适用于 `foundation/arkui/arkui_cangjie_wrapper` 仓库全部内容（本地克隆根目录即本文件所在目录）。
- 本仓职责：ArkUI 开发框架的仓颉封装（Cangjie Declarative UI Frontend），提供 UI 组件、UI 上下文、状态管理宏、仓颉-C FFI 接口声明。仅支持 standard 设备，**仓颉 API 处于 Beta 阶段**（见各源文件头注释与 README）。
- 本仓不含 C++ FFI 实现。C++ 侧实现在 `arkui_ace_engine` 仓（`cj_frontend_ohos` 模块），FFI 基础库与 API 文档在 `arkcompiler_cangjie_ark_interop` 仓。跨仓改动规则见 §3。
- 嵌套指引（优先级高于本文件的通用规则时，以其为准）：
  - `.claude/skills/cangjie-component-api-design/` — 新增/修改组件 API 时使用
  - `.claude/skills/cangjie-ffi-signature-sync/` — 改任何 `foreign` 函数或 `@C` 结构体时使用
  - `docs/README.md` — 知识库总索引与路由表

## 2. 代码地图

| 路径 | 职责 | 风险/频率 |
| --- | --- | --- |
| `ohos/arkui/component/<name>/` | 约 80 个 UI 组件目录，每个含 `<name>.cj`（枚举、Options、`foreign` FFI 声明）、`<name>_attr.cj`（`sealed interface <Name>Attribute <: CommonMethod<...>`）、`BUILD.gn` | 高频修改；新增组件须走完整模式 |
| `ohos/arkui/component/common/` | `CommonMethod`/`CommonComponent` 基类、通用枚举 `cj_enum.cj`、`cj_view_base.cj` 视图基类 | **高风险**：影响所有组件 |
| `ohos/arkui/component/native_struct/` | 跨 FFI 边界的 `@C` 结构体（`CJBorder`、`CJLabelStyle`、`native_view.cj` 等） | **高风险**：字段顺序即内存布局，双侧必须一致 |
| `ohos/arkui/state_macro_manage/` | `@State/@Prop/@Link/@Watch/...` 等全部宏定义（宏展开逻辑） | **高风险**：宏实现改动影响所有仓颉 UI 代码 |
| `ohos/arkui/state_management/` | 状态管理运行时（observed_*、subscriber_manager、view_stack_processor 等） | 高风险 |
| `ohos/arkui/ui_context/` | UIContext：路由 `cj_router.cj`、弹窗 `cj_prompt_action.cj`、动画 `cj_animator.cj`、字体 `cj_font.cj`、测量 `cj_measure.cj` | 中 |
| `ohos/base/` | 基础类型（`Length`、`ResourceColor`、`Resource`、回调类型等） | **公共 API**，`inner_kits` 之一 |
| `ohos/curves/`、`ohos/arkui/component_utils/`、`ohos/arkui/shape/` | 曲线、组件工具、图形绘制 | 中 |
| `kit/ArkUI/index.cj` | ArkUI Kit 对外导出清单（`public import` 列表） | 新增公共包必须同步，否则 SDK 缺失 |
| `BUILD.gn`（根） | 目标注册表：`arkui_cangjie_wrapper_package` group 与 `arkui_cangjie_wrapper_packages_ohos` 列表 | 新增组件必须注册，否则不进 SDK 拷贝 |
| `bundle.json` | 部件元数据：依赖、`sub_component`、`inner_kits` | 依赖变更需评审 |
| `test/CJ*/` | 设备侧测试套件（DevEco 工程 + `build.py`），按组件族分组 | 只读为主，见 `docs/testing/Testing_Guide.md` |
| `.gitee/` | PR 模板等社区配置 | 不要动 |

### 任务 → 先看哪里

| 任务类型 | 先读（只读标注章节，勿通读全文） | 再看 |
| --- | --- | --- |
| 新增组件 / 组件 API | `docs/components/Component_Development_Guide.md` §2-§4（模板节） | skill `cangjie-component-api-design`、参照 `ohos/arkui/component/button/` |
| 改 FFI 签名 / `@C` 结构体 | `docs/ffi/FFI_Bridge_Knowledge_Base.md` §3（类型映射表）、§6（错误码） | skill `cangjie-ffi-signature-sync` |
| 状态管理宏 / `@State` 系列行为 | `docs/state_management/State_Management_Guide.md` §1（宏清单）、§3（实现要点） | `ohos/arkui/state_macro_manage/` 对应 `cj_*_define.cj` |
| 构建失败 / 找不到产物 | `docs/build/Build_Guide.md` §2-§3（命令与产物） | `docs/expert/Expert_Knowledge.md` §4（症状→根因） |
| 路由/弹窗/动画等 UIContext | `docs/architecture/Cangjie_Wrapper_Architecture.md` §3（目录职责） | `ohos/arkui/ui_context/*.cj` |
| 设备测试如何跑 | `docs/testing/Testing_Guide.md` §2（构建/运行方式） | `test/<套件>/build.py` |
| 疑难排查 / 踩坑经验 / 实现惯用法 | `docs/expert/Expert_Knowledge.md` §2（惯用法）、§4（症状→根因） | 对应专题指南 |

## 3. 约束与边界

**禁止（Do not）：**

1. 不要只改 FFI 的一侧。`foreign {}` 仓颉声明、`@C` 结构体字段顺序/类型必须与 `arkui_ace_engine` 中 C++ 实现（`cj_frontend_ohos`）逐一对应；`native_struct/` 下 `@C` 结构体字段顺序即 C ABI 内存布局，不得重排、增删字段而不做双侧同步。
2. 不要破坏公共 API 兼容性：`sealed interface <Name>Attribute`、`CommonMethod<T>`、`ohos/base` 类型、`kit/ArkUI/index.cj` 导出清单、`bundle.json` `inner_kits` 的任何签名/语义变更，必须先升级评审（`@!APILevel[since]` 不可回退）。
3. 不要手写或"修复"宏展开后的代码形态（如 `stateVarDecl_xxx_` 混淆名），那是 `state_macro_manage` 生成物；改宏请改 `cj_*_define.cj` 源。
4. 不要在 `cj_enum.cj` 或公共枚举里随手新增枚举值——影响所有组件与跨版本兼容，需评审。
5. 不要改各组件 `BUILD.gn` 的 `cjc_args = ["--no-sub-pkg"]`、`subsystem_name = "arkui"`、`part_name = "arkui_cangjie_wrapper"` 约定。
6. 不要修改 `test/CJ*/` 下 DevEco 工程配置（`build-profile.json5`、`hvigorfile.ts` 等）来"修复"编译问题；它们对应设备侧测试框架。
7. 不要提交缺少 Apache-2.0 License 头的源文件（对照现有文件头）。
8. 不要执行删除 `out/`、`git push --force` 等破坏性命令；不在代理环境尝试真机刷机/安装。

**先问再改（Ask before）：**

- 新增/删除/重命名公共枚举值、`@!APILevel` 版本号调整。
- `bundle.json` 依赖（components）增删；`BUILD.gn` 新增 `cj_deps`/`cj_external_deps` 引入新部件或第三方库前，先确认部件归属与 license 兼容性（Apache-2.0）。
- 修改 `ohos/arkui/state_macro_manage/` 宏展开行为。
- 任何同时触及本仓与 `arkui_ace_engine` 的跨仓改动（两侧 PR 互相引用）。

**领域不变式：**

- 组件属性方法参数统一用仓颉 `Option` 风格 `?T`，返回 `XxxAttribute` 以支持链式调用；`None` 表示"不设置/用默认"。
- 新建组件包必须：目录内 `BUILD.gn` 用 `ohos_cangjie_shared_library`，并在根 `BUILD.gn` 的 `arkui_cangjie_wrapper_packages_ohos` 列表注册（否则 SDK 拷贝 `copy_sdk_arkui_cangjie_libs` 收集不到）。
- 对外导出变更需同步 `kit/ArkUI/index.cj`。

## 4. 知识路由（进入编辑前必须执行）

先声明三件事，再动代码：**任务类别**（上表 7 类之一）、**已读文档**、**发现的约束**（引用本节条款号）。

**最小阅读路径（效率规则）**：只读任务表"先读"列标注的**具体章节**，禁止为修改类任务通读整份指南或全库检索——读知识有时间/token 成本，先按模板/映射表动手，遇到未知术语再按下方词汇路由精准补查。

- **按任务**：新增组件→组件指南+skill；FFI→FFI 指南+skill；状态管理→状态管理指南；构建→构建指南。
- **按路径**：改 `common/`、`native_struct/`、`state_macro_manage/` 任一目录 → 属高风险区，额外在最终报告中列出影响面。
- **按词汇**：任务描述/issue/日志出现下列术语时，按指引加载文档：
  - `LLT` / `设备测试` → `docs/testing/Testing_Guide.md`
  - `cjo` / `cangjie_libraries` / `cjsdk` → `docs/build/Build_Guide.md`
  - `FFI` / `FfiOHOSAceFramework*` / `RemoteData` / `Callback*Param` → `docs/ffi/FFI_Bridge_Knowledge_Base.md`
  - `@!APILevel` / `syscap` / `API 22` → 公共 API 约束（§3.2），API 文档在 `arkcompiler_cangjie_ark_interop` 仓 `doc/` 目录
  - `@State`/`@Prop`/`@Link`/`@Watch`/`@Provide`/`@Consume`/`@Observed`/`@Publish`/`@Reusable`/`@StorageLink` 等 → `docs/state_management/State_Management_Guide.md`
  - `interface 仓` / `interop` / `ohos.ffi` / `ohos.labels` → `docs/ffi/FFI_Bridge_Knowledge_Base.md` §关联仓库
  - `diag_*` / `UISyntaxChecker` / 宏诊断报错 → `docs/state_management/State_Management_Guide.md` §3；`BusinessException` / `errorCode` / `Hilog` / 日志 → `docs/ffi/FFI_Bridge_Knowledge_Base.md` §错误处理与 DFX
  - `getValue()` / `LibC.mallocCString` / `asResource` / `transAppResource*` / `stateVarDecl` / 症状排查（崩溃/不刷新/缺产物） → `docs/expert/Expert_Knowledge.md`

## 5. 验证闭环

在 OpenHarmony 全量源码树根（本仓位于 `foundation/arkui/arkui_cangjie_wrapper`）执行：

```bash
# 仓颉 SDK 全量编译（本仓改动的标准验证命令，参数勿改）
./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie --gn-args sdk_build_cangjie=true
```

- **能力边界**：仓颉构建**不支持单仓、单模块、kit 单独编译**。不要使用 `--build-target arkui_cangjie_wrapper_package`、`--build-target ohos.arkui.component.button`、`--build-target kit.ArkUI` 之类的快捷命令；`BUILD.gn` 中的单模块 target 仅作为构建依赖图/门禁使用。
- 产物：`out/<product>/cangjie_libraries/<目标名首段>/` 下的 `lib<target>.so` 与 `<target>.cjo` 成对生成（仓颉 SDK 构建时 product 为 `ohos-sdk`；规则由构建系统 `//build/templates/cangjie/` 决定，勿凭记忆改写）；设备镜像构建时 `.so` 安装到 `/system/lib64/platformsdk/cjsdk`（32 位为 lib）。
- 本仓无主机侧单测（`bundle.json` 的 `test` 列表为空）；行为验证依赖 `test/CJ*` 设备侧套件（需 DevEco 环境，见 `docs/testing/Testing_Guide.md`）。代理默认**只做编译验证**，设备测试在报告中注明"未执行"。
- 完成定义（Done）：改动通过上述命令编译零报错 + 已按 §3 自查未触碰禁止项 + 报告写明。
- 最终报告必须包含：改动文件清单、使用的编译命令与结果、影响面声明（若触及高风险目录）、未验证项及原因。
- 无法编译验证时（如本机无 OpenHarmony 全量源码树）：明确说明"未编译"，给出建议验证者执行的命令，不要声称"已验证"。

## 6. 知识库文件索引

全部位于 `docs/`：`architecture/`、`ffi/`、`build/`、`components/`、`state_management/`、`testing/`、`expert/`，机器可读索引见 `docs/knowledge_base_INDEX.json`，人读索引见 `docs/README.md`。
