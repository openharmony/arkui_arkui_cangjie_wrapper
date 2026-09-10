# 测试指南（Testing Guide）

> 本仓**无主机侧单元测试**：`bundle.json` 的 `build.test` 列表为空，`ohos_cangjie_unittest` 目标未在本仓使用。行为验证依赖 `test/` 下的**设备侧测试套件**（LLT），需要 DevEco Studio 环境与真机/模拟器。

## 1. 测试套件结构

`test/` 按组件族分 18 个套件（均含 `build.py` + `test/` DevEco 工程）：

| 套件 | 覆盖 |
| --- | --- |
| `CJButtonAndSelection` | Button/Checkbox/Radio/Rating/Slider/Stepper/Toggle/Select/Tab/TextPicker 等 |
| `CJTextAndInput` | Text/TextInput/TextArea/Search/RichEditor/Span 等 |
| `CJRowColumnAndStack` / `CJGridAndColumn` / `CJScrollAndSplit` | 布局组件 |
| `CJStateManagement` | 状态管理宏 |
| `CJCanvasDrawing` / `CJCanvasEnhancement` | Canvas 绘制 |
| `CJLazyForeachAndForeach` / `CJReusable` | 渲染控制/复用 |
| `CJAnimation` / `CJInformationDisplay` / `CJTitleMenuDialog` / `CJBlankAndDivider` / `CJBuilderWithCustomBuilder` / `CJDiagReport` / `CJReverseTestCase` | 动画、信息展示、弹窗菜单等 |
| `CJBasicCommon` | 通用属性/基础能力 |

每个套件：

```
test/CJXxx/
├── build.py          # 构建脚本：调用 DevEco/hvigor 打出 entry.hap
└── test/             # DevEco 工程（module.json5、hvigorfile.ts、cangjie 源码）
    └── entry/src/main/cangjie/src/
        ├── main_ability.cj / ability_stage.cj / index.cj
        ├── unittest_engine.cj / unittest_list.cj   # 用例注册与执行引擎
        └── view_xxx.cj / xxx_index_N.cj / xxx_ut_N.cj  # 页面与用例
```

## 2. 构建/运行方式

`build.py` 依赖环境变量（见脚本头部 `load_dotenv('D:\\.env')`）：

- `FRAMEWORK_PATH`：测试框架目录（提供 `deveco_project`、`testsuite_builder` 等）
- `DEVECO_HOME`：DevEco Studio 安装目录（脚本取其 `tools/node` 与 `tools/hvigor`）

流程：`build.py` → hvigor 构建 debug HAP → 签名 → 输出 `entry.hap` → 由测试框架投递到设备执行（用例以 `*_ut_N.cj` 注册在 `unittest_list.cj`）。

**编码代理注意**：本机通常没有上述环境。代理默认不做设备测试，只需保证编译验证通过，并在报告中注明"设备侧 LLT 未执行"。**不要**为了"修编译"改 `test/` 内工程配置。

## 3. 新增用例

1. 定位组件所属套件（上表），在 `test/entry/src/main/cangjie/src/` 新增 `view_xxx.cj` 页面与 `xxx_ut_N.cj` 用例。
2. 在 `unittest_list.cj` 注册用例。
3. 页面代码风格对照同目录现有文件（`@Entry @Component`、`import ohos.arkui.state_macro_manage.*`）。
4. 本地无法跑设备验证时，至少保证：代码风格一致 + 引用的组件 API 真实存在（以 `ohos/arkui/component/` 下声明为准）。
