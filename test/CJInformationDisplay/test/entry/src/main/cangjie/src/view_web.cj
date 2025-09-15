/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos_app_cangjie_entry

internal import ohos.base.*
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
import ohos.web.webview.*
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.arkui.component.web.*

// Test: transResourceMediaToString  case _
class Clazz <: ResourceStr {}

@Entry
@Component
class ViewWeb {
    let webController = WebviewController()
    let webCtrl2 = WebviewController()

    @State
    var url: String = "www.baidu.com"

    @State
    var outter: String = ""

    //var HttpErrorReceive: OnHttpErrorReceiveEvent = OnHttpErrorReceiveEvent()

    func build() {
        Column(space: 10) {
            Column() {
                Button("refresh")
                    .onClick {
                        evt =>
                        Hilog.info(1,"1","refresh")
                        webController.refresh()
                    }
                    .width(400.px)
                    .height(150.px)
                    .id("refresh")
                Button("loadUrl")
                    .onClick {
                        evt =>
                        Hilog.info(1,"1","loadUrl")
                        this.url = "www.baidu.com"
                        webController.loadUrl(this.url)
                    }
                    .width(400.px)
                    .height(150.px)
                    .id("btn_load")
                Web(src: this.url, controller: webController)
                Web(src: @r(app.string.url), controller: webController)
                    .id("my_web")
                    .onPageBegin({
                        evt => Hilog.info(1,"1","page begin url: ${evt.url}")
                    })
                    .onPageEnd({
                        evt => Hilog.info(1,"1","page end url: ${evt.url}")
                    })
                    .javaScriptProxy(funcList: [{str1 => str1}], name: "objName", methodList: ["test", "toString"],
                        controller: this.webController)
                    .onLoadIntercept(
                        {
                            req =>
                            req.data.getRequestHeader()
                            req.data.getRequestUrl()
                            req.data.isMainFrame()
                            req.data.isRedirect()
                            req.data.isRequestGesture()
                            req.data.getRequestMethod()
                            Hilog.info(1,"1","this.doInter: false")
                            return false
                        }
                    )
                    .darkMode(WebDarkMode.On)
                    .mixedMode(MixedMode.All)
                    Web(src: @r(app.string.url), controller: webController)
                    .id("my_web_1")
                    .onPageBegin({
                        evt => Hilog.info(1,"1","page begin url: ${evt.url}")
                    })
                    .onPageEnd({
                        evt => Hilog.info(1,"1","page end url: ${evt.url}")
                    })
                    .javaScriptProxy(funcList: [{str1 => str1}], name: "objName", methodList: ["test", "toString"],
                        controller: this.webController)
                    .darkMode(WebDarkMode.On)
                    .mixedMode(MixedMode.All)

                    // Test: transResourceMediaToString  case _
                    Web(src: Clazz(), controller: webController)
            }.height(30.percent)
            Column() {
                Text(this.outter)
                Web(src: this.url, controller: webController)
                    .darkMode(WebDarkMode.Off)
                    .forceDarkAccess(false)
                    .mixedMode(MixedMode.Compatible)
            }.height(20.percent)
            Column() {
                Web(src: @r(app.media.index), controller: webController)
                    .darkMode(WebDarkMode.Off)
                    .forceDarkAccess(false)
                    .darkMode(WebDarkMode.Auto)
                    .backgroundColor(Color.Blue)
                    .fileAccess(true)
                    .domStorageAccess(true)
                    .imageAccess(true)
                    .onlineImageAccess(true)
                    .mixedMode(MixedMode.None)
                    .zoomAccess(true)
                    .geolocationAccess(true)
                    .verticalScrollBarAccess(true)
                    .nestedScroll(scrollForward: NestedScrollMode.SelfFirst,
                        scrollBackward: NestedScrollMode.SelfFirst)
            }
        }
    }
}