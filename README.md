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

- UI Component API: provide basic components, include Text & Input, Layout, Canvas ets, please refer to [UI component](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/arkui-cj/cj-row-column-stack-column.md).
- UI Control API: provide UI control capabilities, include curves, animator, custom font, router etc, please refer to [UI Control](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/arkui-cj/cj-universal-event-mouse.md).
- StateManagment: provide state subscribe mechanism, include states change drive UI update, please refer to [StateManage](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-componentstatemanagement.md).
- Declarative Frontend Bridge Layer：provide Bridge Layer for interact between Cangjie Declarative Frontend and ArkUI Engine.

## Directory Structure<a name="section1791423143211"></a>

The source code of the framework is stored in  **/foundation/arkui/arkui\_cangjie\_api**. The following shows the directory structure.

```
/foundation/arkui/arkui_cangjie_wrapper
├── figures                    # Architectural diagram
├── kit                        # Cangjie ArkUI Kit libraries
├── ohos                       # Cangjie ArkUI Basic libraries
|   |── animator               # Animator interface
|   |── arkui                  # Cangjie UI components
|   |── base                   # Base type
|   |── curves                 # Curves interface
|   |── font                   # Custom font interface
|   |── measure                # Text measure interface
|   |── prompt_action          # Prompt dialog interface
|   |── router                 # Router interface
├── test                       # Test case for ArkUI Cangjie API
```

## When to Use<a name="section171384529150"></a>

Cangjie UI framework provides various UI components with rich functionalities and style definitions. You can use and reuse any component anywhere as needed. You can customize new components by combining existing ones to simplify development.

The following features are provided:
- Basic Component: General Event, General Attibutes, Render Components
- Custom Component：LifeCycle of Custom Component
- StateManage： Component Layer State, Application Layer State

The following features are not provided yet:
- State Management V2
- Custom Node capabilitiese: include FrameNode，RenderNode, BuildNode, pelease refer to [Custom Node Overview](https://docs.openharmony.cn/pages/v5.1/en/application-dev/ui/arkts-user-defined-node.md)

## Developer Document<a name="section171384529152"></a>

[API Document](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/summary_cjnative_ohos_EN.md)

[Develop Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/arkui-cj/cj-ui-development-overview.md)

## How to Contribute<a name="section171384529153"></a>

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/how-to-contribute.md).

## Repositories Involved<a name="section1447164910172"></a>

[arkui_ace_engine](https://gitee.com/openharmony/arkui_ace_engine)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[multimedia_multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[arkweb_arkweb_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkweb_arkweb_cangjie_wrapper)

[security_access_token](https://gitee.com/openharmony/security_access_token)
