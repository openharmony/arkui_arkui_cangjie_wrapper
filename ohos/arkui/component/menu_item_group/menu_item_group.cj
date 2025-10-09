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

package ohos.arkui.component.menu_item_group

import ohos.arkui.component.common.*
import ohos.arkui.component.util.*
import ohos.base.*
import ohos.ffi.*
import ohos.resource.*
import ohos.labels.APILevel

foreign {
    func FfiOHOSAceFrameworkMenuItemGroupCreateByBuilder(header: Int64, footer: Int64): Unit

    func FfiOHOSAceFrameworkMenuItemGroupCreateByString(header: CString, footer: CString): Unit
}

/**
 * Defines MenuItemGroup Component.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MenuItemGroup <: CommonMethodComponent<MenuItemGroup> & MenuItemGroupAttribute {

    /**
     * Creates the MenuItem component.
     *
     * @param { ?ResourceStr } header
     * @param { ?ResourceStr } footer
     * @param { () -> Unit } child     
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: ?ResourceStr = None, footer!: ?ResourceStr = None, child!: () -> Unit = {=>}) {
        unsafe {
            try (cheader = LibC.mallocCString(transResourceStrToString(header ?? "")).asResource(),
                cfooter = LibC.mallocCString(transResourceStrToString(footer ?? "")).asResource()) {
                FfiOHOSAceFrameworkMenuItemGroupCreateByString(cheader.value, cfooter.value)
            }
        }
        this.child = child
    }

    /**
     * Creates the MenuItem component.
     *
     * @param { ?CustomBuilder } header
     * @param { ?CustomBuilder } footer
     * @param { () -> Unit } child     
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(header!: ?CustomBuilder, footer!: ?CustomBuilder, child!: () -> Unit = {=>}) {
        unsafe {
            FfiOHOSAceFrameworkMenuItemGroupCreateByBuilder(Callback0Param<Unit>(header ?? { => }).getID(),
                Callback0Param<Unit>(footer ?? { => }).getID())
        }
        this.child = child
    }
}
