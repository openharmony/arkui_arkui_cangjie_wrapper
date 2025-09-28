# ArkUI开发框架仓颉封装<a name="ZH-CN_TOPIC_0000001076213364"></a>

## 简介<a name="section15701932113019"></a>

ArkUI开发框架仓颉接口提供开发者使用仓颉语言进行应用UI开发时所必需的能力，包括状态管理、UI组件、动画、绘制、交互事件等。当前开放的ArkUI开发框架仓颉接口仅支持standard设备。

## 系统架构

其主要架构如下图所示：

![仓颉ArkUI开发框架](./figures/arkui_arkui_cangjie_wrapper.png)

如架构图所示：

接口层：
- UI组件：面向开发者提供UI组件接口声明，包括文本组件，布局组件，绘制组件，渲染控制，开发者可以通过内置组件组合出所需的页面。
- UI上下文：面向开发者提供UI上下文接口声明，开发者可以通过UI上下文可以使用曲线插值计算，动画动效，自定义字体，页面路由等能力。
- 状态管理宏：面向开发者提供状态管理宏的声明，使用状态管理宏，可以修饰开发者定义的变量，被修饰的变量值的改变会引起UI的渲染更新。

框架层：
- UI组件封装：UI组件仓颉封装实现，包括
  - 文本组件：文本组件通常涵盖用户输入的信息、呈现的文本内容以及小图标，这些元素共同构建了用户与系统间的交互界面，提升了操作的便捷性与信息展示的直观性。
  - 布局组件：布局组件通常用于管理用户页面所放置UI组件的大小和位置，包括线性布局，层叠布局，弹性布局，相对布局，栅格布局。
  - 绘制组件：绘制组件用于自定义绘制图形，开发者可以在Canvas组件上进行绘制，绘制对象可以是基础形状、文本、图片等。
  - 渲染控制：渲染控制可以根据条件控制UI组件是否显示，包括条件渲染（if/else），循环渲染（ForEach），数据懒加载（LazyForEach）。
- UI上下文封装：UI上下文仓颉封装实现，包括
  - 动画：使用动画可以为UI变化添加过度场景。
  - 弹窗：弹窗用于短时间内展示用户需关注的信息或待处理的操作。
  - 路由：提供访问不同页面的能力，包括跳转到应用内的指定页面、同应用内的某个页面替换当前页面、返回上一页面或指定的页面等
  - 自定义字体：提供注册自定义字体的能力
  - 文本计算：提供文本宽度、高度等相关计算
- 状态管理：状态管理宏的实现，包括
  - 组件级状态：组件级别的状态管理，可以观察同一个页面的组件内或不同组件层级的变量变化。
  - 应用级状态：应用级别的状态管理，可以观察不同页面，是应用内全局的状态管理。
- 仓颉ArkUI开发框架FFI接口定义：提供仓颉C语言互操作声明，用于提供仓颉UI前端和ArkUI开发框架对接的能力，包括UI组件和UI上下文的对接。

架构图中依赖部件引入说明：

- arkui_ace_engine：arkui_cangjie_wrapper依赖UI后端引擎提供的UI组件，动画，交互事件能力。
- security_access_token：UI组件依赖访问控制部件提供的授权与鉴权能力。
- cangjie_ark_interop：依赖cangjie_ark_interop提供的APILevel能力进行API管理。
- global_cangjie_wrapper：依赖global_cangjie_wrapper提供的资源管理仓能力。
- multimedia_cangjie_wrapper：Image组件依赖多媒体仓颉部件提供的图像处理能力。
- arkweb_cangjie_wrapper：Web组件依赖arkweb_cangjie_wrapper提供的WebView控制能力。
- hiviewdfx_cangjie_wrapper：依赖hiviewdfx_cangjie_wrapper提供的Hilog日志能力。

## 目录<a name="section1791423143211"></a>

ArkUI开发框架仓颉接口源代码在foundation/arkui/arkui\_cangjie\_wrapper下，目录结构如下图所示：

```
foundation/arkui/arkui_cangjie_wrapper
├── figures                    # 存放README中的架构图
├── kit                        # 仓颉 ArkUI Kit化接口
│   └── ArkUI                  # ArkUI Kit 模块
├── ohos                       # 仓颉ArkUI框架接口层实现
│   ├── animator               # 动画接口
│   ├── arkui                  # 仓颉UI组件接口
│   │   ├── component          # UI组件
│   │   ├── component_snapshot # 组件快照
│   │   ├── component_utils    # 组件工具类
│   │   ├── shape              # 图形绘制组件
│   │   ├── state_macro_manage # 状态管理宏
│   │   ├── state_management   # 状态管理框架
│   │   └── ui_context         # UI上下文库
│   ├── base                   # 基础类型定义
│   ├── curves                 # 动画曲线
│   ├── font                   # 自定义字体
│   ├── measure                # 文本测量计算
│   ├── prompt_action          # 弹窗提示
│   └── router                 # 页面路由
└── test                       # 测试用例存放目录
```

## 使用说明<a name="section171384529150"></a>

ArkUI开发框架仓颉接口提供了丰富的、功能强大的UI组件、样式定义，组件之间相互独立，随取随用，也可以在需求相同的地方重复使用。开发者还可以通过组件间合理的搭配定义满足业务需求的新组件，减少开发量。

提供的能力范围包括：
- 内置组件：通用事件，通用属性，文本组件，布局组件，绘制组件，渲染控制
- 自定义组件：自定义组件生命周期，组件嵌套组合
- 状态管理：组件级变量状态管理，应用级变量状态管理

**基础使用示例**

```cangjie  
@Component
class EntryView {
    @State var message: String = "Hello, Cangjie ArkUI!"
    
    func build() {
        Column {
            Text(this.message)
                .fontSize(20)
                .fontColor(Color.Blue)
            
            Button("点击我")
                .onClick(() => {
                    this.message = "按钮被点击了！"
                })
        }
        .justifyContent(FlexAlign.Center)
    }
}
```

## 约束

与ArkTS相比，暂不支持以下功能：
- 声明式组件
  - 暂未支持声明式组件包括：瀑布流组件WaterFlow和FlowItem，大尺寸设备分栏导航MultiNavigation，行内文本和行内图片管理组件ContainerSpan，图标符号组件SymbolSpan，跑马灯组件Marquee，自定义渲染组件XComponent，静态卡片交互组件FormLink，自定义占位组件NodeContainer和ContentSlot，3D渲染组件Component3D。
- 高级组件：详细介绍请参考[高级组件](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-Chip.md)
- 嵌入式组件：全屏启动原子化服务组件（FullScreenLaunchComponent），同应用进程嵌入式组件 (EmbeddedComponent)
- 安全控件：详细介绍请参考[安全控件](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-security-components-pastebutton.md)
- 状态管理V2：详细介绍请参考[状态管理V2](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/state-management/arkts-mvvm-V2.md)
- 组件预览：组件预览支持以自定义组件为最小单位进行预览，方便开发者查看单个自定义组件UI效果。详细介绍请参考[组件预览](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/arkui-ts/ts-universal-component-previewer.md)
- 自定义节点能力：包括自定义组件节点(FrameNode)，自定义渲染节点(RenderNode)，自定义声明式节点(BuilderNode)，详细介绍请参考[自定义节点概述](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-user-defined-node.md)
- 自定义扩展能力：包括属性修改器(AttributeModifier)，属性更新器(AttributeUpdater)，详细介绍请参考[自定义扩展概述](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/ui/arkts-user-defined-modifier.md)
- API类别，暂未支持API类别包括：
  - 组件截图：组件截图的能力，包括已加载的组件的截图和没有加载的组件的截图。
  - 主动拖拽：提供发起主动拖拽的能力，当应用接收到触摸或长按等事件时可以主动发起拖拽的动作，并在其中携带拖拽信息。
  - Prefetcher：配合LazyForEach，为List、Grid、WaterFlow和Swiper等容器组件滑动浏览时提供内容预加载能力，提升用户浏览体验。
  - 主题换肤：自定义主题风格，实现App组件风格跟随Theme切换。
  - 矩阵变换：提供矩阵变换功能，支持对图形进行平移、旋转和缩放等。
  - 媒体查询：提供根据不同媒体类型定义不同的样式。详细介绍请参考[媒体查询](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-mediaquery.md)。
  - PluginComponentManager：用于给插件组件的使用方请求组件与数据，使用方发送组件模板和数据。详细介绍请参考[媒体查询](https://gitcode.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-arkui/js-apis-plugincomponent.md)。

## 参考文档<a name="section171384529152"></a>

[API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/summary_cjnative_ohos.md)

[开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/arkui-cj/cj-ui-development-overview.md)

## 参与贡献<a name="section171384529153"></a>

欢迎广大开发者贡献代码、文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓<a name="section1447164910172"></a>

[arkui_ace_engine](https://gitcode.com/openharmony/arkui_ace_engine)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[multimedia_multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[arkweb_arkweb_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkweb_arkweb_cangjie_wrapper)

[security_access_token](https://gitcode.com/openharmony/security_access_token)
