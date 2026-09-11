# 构建指南（Build Guide）

> 命令在 OpenHarmony 全量源码树根目录执行；本仓在树中的位置为 `foundation/arkui/arkui_cangjie_wrapper`（见 `bundle.json` `segment.destPath`）。
> **能力边界（重要）**：仓颉相关编译验证只有**全量仓颉 SDK 构建**一条路径，**不支持单仓、单模块、kit 单独编译**。本仓 `BUILD.gn` 中定义的各单模块 target 仅作为构建依赖图/门禁使用，不可作为验证命令。

## 1. 构建目标（targets）

| 目标 | 定义位置 | 用途 |
| --- | --- | --- |
| `arkui_cangjie_wrapper_package` | 根 `BUILD.gn`（group） | 本仓核心模块聚合目标，经 `bundle.json` `sub_component` 参与部件构建；**不可用 `--build-target` 单独编译** |
| `kit.ArkUI` | `kit/ArkUI/BUILD.gn` | ArkUI Kit 导出包，随全量构建编译；**不可单独编译** |
| `ohos.<module>`（如 `ohos.arkui.component.button`） | 各目录 `BUILD.gn` 中 `ohos_cangjie_shared_library(<name>)` | 依赖图/门禁目标；**不可单独编译** |
| `copy_sdk_arkui_cangjie_libs` / `copy_sdk_arkui_cangjie_libs_kit` | 根 `BUILD.gn`（`copy_ohos_cangjie_sdk_api_lib`） | SDK 产物收集（`bundle.json` `inner_kits`） |

新增组件模块需要在**两处**注册：组件目录自身 `BUILD.gn` + 根 `BUILD.gn` 的 `arkui_cangjie_wrapper_packages_ohos` 列表（否则 SDK 收集不到，见 `docs/components/Component_Development_Guide.md`）。

## 2. 验证命令（全量仓颉 SDK）

```bash
# 仓颉 SDK 全量编译（本仓改动的标准验证命令，参数勿改）
./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie --gn-args sdk_build_cangjie=true
```

- **必须全量**：仓颉 SDK 编译不具备单仓/单模块/kit 单独编译能力。`--build-target arkui_cangjie_wrapper_package`、`--build-target ohos.arkui.component.button`、`--build-target kit.ArkUI` 等快捷命令历史上曾误载于文档，**均不可用**。
- 本仓依赖 `cangjie_ark_interop`、`ace_engine` 等部件（`bundle.json` `deps.components`），必须在全量源码树中构建，不能独立于源码树单独编译。
- 常规设备镜像全量构建（如 `./build.sh --product-name rk3568`）会经 `sub_component` 编到本仓目标，但代理的改动验证统一走上面的仓颉 SDK 全量命令。

## 3. 产物位置

由 `//build/templates/cangjie/cj_compiler.gni` 决定：

- 编译产物：`out/<product>/cangjie_libraries/<目标名首段>/`，例如 `out/ohos-sdk/cangjie_libraries/ohos/libohos.arkui.component.button.so` 与 `ohos.arkui.component.button.cjo`（`.cjo` 与 `.so` 同名成对生成）。
- 设备镜像安装：`dylib/exe` 安装进系统镜像 `/system/lib64/platformsdk/cjsdk`（arm32 为 `/system/lib/platformsdk/cjsdk`），见模板中 `relative_install_dir = "platformsdk/cjsdk"`。
- SDK 收集：`copy_ohos_cangjie_sdk_api_lib` 依据根 `BUILD.gn` 中 `arkui_cangjie_wrapper_packages_ohos`（so+cjo 清单）与 `arkui_cangjie_wrapper_packages_kit`（kit 包）执行。
- 测试目标（`ohos_cangjie_unittest`）输出到 `out/<product>/tests/unittest/<subsystem>/<part>/`。

## 4. 常见构建问题排查

| 现象 | 排查 |
| --- | --- |
| `--build-target <单仓/单模块/kit>` 失败或无此类目标 | **预期行为**：仓颉构建不支持，改用 §2 全量仓颉 SDK 命令 |
| 找不到 `ohos.base` 等 import | `cj_deps`/`cj_external_deps` 缺项，对照 `ohos/arkui/component/button/BUILD.gn` 的标准四项：`ohos.base`、`component/common`、`component/native_struct`、`component/util`，外部依赖 `cangjie_ark_interop:ohos.ffi / ohos.labels / ohos.business_exception`、`global_cangjie_wrapper:ohos.resource` |
| 新组件编译过但不在 SDK 产物里 | 忘了在根 `BUILD.gn` `arkui_cangjie_wrapper_packages_ohos` 注册 |
| 宏包报错 | `state_macro_manage` 是 `macro package`，改动后需清理重建；编译参数保持 `cjc_args = ["--no-sub-pkg"]` |
| `--no-undefined` 链接错误 | FFI 符号在 C++ 侧不存在：签名双侧不一致，见 `docs/ffi/FFI_Bridge_Knowledge_Base.md` |
