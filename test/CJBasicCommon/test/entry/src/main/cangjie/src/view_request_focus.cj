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

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.focus_control.FocusControl
import ohos.resource.__GenerateResource__

/**
 * requestFocus 接口测试页面
 * 实现 RequestFocus_Test.json 中定义的测试场景
 */
@Entry
@Component
class ViewRequestFocus {
    // ========== Section 1: Basic Interface Tests ==========
    @State var requestResult: String = "Click button to test request focus"
    @State var successResult: String = "Click button to test success return"
    @State var failResult: String = "Click button to test fail return"
    @State var emptyIdResult: String = "Click button to test empty string id"
    @State var notExistIdResult: String = "Click button to test non-existent id"
    
    // ========== Section 2: Component Type Coverage Tests ==========
    @State var buttonFocusState: String = "No focus"
    @State var textInputFocusState: String = "No focus"
    @State var textFocusableState: String = "No focus"
    @State var imageFocusableState: String = "No focus"
    @State var columnFocusableState: String = "No focus"
    @State var listFocusableState: String = "No focus"
    
    // ========== Section 3: Focus State Validation Tests ==========
    @State var focusEventResult: String = "Waiting for focus event"
    @State var blurEventResult: String = "Waiting for blur event"
    @State var keyboardState: String = "Keyboard not shown"
    
    // ========== Section 4: Focus Switch Tests ==========
    @State var tabIndexResult: String = "Waiting for tabIndex switch"
    @State var multiRequestResult: String = "Waiting for multiple requests"
    @State var crossContainerResult: String = "Waiting for cross-container switch"
    @State var nestedContainerResult: String = "Waiting for nested container switch"
    
    // ========== Section 7: Boundary Condition Tests ==========
    @State var hiddenComponentResult: String = "Waiting to test hidden component"
    @State var disabledComponentResult: String = "Waiting to test disabled component"
    @State var nonFocusableResult: String = "Waiting to test non-focusable component"
    
    func build() {
        Scroll() {
            Column() {
                // ========== Section 1: Basic Interface Tests ==========
                Text("Section 1: Basic Interface Tests").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 10, bottom: 5)
                
                Text("1.1 Interface Definition Validation").fontSize(16).margin(bottom: 5)
                
                Button("Test Request Focus Return Value").onClick({ e =>
                    let result = FocusControl.requestFocus("test_button_1")
                    this.requestResult = if (result) { "Request success: true" } else { "Request failed: false" }
                }).id("test_button_1").margin(bottom: 5)
                Text(this.requestResult).id("text_request_result").fontSize(14).margin(bottom: 10)
                
                Button("Test Success Return True").onClick({ e =>
                    let result = FocusControl.requestFocus("success_button")
                    this.successResult = "Return value: ${result}"
                }).id("success_button").margin(bottom: 5)
                Text(this.successResult).id("text_success_result").fontSize(14).margin(bottom: 10)
                
                Button("Test Fail Return False").onClick({ e =>
                    let result = FocusControl.requestFocus("not_exist_id")
                    this.failResult = "Return value: ${result}"
                }).margin(bottom: 5)
                Text(this.failResult).id("text_fail_result").fontSize(14).margin(bottom: 10)
                
                Button("Test Empty String Id").onClick({ e =>
                    let result = FocusControl.requestFocus("")
                    this.emptyIdResult = "Return value: ${result}"
                }).margin(bottom: 5)
                Text(this.emptyIdResult).id("text_empty_id_result").fontSize(14).margin(bottom: 10)
                
                Button("Test Non-Existent Id").onClick({ e =>
                    let result = FocusControl.requestFocus("non_existent_id_12345")
                    this.notExistIdResult = "Return value: ${result}"
                }).margin(bottom: 5)
                Text(this.notExistIdResult).id("text_not_exist_result").fontSize(14).margin(bottom: 10)
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== Section 2: Component Type Coverage Tests ==========
                Text("Section 2: Component Type Coverage Tests").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 10, bottom: 5)
                
                Text("2.1 Default Focusable Components").fontSize(16).margin(bottom: 5)
                
                Button("Button Component").onClick({ e =>
                    let result = FocusControl.requestFocus("button_focus_test")
                    this.buttonFocusState = if (result) { "Button got focus" } else { "Button focus failed" }
                }).id("button_focus_test")
                .onFocus({ => this.buttonFocusState = "Button got focus" })
                .onBlur({ => this.buttonFocusState = "Button lost focus" })
                .margin(bottom: 5)
                Text(this.buttonFocusState).id("text_button_focus").fontSize(14).margin(bottom: 10)
                
                TextInput(placeholder: "TextInput Component")
                .id("textinput_focus_test")
                .onFocus({ => 
                    this.textInputFocusState = "TextInput got focus"
                    this.keyboardState = "Keyboard shown"
                })
                .onBlur({ => 
                    this.textInputFocusState = "TextInput lost focus"
                    this.keyboardState = "Keyboard hidden"
                })
                .margin(bottom: 5)
                Text(this.textInputFocusState).id("text_textinput_focus").fontSize(14).margin(bottom: 5)
                Button("Request TextInput Focus").onClick({ e =>
                    let _ = FocusControl.requestFocus("textinput_focus_test")
                }).margin(bottom: 10)
                
                Text("2.2 Default Non-Focusable Components (need focusable)").fontSize(16).margin(top: 10, bottom: 5)
                
                Text("Text Component (focusable)")
                .id("text_focusable_test")
                .focusable(true)
                .onFocus({ => this.textFocusableState = "Text got focus" })
                .onBlur({ => this.textFocusableState = "Text lost focus" })
                .fontSize(16)
                .padding(10)
                .backgroundColor(0xFFE0E0E0)
                .margin(bottom: 5)
                Text(this.textFocusableState).id("text_text_focusable").fontSize(14).margin(bottom: 5)
                Button("Request Text Focus").onClick({ e =>
                    let _ = FocusControl.requestFocus("text_focusable_test")
                }).margin(bottom: 10)
                
                Image(@r(app.media.startIcon))
                .id("image_focusable_test")
                .width(100).height(100)
                .focusable(true)
                .onFocus({ => this.imageFocusableState = "Image got focus" })
                .onBlur({ => this.imageFocusableState = "Image lost focus" })
                .margin(bottom: 5)
                Text(this.imageFocusableState).id("text_image_focusable").fontSize(14).margin(bottom: 5)
                Button("Request Image Focus").onClick({ e =>
                    let _ = FocusControl.requestFocus("image_focusable_test")
                }).margin(bottom: 10)
                
                Text("2.3 Container Components").fontSize(16).margin(top: 10, bottom: 5)
                
                Column() {
                    Text("Column Container Content").fontSize(14)
                }
                .id("column_focusable_test")
                .width(200).height(100)
                .focusable(true)
                .onFocus({ => this.columnFocusableState = "Column got focus" })
                .onBlur({ => this.columnFocusableState = "Column lost focus" })
                .backgroundColor(0xFFE0E0E0)
                .padding(10)
                .margin(bottom: 5)
                Text(this.columnFocusableState).id("text_column_focusable").fontSize(14).margin(bottom: 5)
                Button("Request Column Focus").onClick({ e =>
                    let _ = FocusControl.requestFocus("column_focusable_test")
                }).margin(bottom: 10)
                
                List() {
                    ListItem() {
                        Text("List Item 1").fontSize(14)
                    }
                    ListItem() {
                        Text("List Item 2").fontSize(14)
                    }
                }
                .id("list_focusable_test")
                .width(200).height(150)
                .focusable(true)
                .onFocus({ => this.listFocusableState = "List got focus" })
                .onBlur({ => this.listFocusableState = "List lost focus" })
                .margin(bottom: 5)
                Text(this.listFocusableState).id("text_list_focusable").fontSize(14).margin(bottom: 5)
                Button("Request List Focus").onClick({ e =>
                    let _ = FocusControl.requestFocus("list_focusable_test")
                }).margin(bottom: 10)
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== Section 3: Focus State Validation Tests ==========
                Text("Section 3: Focus State Validation Tests").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 10, bottom: 5)
                
                Text("3.1 Focus Acquisition Validation").fontSize(16).margin(bottom: 5)
                
                Button("Test onFocus Event")
                .id("focus_event_test")
                .onFocus({ => this.focusEventResult = "onFocus event triggered" })
                .onBlur({ => this.focusEventResult = "onBlur event triggered" })
                .margin(bottom: 5)
                Text(this.focusEventResult).id("text_focus_event").fontSize(14).margin(bottom: 5)
                Button("Request Focus Trigger onFocus").onClick({ e =>
                    let _ = FocusControl.requestFocus("focus_event_test")
                }).margin(bottom: 10)
                
                TextInput(placeholder: "Test Keyboard Popup")
                .id("keyboard_test")
                .onFocus({ => this.keyboardState = "Keyboard shown" })
                .onBlur({ => this.keyboardState = "Keyboard hidden" })
                .margin(bottom: 5)
                Text(this.keyboardState).id("text_keyboard_state").fontSize(14).margin(bottom: 5)
                Button("Request Focus Show Keyboard").onClick({ e =>
                    let _ = FocusControl.requestFocus("keyboard_test")
                }).margin(bottom: 10)
                
                Text("3.2 Focus Loss Validation").fontSize(16).margin(top: 10, bottom: 5)
                
                Button("Component A")
                .id("component_a")
                .onFocus({ => this.focusEventResult = "Component A got focus" })
                .onBlur({ => this.blurEventResult = "Component A lost focus" })
                .margin(bottom: 5)
                Button("Component B")
                .id("component_b")
                .onFocus({ => this.focusEventResult = "Component B got focus" })
                .onBlur({ => this.blurEventResult = "Component B lost focus" })
                .margin(bottom: 5)
                Text(this.focusEventResult).id("text_focus_switch").fontSize(14).margin(bottom: 5)
                Text(this.blurEventResult).id("text_blur_switch").fontSize(14).margin(bottom: 5)
                Button("Switch to Component B").onClick({ e =>
                    let _ = FocusControl.requestFocus("component_b")
                }).margin(bottom: 10)
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== Section 4: Focus Switch Tests ==========
                Text("Section 4: Focus Switch Tests").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 10, bottom: 5)
                
                Text("4.1 Sequential Switch").fontSize(16).margin(bottom: 5)
                
                Button("tabIndex=1")
                .id("tabindex_1")
                .tabIndex(1)
                .onFocus({ => this.tabIndexResult = "tabIndex=1 got focus" })
                .margin(bottom: 5)
                Button("tabIndex=2")
                .id("tabindex_2")
                .tabIndex(2)
                .onFocus({ => this.tabIndexResult = "tabIndex=2 got focus" })
                .margin(bottom: 5)
                Button("tabIndex=3")
                .id("tabindex_3")
                .tabIndex(3)
                .onFocus({ => this.tabIndexResult = "tabIndex=3 got focus" })
                .margin(bottom: 5)
                Text(this.tabIndexResult).id("text_tabindex_result").fontSize(14).margin(bottom: 5)
                Button("Request by tabIndex Order").onClick({ e =>
                    let _ = FocusControl.requestFocus("tabindex_1")
                    let _ = FocusControl.requestFocus("tabindex_2")
                    let _ = FocusControl.requestFocus("tabindex_3")
                }).margin(bottom: 10)
                
                Button("Component 1").id("multi_1").onFocus({ => this.multiRequestResult = "Component 1 got focus" }).margin(bottom: 5)
                Button("Component 2").id("multi_2").onFocus({ => this.multiRequestResult = "Component 2 got focus" }).margin(bottom: 5)
                Button("Component 3").id("multi_3").onFocus({ => this.multiRequestResult = "Component 3 got focus" }).margin(bottom: 5)
                Text(this.multiRequestResult).id("text_multi_request").fontSize(14).margin(bottom: 5)
                Button("Request Multiple Components").onClick({ e =>
                    let _ = FocusControl.requestFocus("multi_1")
                    let _ = FocusControl.requestFocus("multi_2")
                    let _ = FocusControl.requestFocus("multi_3")
                }).margin(bottom: 10)
                
                Text("4.2 Cross-Container Switch").fontSize(16).margin(top: 10, bottom: 5)
                
                Column() {
                    Button("Component in Column1")
                    .id("column1_component")
                    .onFocus({ => this.crossContainerResult = "Column1 component got focus" })
                }
                .width(200).height(80)
                .backgroundColor(0xFFE0E0E0)
                .padding(10)
                .margin(bottom: 10)
                
                Column() {
                    Button("Component in Column2")
                    .id("column2_component")
                    .onFocus({ => this.crossContainerResult = "Column2 component got focus" })
                }
                .width(200).height(80)
                .backgroundColor(0xFFE0E0E0)
                .padding(10)
                .margin(bottom: 5)
                Text(this.crossContainerResult).id("text_cross_container").fontSize(14).margin(bottom: 5)
                Button("Switch Focus Cross Container").onClick({ e =>
                    let _ = FocusControl.requestFocus("column1_component")
                    let _ = FocusControl.requestFocus("column2_component")
                }).margin(bottom: 10)
                
                Column() {
                    Row() {
                        Column() {
                            Button("Nested Component")
                            .id("nested_component")
                            .onFocus({ => this.nestedContainerResult = "Nested component got focus" })
                        }
                    }
                }
                .width(200).height(80)
                .backgroundColor(0xFFE0E0E0)
                .padding(10)
                .margin(bottom: 5)
                Text(this.nestedContainerResult).id("text_nested_container").fontSize(14).margin(bottom: 5)
                Button("Switch Focus Nested Container").onClick({ e =>
                    let _ = FocusControl.requestFocus("nested_component")
                }).margin(bottom: 10)
                
                Divider().margin(top: 10, bottom: 10)
                
                // ========== Section 7: Boundary Condition Tests ==========
                Text("Section 7: Boundary Condition Tests").fontSize(18).fontWeight(FontWeight.Bold).margin(top: 10, bottom: 5)
                
                Text("7.2 Component State").fontSize(16).margin(bottom: 5)
                
                Button("Hidden Component")
                .id("hidden_component")
                .visibility(Visibility.Hidden)
                .margin(bottom: 5)
                Text(this.hiddenComponentResult).id("text_hidden_component").fontSize(14).margin(bottom: 5)
                Button("Request Hidden Component Focus").onClick({ e =>
                    let result = FocusControl.requestFocus("hidden_component")
                    this.hiddenComponentResult = "Return value: ${result}"
                }).margin(bottom: 10)
                
                Button("Disabled Component")
                .id("disabled_component")
                .enabled(false)
                .margin(bottom: 5)
                Text(this.disabledComponentResult).id("text_disabled_component").fontSize(14).margin(bottom: 5)
                Button("Request Disabled Component Focus").onClick({ e =>
                    let result = FocusControl.requestFocus("disabled_component")
                    this.disabledComponentResult = "Return value: ${result}"
                }).margin(bottom: 10)
                
                Text("7.3 Focus Limitation").fontSize(16).margin(top: 10, bottom: 5)
                
                Text("Non-Focusable Component")
                .id("non_focusable_component")
                .focusable(false)
                .fontSize(16)
                .padding(10)
                .backgroundColor(0xFFE0E0E0)
                .margin(bottom: 5)
                Text(this.nonFocusableResult).id("text_non_focusable").fontSize(14).margin(bottom: 5)
                Button("Request Non-Focusable Component Focus").onClick({ e =>
                    let result = FocusControl.requestFocus("non_focusable_component")
                    this.nonFocusableResult = "Return value: ${result}"
                }).margin(bottom: 10)
            }
            .width(100.percent).padding(10)
        }
        .id("scroller")
    }
}

