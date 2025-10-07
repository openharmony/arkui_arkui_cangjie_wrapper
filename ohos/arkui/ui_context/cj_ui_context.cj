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

package ohos.arkui.ui_context

import ohos.base.*
import ohos.business_exception.*
import ohos.labels.APILevel
import ohos.arkui.ui_context.animator.*
import ohos.arkui.ui_context.prompt_action.*
import ohos.arkui.component.action_sheet.*
import ohos.arkui.component.alert_dialog.*
import ohos.arkui.component.common.{AnimateParam, vp2pxInner, px2vpInner,
    fp2pxInner, lpx2pxInner, px2fpInner, px2lpxInner, parseAnimateParam}
import ohos.arkui.component.native_struct.*
import ohos.ffi.*
import ohos.arkui.ui_context.font.*
import ohos.arkui.ui_context.router.*

foreign {
    func FfiOHOSAceFrameworkContextMenuClose(): Unit
    func FfiOHOSAceFrameworkViewContextAnimationTo(option: NativeAnimateParam, callback: Int64, isImmediately: Bool): Unit
}

/**
 * Defines class UIContext.
 *
 */
@!APILevel[
    22,
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
        22,
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
        22,
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
    * @params { AnimatorOptions } options - Options.
    * @returns { AnimatorResult }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func createAnimator(options: AnimatorOptions): AnimatorResult {
        return Animator.create(options)
    }

    /**
    * Converts a value in vp units to a value in px.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func vp2px(value: Length): Option<Length> {
        return vp2pxInner(value)
    }

    /**
    * Converts a value in px units to a value in vp.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2vp(value: Length): Option<Length> {
        return px2vpInner(value)
    }

    /**
    * Converts a value in fp units to a value in px.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func fp2px(value: Length): Option<Length> {
        return fp2pxInner(value)
    }

    /**
    * Converts a value in fp units to a value in px.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2fp(value: Length): Option<Length> {
        return px2fpInner(value)
    }

    /**
    * Converts a value in lpx units to a value in px.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func lpx2px(value: Length): Option<Length> {
        return lpx2pxInner(value)
    }

    /**
    * Converts a value in px units to a value in lpx.
    *
    * @params { Length } value
    * @returns { Option<Length> }
    */
    @!APILevel[
        22,
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
        22,
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
        22,
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
        22,
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
     * @params { AlertDialogParamWithConfirm } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithConfirm): Unit {
        AlertDialogInner.show(options)
    }

    /**
     * Shows an alert dialog box.
     *
     * @params { AlertDialogParamWithButtons } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithButtons): Unit {
        AlertDialogInner.show(options)
    }

    /**
     * Shows an alert dialog box.
     *
     * @params { AlertDialogParamWithOptions } options - Shows
     * an AlertDialog component in the given settings.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithOptions): Unit {
        AlertDialogInner.show(options)
    }
    /**
     * Shows an action sheet in the given settings.
     *
     * @params { ActionSheetOptions } value - Parameters of the action sheet.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionSheet(value: ActionSheetOptions): Unit {
        ActionSheetInner.show(value)
    }

    /**
     * Defining animation function
     *
     * @params { AnimateParam } value - parameters for animation.
     * @params { VoidCallback } event - the closure base on which, the system will create animation automatically.
     */
    @!APILevel[
        22,
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
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuController {
    private var instanceId: Int64
    init(instanceId: Int64) {
        this.instanceId = instanceId
    }

    /**
     *
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func close(): Unit {
        unsafe {
            FfiOHOSAceFrameworkContextMenuClose()
        }
    }
}
