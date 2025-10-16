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

package ohos.arkui.component.progress

import ohos.arkui.component.common.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Defines Progress Component.
 */
@!APILevel[
    since:"22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
sealed interface ProgressAttribute <: CommonMethod<ProgressAttribute> {
    /**
     * Called when the current progress value is set.
     *
     * @param { ?Float64 } value
     * @returns { ProgressAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func value(value: ?Float64): ProgressAttribute

    /**
     * Called when the progress bar foreground is set.
     *
     * @param { ?ResourceColor } value - indicates the color of the progress.
     * @returns { ProgressAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func color(value: ?ResourceColor): ProgressAttribute

    /**
     * Called when the style of progress bar is set.
     *
     * @param { ?Length } strokeWidth
     * @param { ?Int32 } scaleCount
     * @param { ?Length } scaleWidth
     * @returns { ProgressAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func style(strokeWidth!: ?Length, scaleCount!: ?Int32, scaleWidth!: ?Length): ProgressAttribute

    /**
     * Called when the style of progress bar is set.
     *
     * @param { ?RingStyleOptions } value - indicates the style of the progress.
     * @returns { ProgressAttribute }
     */
    @!APILevel[
        since:"22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    func style(value: ?RingStyleOptions): ProgressAttribute
}
