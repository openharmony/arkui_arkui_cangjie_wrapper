# ArkUI Framework Cangjie Interface<a name="EN-US_TOPIC_0000001076213364"></a>

-   [Introduction](#section15701932113019)
-   [Directory Structure](#section1791423143211)
-   [When to Use](#section171384529150)
-   [Developer Document](#section171384529152)
-   [How to Contribute](#section171384529153)
-   [Repositories Involved](#section1447164910172)

## Introduction<a name="section15701932113019"></a>

The ArkUI Framework Cangjie Interface provides basic, container, and canvas UI components capabilities, include State Management, UI Components, Animation, Rendering, Events etc. ArkUI Framework Cangjie Interface is only available for standard devices.

Framework architecture:

![Cangjie ArkUI Framework](./figures/arkui_arkui_cangjie_wrapper_en.png)

As shown in the architecture:

- UI Component API: provide basic components, include Text & Input, Layout, Canvas ets, please refer to [UI component](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/summary_cjnative_ohos_EN.md).
- UI Control API: provide UI control capabilities, include curves, animator, custom font, router etc, please refer to [UI Control](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/arkui-cj/cj-universal-event-mouse.md).
- StateManagment: provide state subscribe mechanism, include states change drive UI update, please refer to [StateManage](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md).
- Declarative Frontend Bridge Layer：provide Bridge Layer for interact between Cangjie Declarative Frontend and ArkUI Engine.

Dependency Components Introduction in Architecture:

- ace_engine: arkui_cangjie_wrapper relies on the UI components, animations, and interactive event capabilities provided by the ArkUI framework engine.
- access_token: Web component relies on the authorization and authentication capabilities provided by the access control module.
- cangjie_ark_interop: API management is facilitated by the API Level capability offered by cangjie_ark_interop.
- global_cangjie_wrapper: relies on the resource management capability of global_cangjie_wrapper.
- multimedia_cangjie_wrapper: The PixelMap interface, provided by multimedia_cangjie_wrapper, is utilized by Image component.
- arkweb_cangjie_wrapper: The WebView interface, offered by arkweb_cangjie_wrapper, is utilized by Web component.
- hiviewdfx_cangjie_wrapper: Logging is facilitated by the Hilog interface offered by hiviewdfx_cangjie_wrapper.

## Directory Structure<a name="section1791423143211"></a>

The source code of the framework is stored in  **foundation/arkui/arkui\_cangjie\_api**. The following shows the directory structure.

```
foundation/arkui/arkui_cangjie_wrapper
├── figures                    # Architectural diagrams for README
├── kit                        # Cangjie ArkUI Kit interface
│   └── ArkUI                  # ArkUI Kit module
├── ohos                       # Cangjie ArkUI framework interface layer implementation
│   ├── animator               # Animation interfaces
│   ├── arkui                  # Cangjie ArkUI component interfaces
│   │   ├── component          # UI components
│   │   ├── component_snapshot # Component snapshot
│   │   ├── component_utils    # Component utility classes
│   │   ├── shape              # Shape drawing components
│   │   ├── state_macro_manage # State management macros
│   │   ├── state_management   # State management framework
│   │   └── ui_context         # UI context library
│   ├── base                   # Base type definitions
│   ├── curves                 # Animation curves
│   ├── font                   # Custom font management
│   ├── measure                # Text measurement calculations
│   ├── prompt_action          # Prompt dialog
│   └── router                 # Page routing
└── test                       # Test cases directory
```

## When to Use<a name="section171384529150"></a>

Cangjie ArkUI framework provides various UI components with rich functionalities and style definitions. You can use and reuse any component anywhere as needed. You can customize new components by combining existing ones to simplify development.

The provided capabilities include:
- Built-in components: General events, general attributes, container components, drawing components
- Custom components: Custom component lifecycle, component nesting and combination
- State management: Component-level variable state management, application-level variable state management

**Basic Usage Example**

```cangjie  
@Component
class EntryView {
    @State var message: String = "Hello, Cangjie ArkUI!"
    
    func build() {
        Column {
            Text(this.message)
                .fontSize(20)
                .fontColor(Color.Blue)
            
            Button("Click Me")
                .onClick(() => {
                    this.message = "Button Clicked!"
                })
        }
        .justifyContent(FlexAlign.Center)
    }
}
```

Compared to ArkTS, the following features are not supported yet:
- State Management V2
- Custom Node capabilities: include FrameNode，RenderNode, BuildNode, pelease refer to [Custom Node Overview](https://docs.openharmony.cn/pages/v5.1/en/application-dev/ui/arkts-user-defined-node.md)
- Custom Extend capabilities: includ AttributeModifier, AttributeUpdater, pelease refer to [Custom Extend Overview](https://docs.openharmony.cn/pages/v5.1/en/application-dev/ui/arkts-user-defined-modifier.md)

## Developer Document<a name="section171384529152"></a>

[API Document](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/summary_cjnative_ohos_EN.md)

[Develop Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/arkui-cj/cj-ui-development-overview.md)

## How to Contribute<a name="section171384529153"></a>

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/how-to-contribute.md).

## Repositories Involved<a name="section1447164910172"></a>

[arkui_ace_engine](https://gitcode.com/openharmony/arkui_ace_engine)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[multimedia_multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[arkweb_arkweb_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkweb_arkweb_cangjie_wrapper)

[security_access_token](https://gitcode.com/openharmony/security_access_token)
