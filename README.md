# Cangjie ArkUI Framework<a name="EN-US_TOPIC_0000001076213364"></a>

-   [Introduction](#section15701932113019)
-   [Directory Structure](#section1791423143211)
-   [When to Use](#section171384529150)
-   [How to Build](#section171384529151)
-   [Developer Document](#section171384529152)
-   [How to contribute](#section171384529153)
-   [Limiatation](#section171384529154)
-   [Repositories Involved](#section1447164910172)

## Introduction<a name="section15701932113019"></a>

The OpenHarmony Cangjie UI framework provides basic, container, and canvas UI components capabilities, include State Management, UI Components, Animation, Rendering, Events etc.

Framework architecture:

![Cangjie ArkUI Framework](./figures/arkui_arkui_cangjie_wrapper_en.png)

## Directory Structure<a name="section1791423143211"></a>

The source code of the framework is stored in  **/foundation/arkui/arkui\_cangjie\_api**. The following shows the directory structure.

```
/foundation/arkui/arkui_cangjie_wrapper
├── figures                    # Architectural diagram
├── ohos                       # Cangjie ArkUI Basic libraries
|   |── animator               # Animator interface
|   |── arkui                  # Cangjie UI components
|   |── base                   # Base type
|   |── curves                 # Curves interface
|   |── font                   # Custom font interface
|   |── measure                # Text measure interface
|   |── prompt_action          # Prompt dialog interface
|   |── router                 # Router interface
├── kit                        # Cangjie ArkUI Kit libraries
```

## When to Use<a name="section171384529150"></a>

Cangjie UI framework provides various UI components with rich functionalities and style definitions. You can use and reuse any component anywhere as needed. You can customize new components by combining existing ones to simplify development.

## How to Build<a name="section171384529151"></a>

```bash
./build.sh --product-name rk3568 --target-cpu=arm64 --build-target arkui_cangjie_wrapper
```

## Developer Document<a name="section171384529152"></a>

[API Document](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/summary_cjnative_ohos_EN.md)

[Develop Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/arkui-cj/cj-ui-development-overview.md)

## How to Contribute<a name="section171384529153"></a>

Contributting：[How to Contribute](https://gitcode.com/openharmony/docs/blob/master/en/contribute/how-to-contribute.md)

## Limitation<a name="section171384529154"></a>

Support device type：standard

## Repositories Involved<a name="section1447164910172"></a>

[ace_engine](https://gitee.com/openharmony/arkui_ace_engine)

[cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[arkweb_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkweb_arkweb_cangjie_wrapper)

[access_token](https://gitee.com/openharmony/security_access_token)

