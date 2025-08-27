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
import ohos.animator.*
import ohos.prompt_action.*
import ohos.arkui.component.action_sheet.*
import ohos.arkui.component.alert_dialog.*
import ohos.arkui.component.common.*
import ohos.arkui.component.native_struct.*
import ohos.ffi.*
import ohos.font.*
import ohos.router.*

foreign {
    func FfiOHOSAceFrameworkContextMenuClose(): Unit
    func FfiOHOSAceFrameworkViewContextAnimationTo(option: NativeAnimateParam, callback: Int64, isImmediately: Bool): Unit
}

/**
 * class PromptAction
 *
 * @relation export declare class PromptAction
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class PromptAction {
    private var instanceId_: Int64 = 0
    private static let defaultCallback = {_: Option<BusinessException>, _: Option<Int32> =>}

    init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

    /**
     * Shows a toast in the given settings.
     *
     * @param { ShowToastOptions } options - Toast options.
     * @relation showToast(options: promptAction.ShowToastOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showToast(option: ShowToastOptions): Unit {
        PromptActionInner.showToast(option)
    }
    /**
     * Shows a dialog box in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ShowDialogOptions } options - Dialog box options.
     * @param { ShowDialogCallBack } callback - Callback used to return the dialog
     * box response result.
     * @relation showDialog(options: promptAction.ShowDialogOptions, callback: AsyncCallback<promptAction.ShowDialogSuccessResponse>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showDialog(option: ShowDialogOptions, callback!: ShowDialogCallBack = defaultCallback) {
        PromptActionInner.showDialog(option, callback: callback)
    }

    /**
     * Shows an action menu in the given settings. This API uses an asynchronous callback to return the result.
     *
     * @param { ActionMenuOptions } options - Action menu options.
     * @param { ActionMenuSuccessResponse } callback - Callback used to return the action menu
     * response result.
     * @relation showActionMenu(options: promptAction.ActionMenuOptions, callback: promptAction.ActionMenuSuccessResponse): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionMenu(option: ActionMenuOptions, callback!: ShowActionMenuCallBack = defaultCallback) {
        PromptActionInner.showActionMenu(option, callback: callback)
    }

  /**
   * Open the custom dialog.
   *
   * isModal = true and showInSubWindow = true cannot be used at the same time.
   *
   * @param { promptAction.CustomDialogOptions } options - Options.
   * @relation openCustomDialog(options: promptAction.CustomDialogOptions): Promise<number>
   */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func openCustomDialog(options: CustomDialogOptions, callBack: (Int32) -> Unit): Unit {
        PromptActionInner.openCustomDialogWithOption(options, callBack)
    }

    /**
     * Close the custom dialog.
     *
     * @param { number } dialogId - the dialog id that returned by openCustomDialog.
     * @relation closeCustomDialog(dialogId: number): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func closeCustomDialog(dialogId: Int32): Unit {
        PromptActionInner.closeCustomDialog(dialogId)
    }
}

/**
 * Defines the Measure interface.
 *
 * @relation export default class MeasureText
 */
 @!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class MeasureUtils {
    private var instanceId: Int64
    init(instanceId: Int64) {
        this.instanceId = instanceId
    }
    /**
     * Displays the textWidth.
     *
     * @param  { MeasureOptions } options - Options.
     * @returns { Float64 }
     * @relation static measureText(options: MeasureOptions): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func measureText(options: MeasureOptions): Float64 {
        measureText(options)
    }
    /**
     * Displays the text width and height.
     *
     * @param { MeasureOptions } options - Options of measure area occupied by text.
     * @returns { SizeOptions } width and height for text to display
     * @relation static measureTextSize(options: MeasureOptions): SizeOptions;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func measureTextSize(options: MeasureOptions): SizeOptions {
        measureTextSize(options)
    }
}

/**
 * class Font
 *
 * @relation export declare class Font
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Font {
    private var instanceId_: Int64 = 0
    private static let defaultCallback = {_: Option<BusinessException>, _: Option<Int32> =>}

    init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

    /**
     * Register a customized font in the FontManager.
     *
     * @param { ResourceStr } familyName
     * @param { ResourceStr } familySrc
     * @relation registerFont(options: font.FontOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func registerFont(familyName!: ResourceStr, familySrc!: ResourceStr): Unit {
        FontInner.registerFont(familyName: familyName, familySrc: familySrc)
    }

    /**
     * Gets a list of fonts supported by system.
     *
     * @returns { Array<String> } A list of font names
     * @relation getSystemFontList(): Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getSystemFontList(): Array<String> {
        return FontInner.getSystemFontList()
    }

    /**
     * Get font details according to the font name.
     *
     * @param { String } fontName - font name
     * @returns { FontInfo } Returns the font info
     * @relation getFontByName(fontName: string): font.FontInfo
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getFontByName(fontName: String): ?FontInfo {
        return FontInner.getFontByName(fontName)
    }
}

/**
 * class Router
 *
 * @relation export declare class Router
 */
 @!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class Router {
    private var instanceId_: Int64 = 0
    private static let defaultCallback = {_: Option<BusinessException>, _: Option<Int32> =>}

    init(instanceId: Int64) {
        this.instanceId_ = instanceId
    }

    /**
     * Navigates to a specified page in the application.
     *
     * @param { String } url
     * @param { String } params
     * @relation pushUrl(options: router.RouterOptions): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushUrl(url!: String, params!: String = ""): Unit {
        RouterInner.push(url: url, params: params)
    }

    /**
     * Returns to the previous page or a specified page.
     *
     * @param { String } url
     * @param { String } params
     * @relation back(options?: router.RouterOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func back(url!: ?String = None, params!: String = ""): Unit {
        match (url) {
            case Some(v) => RouterInner.back(url: v, params: params)
            case None => RouterInner.back()
        }
    }

    /**
     * Returns to the previous page or a specified page.
     *
     * @param { Int32 } index
     * @param { String } params
     * @relation back(index: number, params?: Object): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func back(index!: Int32, params!: String = ""): Unit {
        RouterInner.back(index: index, params: params)
    }

    /**
     * Obtains information about the current page params.
     *
     * @returns { Option<String> } Page params.
     * @relation getParams(): Object;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getParams(): Option<String> {
        return RouterInner.getParams()
    }
}

/**
 * class UIContext
 *
 * @relation export declare class UIContext
 */
@!APILevel[
    21,
    stagemodelonly: true,
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
     * @relation getPromptAction(): PromptAction
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
      * @returns { MeasureUtils } the MeasureUtils
      * @relation getMeasureUtils(): MeasureUtils
      */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation createAnimator(options: AnimatorOptions): AnimatorResult
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation vp2px(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation px2vp(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation fp2px(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation fp2px(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation lpx2px(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation px2lpx(value: number): number;
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func px2lpx(value: Length): Option<Length> {
        return px2lpxInner(value)
    }

    /**
    * get object font.
    *
    * @returns { Font } object Font.
    * @relation getFont(): Font
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
    * @relation getRouter(): Router
    */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation getContextMenuController(): ContextMenuController
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation showAlertDialog(options: AlertDialogParamWithConfirm | AlertDialogParamWithButtons | AlertDialogParamWithOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation showAlertDialog(options: AlertDialogParamWithConfirm | AlertDialogParamWithButtons | AlertDialogParamWithOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
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
     * @relation showAlertDialog(options: AlertDialogParamWithConfirm | AlertDialogParamWithButtons | AlertDialogParamWithOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showAlertDialog(options: AlertDialogParamWithOptions): Unit {
        AlertDialogInner.show(options)
    }
    /**
     * Shows an action sheet in the given settings.
     *
     * @param { ActionSheetOptions } value - Parameters of the action sheet.
     * @relation showActionSheet(value: ActionSheetOptions): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func showActionSheet(value: ActionSheetOptions): Unit {
        ActionSheetInner.show(value)
    }

    /**
     * Defining animation function
     *
     * @param { AnimateParam } value - parameters for animation.
     * @param { VoidCallback } event - the closure base on which, the system will create animation automatically
     * @relation  animateTo(value: AnimateParam, event: () => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func animateTo(value: AnimateParam, event: VoidCallback): Unit {
        let lambdaData = Callback0Param<Unit>(event)
        unsafe {
            FfiOHOSAceFrameworkViewContextAnimationTo(parseAnimateParam(value), lambdaData.getID(), false)
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ContextMenuController {
    private var instanceId: Int64
    init(instanceId: Int64) {
        this.instanceId = instanceId
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func close(): Unit {
        unsafe {
            FfiOHOSAceFrameworkContextMenuClose()
        }
    }
}
