# 知识库索引（docs/README.md）

本目录是 `arkui_arkui_cangjie_wrapper` 的编码代理知识库。入口指引见根目录 `AGENTS.md`；机器可读索引见 `knowledge_base_INDEX.json`。

## 文档清单

| 文档 | 内容 | 何时读 |
| --- | --- | --- |
| [architecture/Cangjie_Wrapper_Architecture.md](architecture/Cangjie_Wrapper_Architecture.md) | 三层架构（接口层/框架层/FFI）、目录职责、上下游依赖仓 | 理解整体设计、改跨模块交互 |
| [ffi/FFI_Bridge_Knowledge_Base.md](ffi/FFI_Bridge_Knowledge_Base.md) | FFI 双侧分工、关联仓库（本仓/ace_engine/interop）、类型映射、回调与 RemoteData、错误处理与 DFX | 改 `foreign` 声明、`@C` 结构体、回调、异常/错误码/日志 |
| [build/Build_Guide.md](build/Build_Guide.md) | 构建 targets、命令、产物位置（`cangjie_libraries`）、新增模块注册流程 | 构建失败、新增模块、SDK 拷贝问题 |
| [components/Component_Development_Guide.md](components/Component_Development_Guide.md) | 组件实现四件套模式（真实 Button 模板）、命名与 API 风格 | 新增/修改组件 |
| [state_management/State_Management_Guide.md](state_management/State_Management_Guide.md) | 全部状态管理宏清单、用法、宏实现位置 | 状态管理相关任务 |
| [testing/Testing_Guide.md](testing/Testing_Guide.md) | `test/` 设备侧测试套件结构、构建方式、环境要求 | 跑测试、写测试用例 |
| [expert/Expert_Knowledge.md](expert/Expert_Knowledge.md) | 专家经验：FFI 属性扩展全链路、实现惯用法、宏实现级经验、症状→根因速查表 | 疑难排查、踩坑、修改类任务 |

## 路由规则（摘要）

- **按任务路由**、**按路径路由**、**按词汇路由**的完整表见 `AGENTS.md` §2/§4；本 README 不重复维护，以 `AGENTS.md` 为准。
- 修改本文档任意文件后，若影响路由/约束/命令，必须同步更新 `AGENTS.md` 与 `knowledge_base_INDEX.json` 的 `last_updated`。
