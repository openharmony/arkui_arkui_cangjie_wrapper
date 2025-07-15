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

package ohos.component

foreign func FFIOHOSAceFrameworkRequestFocus(inspectorKey: CString): Bool

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class FocusControl {
    private static let instance_ = FocusControl()
    static func getFocusController(): FocusControl {
        instance_
    }

    /**
     * Request focus to the specific component by param: 'id/key'.
     *
     * @param value: The target component uses the string bound by the interface key (value: string) or id (value: string).
     * @return whether the focus is successfully applied for the target component.
     * @since 11
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func requestFocus(keyValue: String): Bool {
        var result: Bool = false
        unsafe {
            try (inspectorKey = LibC.mallocCString(keyValue).asResource()) {
                result = FFIOHOSAceFrameworkRequestFocus(inspectorKey.value)
            }
        }
        result
    }
}
