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

// The Cangjie API is in Beta. For details on its capabilities and limitations, please refer to the README file.

package ohos.arkui.ui_context

import ohos.base.{Length, VoidCallback}
import ohos.labels.APILevel
import ohos.arkui.ui_context.animator.{Animator}
import ohos.arkui.component.action_sheet.{ActionSheetOptions, ActionSheetInner}
import ohos.arkui.component.alert_dialog.{AlertDialogParamWithConfirm, AlertDialogParamWithButtons, AlertDialogInner, AlertDialogParamWithOptions}
import ohos.arkui.component.common.{AnimateParam, vp2pxInner, px2vpInner,
    fp2pxInner, lpx2pxInner, px2fpInner, px2lpxInner, parseAnimateParam}
import ohos.arkui.component.native_struct.{NativeAnimateParam}
import ohos.ffi.{Callback0Param}

foreign {
    func FfiOHOSAceFrameworkContextMenuClose(): Unit
    func FfiOHOSAceFrameworkViewContextAnimationTo(option: NativeAnimateParam, callback: Int64, isImmediately: Bool): Unit
}

/**
 * Defines class UIContext.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class UIContext {
    private var instanceId: Int64 = 0
    private var promptAction: ?PromptAction = None
    private var measureUtils: ?MeasureUtils = None
    private var font: ?Font = None
    private var router: ?Router = None
    private var contextMenuCtrl: ?ContextMenuController = None
    protected init(instanceId: Int64) {
        this.instanceId = instanceId
    }

    /**
     * Obtains a PromptAction object.
     *
     * @returns { PromptAction } PromptAction object.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getPromptAction(): PromptAction {
        if (let Some(v) <- promptAction) {
            return v
        }
        promptAction = PromptAction(this.instanceId)
        return promptAction.getOrThrow()
    }

    /**
      * Get MeasureUtils.
      * @returns { MeasureUtils } the MeasureUtils.
      */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getMeasureUtils(): MeasureUtils {
        if (let Some(v) <- measureUtils) {
            return v
        }
        measureUtils = MeasureUtils(this.instanceId)
        return measureUtils.getOrThrow()
    }

    /**
    * Create an animator object for custom animation.
    *
    * @param { AnimatorOptions } options - Options.
    * @returns { AnimatorResult }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createAnimator(options: AnimatorOptions): AnimatorResult {
        return Animator.create(options)
    }

    /**
    * Converts a value in vp units to a value in px.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vp2px(value: Length): Option<Length> {
        return vp2pxInner(value)
    }

    /**
    * Converts a value in px units to a value in vp.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2vp(value: Length): Option<Length> {
        return px2vpInner(value)
    }

    /**
    * Converts a value in fp units to a value in px.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fp2px(value: Length): Option<Length> {
        return fp2pxInner(value)
    }

    /**
    * Converts a value in fp units to a value in px.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2fp(value: Length): Option<Length> {
        return px2fpInner(value)
    }

    /**
    * Converts a value in lpx units to a value in px.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lpx2px(value: Length): Option<Length> {
        return lpx2pxInner(value)
    }

    /**
    * Converts a value in px units to a value in lpx.
    *
    * @param { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2lpx(value: Length): Option<Length> {
        return px2lpxInner(value)
    }

    /**
    * get object font.
    *
    * @returns { Font } object Font.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getFont(): Font {
        if (let Some(v) <- font) {
            return v
        }
        font = Font(this.instanceId)
        return font.getOrThrow()
    }

    /**
    * Obtains a Router object.
    *
    * @returns { Router } Router object.
    */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getRouter(): Router {
        if (let Some(v) <- router) {
            return v
        }
        router = Router(this.instanceId)
        return router.getOrThrow()
    }

    /**
     * Get object context menu controller.
     *
     * @returns { ContextMenuController } object context menu controller.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getContextMenuController(): ContextMenuController {
        if (let Some(v) <- contextMenuCtrl) {
            return v
        }
        contextMenuCtrl = ContextMenuController(this.instanceId)
        return contextMenuCtrl.getOrThrow()
    }

    /**
     * Shows an alert dialog box.
     *
     * @param { AlertDialogParamWithConfirm } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithConfirm): Unit {
        AlertDialogInner.show(options)
    }

    /**
     * Shows an alert dialog box.
     *
     * @param { AlertDialogParamWithButtons } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithButtons): Unit {
        AlertDialogInner.show(options)
    }

    /**
     * Shows an alert dialog box.
     *
     * @param { AlertDialogParamWithOptions } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithOptions): Unit {
        AlertDialogInner.show(options)
    }
    /**
     * Shows an action sheet in the given settings.
     *
     * @param { ActionSheetOptions } value - Parameters of the action sheet.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionSheet(value: ActionSheetOptions): Unit {
        ActionSheetInner.show(value)
    }

    /**
     * Defining animation function
     *
     * @param { AnimateParam } value - parameters for animation.
     * @param { VoidCallback } event - the closure base on which, the system will create animation automatically.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animateTo(value: AnimateParam, event: VoidCallback): Unit {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkViewContextAnimationTo(parseAnimateParam(value), lambdaData.getID(), false)
        }
    }
}

/**
 * Defines class ContextMenuController.
 *
 */
@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuController {
    private var instanceId: Int64
    init(instanceId: Int64) {
        this.instanceId = instanceId
    }

    /**
     * Close the context menu.
     */
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func close(): Unit {
        unsafe {
            FfiOHOSAceFrameworkContextMenuClose()
        }
    }
}
