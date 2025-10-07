# ArkUI Framework Cangjie Interface(beta feature)<a name="EN-US_TOPIC_0000001076213364"></a>

## Introduction<a name="section15701932113019"></a>

The ArkUI Framework Cangjie Interface provides basic, container, and canvas UI components capabilities, include State Management, UI Components, Animation, Rendering, Events etc. ArkUI Framework Cangjie Interface is only available for standard devices.

## System Architecture

Framework architecture:

![Cangjie ArkUI Framework](./figures/arkui_arkui_cangjie_wrapper_en.png)

As shown in the architecture:

Interface Layer

- UI Components: Provides built-in components, including text components, layout components, drawing components, and rendering control components. Developers can combine these built-in components to create desired pages.

- UI Context: Through the UI context, capabilities such as curve interpolation calculations, animations and motion effects, custom fonts, and page routing can be utilized.

- State Management Macros: Using state management macros allows developers to decorate variables they define. Changes to the values of these decorated variables will trigger re-rendering of the UI.

Framework Layer

- UI Component Encapsulation: Implementation of UI component encapsulation by Cangjie, including:

  - Text Components: Text components typically encompass user input information, displayed text content, and small icons. These elements collectively build the interactive interface between the user and the system, enhancing operational convenience and the intuitiveness of information display.

  - Layout Components: Layout components are typically used to manage the size and position of UI components placed on a user page. These include linear layout, stacked layout, flexible layout, relative layout, and grid layout.

  - Drawing Components: Drawing components are used for custom graphic drawing. Developers can draw on the Canvas component, with drawable objects including basic shapes, text, and images.

  - endering Control: Rendering control allows conditional control over whether UI components are displayed. This includes conditional rendering (if/else), loop rendering (ForEach), and lazy data loading (LazyForEach).

- UI Context Encapsulation: Implementation of UI context encapsulation, including:

  - Animation: Using animations can add transition scenarios to UI changes.

  - Dialog: Dialog are used to briefly display information requiring user attention or actions to be processed.

  - Route: Provides the ability to access different pages, including navigating to a specified page within the app, replacing the current page with another page in the same app, returning to the previous page or a specified page, etc.

  - Custom Fonts: Provides the ability to register custom fonts.

  - Measure: Provides calculations related to text width, height, etc.

- State Management: Implementation of state management macros, including:

  - Component-Level State: Manages state at the component level, allowing observation of variable changes within the same component or across different component hierarchies on the same page.

  - Application-Level State: Manages state at the application level, allowing observation across different pages; it is global state management within the application.

- Cangjie ArkUI Development Framework FFI Interface Definitions: Responsible for defining the C language interoperability interfaces for Cangjie, used to provide the capability for the Cangjie UI frontend to interface with the ArkUI development framework. This includes interfacing for both UI components and the UI context.

Dependency Components Introduction in Architecture:

- ace_engine: arkui_cangjie_wrapper relies on the UI components, animations, and interactive event capabilities provided by the UI engine.
- access_token: UI component relies on the authorization and authentication capabilities provided by the access control module.
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

## Constraints

Compared with ArkTS, the following features are currently not supported:
- Declarative Components
  - Declarative components not yet supported include: WaterFlow and FlowItem for waterfall flow components, MultiNavigation for large-screen device column navigation, ContainerSpan for inline text and inline image management components, SymbolSpan for icon symbol components, Marquee for marquee components, XComponent for custom rendering components, FormLink for static card interaction components, NodeContainer and ContentSlot for custom placeholder components, and Component3D for 3D rendering components.
- Advanced Components: For detailed information, please refer to [Advanced Components](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ohos-arkui-advanced-Chip.md).
- Embedded Components: FullScreenLaunchComponent for full-screen atomic service startup, EmbeddedComponent for same-application process embedding.
- Security Components: For detailed information, please refer to [Security Components](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ts-security-components-pastebutton.md).
- State Management V2: For detailed information, please refer to [State Management V2](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/ui/state-management/arkts-mvvm-V2.md).
- Component Preview: Component preview supports previewing at the granularity of custom components, facilitating developers to view the UI effects of individual custom components. For detailed information, please refer to [Component Preview](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/arkui-ts/ts-universal-component-previewer.md).
- Custom Node Capabilities: Including FrameNode for custom component nodes, RenderNode for custom rendering nodes, BuilderNode for custom declarative nodes. For detailed information, please refer to [Custom Node Overview](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/ui/arkts-user-defined-node.md).
- Custom Extension Capabilities: Including AttributeModifier for property modifiers, AttributeUpdater for property updaters. For detailed information, please refer to [Custom Extension Overview](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/ui/arkts-user-defined-modifier.md).
- API Categories: API categories not yet supported include:
  - Component Screenshot: The ability to capture screenshots of components, including screenshots of loaded components and unloaded components.
  - Active Drag: Provides the ability to initiate active dragging. Applications can initiate dragging actions upon receiving events such as touch or long press and carry drag information within them.
  - Prefetcher: Works with LazyForEach to provide content preloading capabilities when scrolling through container components like List, Grid, WaterFlow, and Swiper, improving the user browsing experience.
  - Theme Switching: Customize theme styles to enable app component styles to switch according to the Theme.
  - Matrix Transformation: Provides matrix transformation functionality, supporting operations such as translation, rotation, and scaling on graphics.
  - Media Query: Provides the ability to define different styles based on different media types. For detailed information, please refer to [Media Query](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-mediaquery.md).
  - PluginComponentManager:The PluginComponentManager module provides APIs for the PluginComponent user to request components and data and send component templates and data. please refer to [PluginComponentManager](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-plugincomponent.md).
  - uiExtension：The uiExtension module provides APIs for the EmbeddedUIExtensionAbility (or UIExtensionAbility) to obtain the host application window information or the information about the corresponding EmbeddedComponent (or UIExtensionComponent) component. please refer to [uiExtension](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-arkui-uiExtension.md)。

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
