---
name: cangjie-ffi-signature-sync
description: Use when changing any foreign function declaration, @C struct, or callback signature in arkui_arkui_cangjie_wrapper. Verifies Cangjie/C++ type consistency across the FFI boundary (this repo declares, arkui_ace_engine implements, cangjie_ark_interop provides the base library).
metadata:
  author: openharmony
  scope: repo
  stage: design
  domain: arkui
  capability: ffi-signature-sync
  version: 1.1.0
  status: stable
---

# FFI 签名同步（arkui_cangjie_wrapper）

本仓是仓颉侧 FFI **声明方**；C++ 实现在 `arkui_ace_engine`（`cj_frontend_ohos` 模块，interface/实现仓）；`ohos.ffi` 基础类型来自 `cangjie_ark_interop`。改任何一侧签名前，先读 `docs/ffi/FFI_Bridge_Knowledge_Base.md`。

## 核心规则

1. **双侧一致**：`foreign {}` 声明与 C++ 实现、`@C` struct 与 C++ POD struct，必须逐字段一致（顺序、类型、个数）。只允许尾部追加字段。
2. **命名**：`FfiOHOSAceFramework<Name><Action>`；动作用 Create/Set/Reset 等，与既有组件保持一致。
3. **Option 不跨界**：`?T` 参数在仓颉侧转成 `@C` struct 平铺字段或哨兵编码后过桥。
4. **生命周期**：交给 C++ 的 `RemoteData`/`RemoteDataLite` 需配套 `releaseFFIData`；回调用 `ohos.ffi` 的 `Callback0Param..Callback4Param`/`BaseCallBack`。

## 类型映射校验表（逐参数核对）

| Cangjie Type | C++ Type | Notes |
| --- | --- | --- |
| Bool | bool | |
| Int8 / Int16 / Int32 / Int64 | int8_t / int16_t / int32_t / int64_t | |
| UInt8 / UInt16 / UInt32 / UInt64 | uint8_t / uint16_t / uint32_t / uint64_t | |
| Float32 / Float64 | float / double | |
| **IntNative** | 与平台位宽一致（64 位平台等同 int64_t / ssize_t）；**C++ `size_t` / `ptrdiff_t` / `ssize_t` 一律映射为仓颉 `IntNative`** | 本仓实例：`native_view.cj` / `native_web.cj` 中 `size: IntNative` 对 C++ `size_t`；`cj_component_id.cj` 的 `action: IntNative`。**新增签名遇到 size_t 系列时禁止用 Int32/Int64 硬编码，必须用 IntNative** |
| CString | const char* | |
| CArray\<T\> / CArrString / CArrFloat32 | T[] / 字符串数组 / float 数组 | `ohos.ffi` 提供 |
| @C struct | 同布局 POD struct | |
| Unit | void | |
| RemoteData / RemoteDataLite | 引擎句柄包装 | 配合 releaseFFIData |
| CallbackNParam / BaseCallBack | C++ 回调对象 | `ohos.ffi` 提供 |

## 工作流

1. 找同组件/相近组件既有签名作模板。
2. 用上表逐参数核对仓颉侧与 C++ 侧（C++ 侧在 ace_engine 仓检索同名函数）。
3. `@C` struct 改动仅限尾部追加并双侧同步。
4. 编译验证（全量仓颉 SDK，不支持单仓/单模块/kit 单独编译）：`./build.sh --product-name ohos-sdk --ccache --build-target out/sdk/gen/build/ohos/sdk:cangjie --gn-args sdk_build_cangjie=true`。
5. 跨仓改动：本仓与 ace_engine 分别提 PR，描述中互相引用链接；PR 描述注明影响组件清单。

## 自检清单

- [ ] 每个参数类型已按映射表核对（尤其 size_t → IntNative）
- [ ] @C struct 字段顺序未变，仅尾部追加
- [ ] 双侧命名与参数个数一致
- [ ] RemoteData/回调的生命周期处理齐备
- [ ] 编译通过 + 跨仓 PR 关联已写明
