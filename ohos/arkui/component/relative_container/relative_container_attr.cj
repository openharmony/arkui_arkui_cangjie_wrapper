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

package ohos.arkui.component.relative_container

import ohos.arkui.component.common.{CommonMethod}
import ohos.labels.{APILevel}

/**
 * RelativeContainer
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface RelativeContainerAttribute <: CommonMethod<RelativeContainerAttribute> {
    /**
    * Specifies guideLines of relativeContainer
    *
    * @param { ?Array<GuideLineStyle> } value
    * @returns { RelativeContainerAttribute }
    * @throws { BusinessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func guideLine(value: ?Array<GuideLineStyle>): RelativeContainerAttribute

    /**
    * Specifies barriers of relativeContainer
    *
    * @param { ?Array<BarrierStyle> } value
    * @returns { RelativeContainerAttribute }
    * @throws { BusinessException } - 100001 - Internal error. Possible causes: Failed to allocate memory.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func barrier(value: ?Array<BarrierStyle>): RelativeContainerAttribute
}
