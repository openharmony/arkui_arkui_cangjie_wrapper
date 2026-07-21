/**
 * Created on 2026/7/14
 */
package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.arkui.component.*
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty

import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

@Entry
@Component
class CangjieReuse {
    func build() {
        Scroll() {
            Flex(wrap: FlexWrap.Wrap) {
                ForEach(
                    UT1,
                    itemGeneratorFunc: {
                        viewName: String, _: Int64 => Button(viewName)
                        .fontSize(12)
                        .width(47.percent).height(30).id(
                            viewName).borderRadius(4).margin(2).onClick ({ e
                            => getUIContext().getRouter().pushUrl(url: viewName)
                        })
                    }
                )
            }.width(100.percent).margin(5)
        }.id("scroller")
    }
}
