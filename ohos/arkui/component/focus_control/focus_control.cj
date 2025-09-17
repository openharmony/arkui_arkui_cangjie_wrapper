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

package ohos.arkui.component.focus_control

import ohos.labels.APILevel

foreign func FFIOHOSAceFrameworkRequestFocus(inspectorKey: CString): Bool

/**
 * Defines the namespace of focus controller.
 *
 * @relation declare namespace focusControl
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FocusControl {
    private static let instance = FocusControl()
    static func getFocusController(): FocusControl {
        instance
    }

    /**
     * Request focus to the specific component by param: 'id/key'.
     *
     * @param { String } value
     * @returns { Bool }
     * @relation function requestFocus(value: string): boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func requestFocus(value: ?String): Bool {
        let tmpValue = value ?? throw IllegalArgumentException("The type now is not supported.")
        var result: Bool = false
        unsafe {
            try (inspectorKey = LibC.mallocCString(tmpValue).asResource()) {
                result = FFIOHOSAceFrameworkRequestFocus(inspectorKey.value)
            }
        }
        result
    }
}
