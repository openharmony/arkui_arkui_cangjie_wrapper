# 专家经验库（Expert Knowledge）

> 定位：**症状导向的排查经验与实现惯用法**，与各指南的"事实描述"互补——指南告诉你"是什么"，本文告诉你"踩过什么坑、怎么快速定位"。全部条目取自本仓真实代码与上游构建模板，可溯源。重复的基础事实以引用指南为准，不重复维护。

## 1. 组件 FFI 属性扩展全链路（修改类任务标准路径）

以 Button 扩展一个属性为例，六步缺一不可（对照 `ohos/arkui/component/button/`）：

1. **attr 接口声明**（`button_attr.cj`）：`sealed interface ButtonAttribute <: CommonMethod<ButtonAttribute>` 中加方法，参数 `?T`，**声明处返回接口类型** `ButtonAttribute`，附 doc 注释 + `@!APILevel`。
2. **类实现**（`button.cj`）：`public class Button <: CommonMethodComponent<Button> & ButtonAttribute` 中实现同名方法，**实现处返回 `This`**（不是接口名），返回 `this` 支持链式。
3. **Option 拆包**：`if (let Some(v) <- value) { ... } else { Reset }`——`None` 通常不是"用默认值"而是"重置/不设置"（见 fontSize：None → `FfiOHOSAceFrameworkButtonResetFontSize()`）；需要默认值兜底时用 `value ?? Default`（fontWeight → `FontWeight.W500`、fontColor → `Color(0xFFFFFF)`）。
4. **FFI 调用**：所有 foreign 调用包在 `unsafe { }` 中；enum 参数先编码：`(tmpOptions.shape ?? ButtonType.Capsule).getValue()`。
5. **foreign 声明 + C++ 侧同步**：命名 `FfiOHOSAceFrameworkButton<Action>`，C++ 实现在 `arkui_ace_engine:cj_frontend_ohos`，双侧一致（见 `docs/ffi/FFI_Bridge_Knowledge_Base.md`）。
6. **验证**：全量仓颉 SDK 编译（命令见 `docs/build/Build_Guide.md` §2）+ 设备测试（见 §4 速查表与 `docs/testing/Testing_Guide.md`）。

## 2. 仓颉侧实现惯用法（从真实代码提炼）

| 惯用法 | 说明 | 实例 |
| --- | --- | --- |
| enum → Int32 编码 | 每个**对外 enum 必带** `getValue(): Int32`（`match` + 兜底 `throw BusinessException(100001, "Internal error.")`），FFI 只认 Int32 | `button.cj` ButtonStyleMode.getValue |
| Options 类默认值 | `public init(shape!: ?ButtonType = None, ...)` 构造器内 `this.shape = shape ?? ButtonType.Capsule` 逐字段兜底 | `button.cj` ButtonOptions |
| CString 生命周期 A | `try (unsafeContent = LibC.mallocCString(s).asResource()) { Ffi(unsafeContent.value) }`——asResource 自动释放，**优先用** | `button.cj` init(label:options:) |
| CString 生命周期 B | `let p = LibC.mallocCString(s); Ffi(p); LibC.free(p)`——手动 free，忘记即泄漏 | `button.cj` fontWeight |
| 无效输入防御 | 非法输入调 Reset 而非 Set：fontSize 中 percent 单位或 `≤0` → `ResetFontSize()` | `button.cj:502-520` |
| 长度/资源转换 | 不手写换算，统一用 `component/util`：`transAppResourceToLength`、`transAppResourceToResourceColor`、`transResourceStrToString`、`getLengthUnitOrFp`、`normalizeValue`、`lessNotEqual`、`LENGTH_PERCENT` | `cj_util.cj` |
| 资源字面量 | 应用资源用 `@r(app.string.xxx)`、rawfile 用 `@rawfile(...)`，不要手拼 ResourceId | `test/CJButtonAndSelection/view_button.cj` |

## 3. 状态管理宏专家经验（宏实现定位与边界）

基础宏清单见 `docs/state_management/State_Management_Guide.md`，此处是**实现级经验**：

- **@Watch 两种书写顺序均合法**：`@Watch["cb"] @State var x` 与 `@State @Watch["cb"] var x`。宏实现靠识别 `stateVarDecl_*_` 混淆名区分先后（`cj_watch_define.cj` 的 `isMangled` 正则 `^stateVarDecl_[a-zA-Z0-9_]*_$`）——判断"某个写法支不支持"先看这里，不要猜。
- **混淆名是生成物**：`stateVarDecl_<name>_<n>_` 出现在报错/产物中是正常现象，不是 bug；禁止手写、禁止在业务代码引用。
- **嵌套对象观察**：`@Observed` class 内用 `@Publish var`（本仓**无 @ObjectLink**），见 `test/CJButtonAndSelection/view_button.cj` 的 `@Observed class Name { @Publish var title }`。
- **宏报错的调试入口**：语法检查在 `UISyntaxChecker`（`diag_syntax.cj`/`diag_rules.cj`），报错经 `diagReport` 输出；宏校验不过时先看 `cj_error_info.cj` 的错误信息构造。
- **宏包边界**：`state_macro_manage` 是 `macro package`（编译期），`state_management` 是运行时；"改状态行为"先分清落点，两处常需联动改。

## 4. 症状 → 根因速查表

| 症状 | 最可能根因 | 处理 |
| --- | --- | --- |
| 编译报找不到 `ohos.base` 等 import | 组件 `BUILD.gn` 的 `cj_deps`/`cj_external_deps` 缺项 | 对照 `button/BUILD.gn` 标准四项 + 外部依赖四项 |
| 链接期 `--no-undefined` 报错 / 设备上符号缺失崩溃 | FFI 双侧签名不一致，或只改了仓颉侧 | `docs/ffi/FFI_Bridge_Knowledge_Base.md` §5 工作流，双侧逐参数核对 |
| 新组件编译过但不在 SDK 产物里 | 根 `BUILD.gn` 的 `arkui_cangjie_wrapper_packages_ohos` 未注册 | 注册后走全量仓颉 SDK 构建（`docs/build/Build_Guide.md` §2） |
| 找不到 `.so`/`.cjo` | 产物在 `out/<product>/cangjie_libraries/<目标名首段>/`，且 `.so`/`.cjo` 成对生成 | `docs/build/Build_Guide.md` §3 |
| 宏展开期报错 | 宏语法检查不通过 | 查 `UISyntaxChecker` 规则；确认写法有官方示例支撑 |
| 设备运行内存持续增长 | `RemoteData`/`RemoteDataLite` 未调 `releaseFFIData`，或 CString 走了 B 写法漏 `LibC.free` | FF KB §4 + 本文 §2 |
| 设备运行期 FFI 崩溃 | `@C` struct 字段顺序/类型与 C++ 侧不一致 | 逐字段比对双侧结构体 |
| 状态变了 UI 不刷新 | 变量未用状态宏修饰；`@Observed` 类内变量漏 `@Publish` | 状态管理指南 §1 |
| 抛 `BusinessException(190002)` | 回调失效（callback invalid） | 检查回调是否被释放/未注册，见 `cj_lambda_invoker_impl.cj` |
| 抛 `BusinessException(10905304)` | `@Provide` 属性缺失 | 上游组件未提供对应 key，见 `custom_view.cj` |
| 日志没有输出 | 未走统一通道 | 用 `ACE_LOG`（`HilogChannel(1, 0xD003902, "Cangjie-Ace")`），勿自建通道 |

## 5. 经验维护约定

- 新增经验必须带**可溯源证据**（文件:行 或 可复现步骤），与 AGENTS.md §3 约束冲突的条目以约束为准。
- 本文与指南重复度控制在引用级：指南改版不影响本文的"症状→根因"条目。
