# 仓颉ArkUI开发框架<a name="ZH-CN_TOPIC_0000001076213364"></a>

-   [简介](#section15701932113019)
-   [目录](#section1791423143211)
-   [使用场景](#section171384529150)
-   [编译构建](#section171384529151)
-   [开发者文档](#section171384529152)
-   [如何参与](#section171384529153)
-   [约束](#section171384529154)
-   [相关仓](#section1447164910172)

## 简介<a name="section15701932113019"></a>

仓颉ArkUI框架是OpenHarmony上的声明式UI开发框架，提供开发者进行应用UI开发时所必需的能力，包括状态管理、UI组件、动画、绘制、交互事件等。

其主要结构如下图所示：

![仓颉ArkUI框架](./figures/arkui_arkui_cangjie_wrapper.png)


## 目录<a name="section1791423143211"></a>

仓颉ArkUI开发框架源代码在/foundation/arkui/arkui\_cangjie\_wrapper下，目录结构如下图所示：

```
/foundation/arkui/arkui_cangjie_wrapper
├── figures                    # 存放readme中的架构图
├── ohos                       # 仓颉ArkUI框架接口层实现
|   |── animator               # 动画接口
|   |── arkui                  # 仓颉UI组件接口
|   |── base                   # 基础类型
|   |── curves                 # 曲线
|   |── font                   # 自定义字体
|   |── measure                # 文本计算
|   |── prompt_action          # 弹窗
|   |── router                 # 路由
├── kit                        # 仓颉 ArkUI Kit 层实现
```

## 使用场景<a name="section171384529150"></a>

仓颉ArkUI框架提供了丰富的、功能强大的UI组件、样式定义，组件之间相互独立，随取随用，也可以在需求相同的地方重复使用。开发者还可以通过组件间合理的搭配定义满足业务需求的新组件，减少开发量。

## 编译构建<a name="section171384529151"></a>

```bash
./build.sh --product-name rk3568 --target-cpu=arm64 --build-target arkui_cangjie_wrapper
```

## 开发者文档<a name="section171384529152"></a>

[API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/summary_cjnative_ohos.md)

[开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_zh_cn/arkui-cj/cj-ui-development-overview.md)

## 如何参与<a name="section171384529153"></a>

参与贡献：[如何贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)

## 约束<a name="section171384529154"></a>

支持设备类型：standard

## 相关仓<a name="section1447164910172"></a>

[ace_engine](https://gitee.com/openharmony/arkui_ace_engine)

[cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)

[multimedia_cangjie_wrapper](https://gitcode.com/openharmony-sig/multimedia_multimedia_cangjie_wrapper)

[arkweb_cangjie_wrapper](https://gitcode.com/openharmony-sig/arkweb_arkweb_cangjie_wrapper)

[access_token](https://gitee.com/openharmony/security_access_token)
