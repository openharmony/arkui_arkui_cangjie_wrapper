# FFI 桥接知识库（FFI Bridge Knowledge Base）

> 本文所有结论均可由本仓源码与 `//build/templates/cangjie/` 构建模板核对。

## 1. FFI 相关代码分布在三个仓库（重要）

| 仓库 | 角色 | 关键位置 |
| --- | --- | --- |
| **本仓** `arkui_arkui_cangjie_wrapper` | 仓颉侧 FFI **声明**与封装 | 各组件 `<name>.cj` 的 `foreign {}` 块；`ohos/arkui/component/native_struct/` 的 `@C` 结构体；`ohos/base/callback_type.cj` 回调类型 |
| **`arkui_ace_engine`**（interface/C++ 实现仓） | C++ 侧 FFI **实现**（引擎对接） | `cj_frontend_ohos` 模块（见组件 `BUILD.gn` 的 `external_deps = ["ace_engine:cj_frontend_ohos"]`）；实现本仓声明的全部 `FfiOHOSAceFramework*` 函数与 C++ 侧同名 `@C` 结构体 |
| **`arkcompiler_cangjie_ark_interop`**（SIG 仓） | FFI/互操作**基础库与文档** | 提供 `ohos.ffi`（`RemoteData`/`RemoteDataLite`/`Callback0Param..Callback4Param`/`BaseCallBack`/`FFIData`/`FFIDataManager`/`CArrString`/`CArrFloat32`/`releaseFFIData` 等）、`ohos.labels.APILevel`、`ohos.business_exception`；API Reference 与 Dev Guide 位于其 `doc/` 目录 |

任何 FFI 签名/结构体布局改动都是**跨仓变更**：仓颉侧声明与 ace_engine C++ 侧实现必须同 PR 节奏对齐（先对齐设计，再分别提 PR 并互相引用），仅改一侧必然导致运行期崩溃或链接错误。

## 2. 仓颉侧 FFI 声明模式

以 `ohos/arkui/component/button/button.cj` 为准：

```cangjie
foreign {
    func FfiOHOSAceFrameworkButtonCreateWithLabel(content: CString): Unit
    func FfiOHOSAceFrameworkButtonSetFontSize(size: Float64, unit: Int32): Unit
    func FfiOHOSAceFrameworkButtonSetAllBorderRadius(value: CJBorderRadius): Unit
}

@C
struct CJLabelStyle {
    CJLabelStyle(let overflow: Int32, let maxLines: UInt32, /* ...字段顺序即 C ABI 布局 */) {}
}
```

命名规则：`FfiOHOSAceFramework` + 组件名 + 动作（Create/Set/Reset...）。创建类函数多为 `Create.../CreateWith.../CreateWith...AndOptions(option: XxxOptional)`。

## 3. 类型映射表（仓颉 ↔ C/C++）

> 以 `ohos.ffi` 与既有双侧签名为准；下表覆盖本仓已用类型。

| 仓颉类型 | C/C++ 类型 | 说明 |
| --- | --- | --- |
| `Bool` | `bool` | |
| `Int8/Int16/Int32/Int64` | `int8_t/int16_t/int32_t/int64_t` | |
| `UInt8/UInt16/UInt32/UInt64` | `uint8_t/uint16_t/uint32_t/uint64_t` | |
| `Float32/Float64` | `float/double` | |
| `IntNative` | 与平台位宽一致（64 位平台同 `int64_t`/`ssize_t`）；**C++ 侧 `size_t`、`ptrdiff_t`、`ssize_t` 对应仓颉 `IntNative`** | 例：`FfiOHOSAceFrameworkComponentIdSendEventByKey(id: CString, action: IntNative, params: CString)`；`native_view.cj`/`native_web.cj` 中 `size: IntNative` 对 C++ 侧 `size_t` |
| `CString` | `const char*` | 字符串入参 |
| `CArray<T>` / `CArrString` / `CArrFloat32` | `T[]` / 字符串数组 / float 数组（`ohos.ffi` 提供） | 见 `relative_container.cj`、`web.cj`、`component_utils` |
| `@C struct` | 同布局 POD struct | 字段**顺序、类型、个数**必须完全一致 |
| `Unit` | `void` | |
| `RemoteData` / `RemoteDataLite` | 引擎侧句柄/对象包装 | 由 `ohos.ffi` 提供，配合 `releaseFFIData` 释放 |
| `Callback0Param..Callback4Param`、`BaseCallBack` | C++ 注册进来的回调对象 | 由 `ohos.ffi` 提供 |

## 4. 回调与数据生命周期

- 事件回调统一走 `ohos.ffi` 的 `CallbackNParam`/`BaseCallBack`；引擎持有回调对象，仓颉侧经 `FFIDataManager` 登记（`custom_view.cj`、`cj_navigation.cj`）。
- 仓颉侧创建并交给 C++ 的 `RemoteData`/`RemoteDataLite`，不再使用时必须调用 `releaseFFIData`，否则内存泄漏（canvas/text/swiper 等组件均有此模式）。

## 5. 修改 FFI 的工作流

1. 在本仓找到既有同类签名作模板（同组件或相近组件）。
2. 使用 skill `cangjie-ffi-signature-sync` 校验类型映射与命名。
3. `@C` 结构体改动：双侧字段逐一对齐（顺序不可变；只允许尾部追加新字段并同步 ace_engine）。
4. 编译验证（命令见 `docs/build/Build_Guide.md`）。
5. 跨仓改动在 PR 描述中注明对应 ace_engine PR 链接。

## 6. 错误处理与 DFX

- **异常模型**：参数校验失败/内部错误统一抛 `BusinessException(errCode, msg)`（类型来自 `cangjie_ark_interop` 的 `ohos.business_exception`）。仓内既有错误码：`100001`（Internal error / 内存分配失败）、`190002`（The callback function is invalid.，回调失效，见 `cj_lambda_invoker_impl.cj`）、`10905304`（Missing @Provide property，见 `custom_component/custom_view.cj`）。新增错误码必须与 ArkTS 侧 API 文档错误码对齐，不得自造。
- **日志**：`ohos/arkui/component/common/ace_log.cj` 定义 `ACE_LOG = HilogChannel(1, 0xD003902, "Cangjie-Ace")`（`ohos.hilog` 来自 `hiviewdfx_cangjie_wrapper`）。打印 UI 框架日志统一走该通道，勿自建 HilogChannel。
- **宏诊断**：`state_macro_manage/diag_*.cj`（diag_parser/diag_rules/diag_syntax 等）是**编译期**宏展开报错体系（`UISyntaxChecker`），错误在编译时呈现给开发者，不属于运行期异常路径；扩展校验规则改 `diag_rules.cj`/`diag_syntax.cj`。
