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

package ohos.arkui.component.rect	

import ohos.arkui.component.common.*	
import ohos.arkui.component.shape.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Rect Component.
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RectAttribute <: CommonShapeMethod<RectAttribute> {	

    /**
     * Set the corner radius width.
     *
     * @param { ?Length } value
     * @returns { RectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radiusWidth(value: ?Length): RectAttribute

    /**
     * Set the corner radius height.
     *
     * @param { ?Length } value
     * @returns { RectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radiusHeight(value: ?Length): RectAttribute

    /**
     * Set the corner radius size.
     *
     * @param { ?Length } value
     * @returns { RectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?Length): RectAttribute

    /**
     * Set the corner radius size.
     *
     * @param { ?Array<Length> } value
     * @returns { RectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(value: ?Array<Length>): RectAttribute

    /**
     * Set the corner radius size.
     *
     * @param { ?Array<(Length, Length)> } value
     * @returns { RectAttribute }
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func radius(radiusArray: ?Array<(Length, Length)>): RectAttribute
}
