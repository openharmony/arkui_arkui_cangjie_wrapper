/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import ohos.arkui.component.grid_row.*
import ohos.arkui.component.grid_col.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class ViewGridColInitInt32 {
    func build() {
        Column() {
            GridRow(columns: 12) {
                GridCol(span: 1) {
                    Text("test")
                }
                .id("testGridColInitSpanNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 6) {
                    Text("test")
                }
                .id("testGridColInitSpanNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 12) {
                    Text("test")
                }
                .id("testGridColInitSpanNormalValue3")
            }
            
            GridRow(columns: 12) {
                GridCol(offset: 0) {
                    Text("test")
                }
                .id("testGridColInitOffsetNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(offset: 2) {
                    Text("test")
                }
                .id("testGridColInitOffsetNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(order: 0) {
                    Text("test")
                }
                .id("testGridColInitOrderNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(order: 1) {
                    Text("test")
                }
                .id("testGridColInitOrderNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(order: -1) {
                    Text("test")
                }
                .id("testGridColInitOrderNormalValue3")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("Hello")
                }
                .id("testGridColInitChildNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 6, offset: 2, order: 1) {
                    Text("Test")
                }
                .id("testGridColInitNormalValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 12, offset: 0, order: 0) {
                    Column() {
                        Text("Test")
                    }
                }
                .id("testGridColInitNormalValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: -1) {
                    Text("test")
                }
                .id("testGridColInitSpanExceptionValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(offset: -1) {
                    Text("test")
                }
                .id("testGridColInitOffsetExceptionValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 0) {
                    Text("test")
                }
                .id("testGridColInitSpanBoundaryValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 1) {
                    Text("test")
                }
                .id("testGridColInitSpanBoundaryValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(span: 2147483647) {
                    Text("test")
                }
                .id("testGridColInitSpanBoundaryValue3")
            }
            
            GridRow(columns: 12) {
                GridCol(offset: 0) {
                    Text("test")
                }
                .id("testGridColInitOffsetBoundaryValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(order: -2147483648) {
                    Text("test")
                }
                .id("testGridColInitOrderBoundaryValue1")
            }
            
            GridRow(columns: 12) {
                GridCol(order: 0) {
                    Text("test")
                }
                .id("testGridColInitOrderBoundaryValue2")
            }
            
            GridRow(columns: 12) {
                GridCol(order: 2147483647) {
                    Text("test")
                }
                .id("testGridColInitOrderBoundaryValue3")
            }
            
            GridRow(columns: 12) {
                GridCol(span: Option<Int32>.None) {
                    Text("test")
                }
                .id("testGridColInitSpanOptionNone")
            }
            
            GridRow(columns: 12) {
                GridCol(offset: Option<Int32>.None) {
                    Text("test")
                }
                .id("testGridColInitOffsetOptionNone")
            }
            
            GridRow(columns: 12) {
                GridCol(order: Option<Int32>.None) {
                    Text("test")
                }
                .id("testGridColInitOrderOptionNone")
            }
            
            GridRow(columns: 12) {
                GridCol() {
                    Text("test")
                }
                .id("testGridColInitNoCall")
            }
        }
        .width(100.percent)
        .height(100.percent)
        .padding(10)
    }
}
