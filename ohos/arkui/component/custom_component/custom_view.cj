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

package ohos.arkui.component.custom_component

import ohos.arkui.component.common.{UINodeBase}
import ohos.arkui.component.ifcomponent.{If}
import ohos.arkui.component.for_each.{ForEach}
import ohos.arkui.component.custom_view.{RemoteView}
import ohos.arkui.state_management.{Observer, ObservedPropertyAbstract, LocalStorage, ObservedProperty, ObservedComplexAbstract, SubscriberManager, ViewStackProcessor}
import ohos.arkui.ui_context.{UIContext}
import ohos.base.{ExternalString, CollectionEx, ReuseParams, BaseLog}
import ohos.ffi.{FFIDataManager}
import ohos.business_exception.BusinessException
import ohos.labels.APILevel
import std.sort.{SortByExtension}
import std.collection.{HashSet}
import std.collection.HashMap
import std.collection.ArrayList

foreign func FfiOHOSAceFrameworkLoadNativeView(view: Int64): Bool

foreign func FfiOHOSAceFrameworkProcessViewId(view: Int64): ExternalString

/**
 * load native view of custom component.
 *
 * @param { CustomView } view
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public func loadNativeView(view: CustomView): Bool {
    FFIDataManager.getInstance().register(view)
    unsafe {
        FfiOHOSAceFrameworkLoadNativeView(view.getView().getID())
    }
}

type UpdateFuncNew = (Int64, Bool) -> UINodeBase

type RecycleUpdateFunc = (Int64, Bool, ?CustomView) -> UINodeBase

/**
 * CustomView class.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CustomView <: RemoteView & Observer {
    protected let nativeView_inner__: View

    private let compId_inner__: Int64

    private var provideVars_inner__ = HashMap<String, ObservedPropertyAbstract>()
    private let watchedProps_inner__ = HashMap<String, () -> Unit>()

    protected var dirtDescendantElementIds_inner__ = HashSet<Int64>()
    private var propsUsedForRender_inner__ = HashSet<String>()
    private var isRenderingInProgress_inner__: Bool = false
    protected var updateFuncByElmtId_inner__ = HashMap<Int64, UpdateFuncNew>()

    private var children_inner__: HashMap<Int64, CustomView> = HashMap<Int64, CustomView>()

    private let lazyChildren_inner__ = HashMap<String, CustomView>()
    private let lazyGroups_inner__ = HashMap<String, ArrayList<String>>()
    private var isLazyForEachProcess_inner__ = false
    private var lazyGroupId_inner__: String = ""
    private var localStorage_inner__: Option<LocalStorage> = None
    private var parent_inner__: Option<CustomView> = None

    /**
     * isReusable property.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public var isReusable_inner__: Bool = false
    private var recycleManager_: ?RecycleManager = None
    private var hasBeenRecycled_: Bool = false
    private var delayRecycleNodeRerender_: Bool = false
    private var delayRecycleNodeRerenderDeep_: Bool = false
    private var runReuse_: Bool = false

    /**
     * init function.
     *
     * @param { Option<CustomView> } parent
     * @param { Option<LocalStorage> } localStorage
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(parent: Option<CustomView>, localStorage: Option<LocalStorage>) {
        super()
        nativeView_inner__ = View.create(id_)
        compId_inner__ = SubscriberManager.getInstance().makeId()
        provideVars_inner__.add(all: parent?.provideVars_inner__ ?? HashMap<String, ObservedPropertyAbstract>())
        parent_inner__ = parent
        localStorage_inner__ = localStorage
    }

    /**
     * Get the LocalStorage instance of current page.
     *
     * @returns { LocalStorage } - The LocalStorage instance of the current page.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getLocalStorage(): LocalStorage {
        if (localStorage_inner__.isNone() && parent_inner__.isSome()) {
            localStorage_inner__ = parent_inner__.getOrThrow().getLocalStorage()
        }
        if (localStorage_inner__.isNone()) {
            localStorage_inner__ = LocalStorage()
        }
        localStorage_inner__.getOrThrow()
    }

    /**
     * declareWatch function.
     *
     * @param { ObservedProperty<T> } propMember
     * @param { () -> Unit } callBack
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func declareWatch<T>(propMember: ObservedProperty<T>, callBack: () -> Unit) {
        match (propMember.getInner() as ObservedComplexAbstract) {
            case Some(value) =>
                watchedProps_inner__.add(value.getInfo(), callBack)
                let propsInfo = value.getPropsInfo()
                for (info in propsInfo) {
                    watchedProps_inner__.add(info, callBack)
                }
            case None => ()
        }

        match (propMember as ObservedPropertyAbstract) {
            case Some(value) => watchedProps_inner__.add(value.getInfo(), callBack)
            case None => ()
        }
    }

    /**
     * Define declarative UI descriptions for custom component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit

    protected func initialRenderView(): Unit {
        this.build()
    }

    protected override func onAboutToRender(): Unit {
        isRenderingInProgress_inner__ = true
        propsUsedForRender_inner__.clear()
    }

    protected override func onAfterRender(): Unit {
        isRenderingInProgress_inner__ = false
    }

    /**
     * force rerender function.
     *
     * @param { Bool } deep
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public override func forceCompleteRerender(deep: Bool): Unit {
        let arr = this.updateFuncByElmtId_inner__.keys().toArray()
        arr.sortBy(
            comparator: {
                a, b =>
                if (a < b) {
                    return Ordering.LT
                }
                if (a > b) {
                    return Ordering.GT
                }
                return Ordering.EQ
            }
        )
        for (id in arr) {
            updateElement(id)
        }
        if (deep) {
            for (child in children_inner__.values()) {
                if (!child.isRecycled()) {
                    child.forceCompleteRerender(true)
                } else {
                    child.delayCompleteRerender(deep)
                }
            }
        }
    }

    protected func updateElement(elmtId: Int64): Unit {
        if (elmtId == id()) {
            return
        }
        match (updateFuncByElmtId_inner__.get(elmtId)) {
            case None => BaseLog.error("update function of ElementId ${elmtId} not found, internal error!")
            case Some(updateFunc) =>
                ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
                updateFunc(elmtId, false).update()
                ViewStackProcessor.StopGetAccessRecording()
                nativeView_inner__.finishUpdateFunc(elmtId)
        }
    }

    /**
     * update dirty elements.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func updateDirtyElements() {
        do {
            let deletedElmtIds = nativeView_inner__.getDeletedElemtIds()
            this.purgeDeletedElmtIds(deletedElmtIds)
            let arr = dirtDescendantElementIds_inner__.toArray()
            arr.sortBy(
                comparator: {
                    a, b =>
                    if (a < b) {
                        return Ordering.LT
                    }
                    if (a > b) {
                        return Ordering.GT
                    }
                    return Ordering.EQ
                }
            )

            for (elmtId in arr) {
                if (hasRecycleManager()) {
                    let rm = recycleManager_.getOrThrow()
                    updateElement(rm.proxyNodeId(elmtId))
                } else {
                    updateElement(elmtId)
                }
                this.dirtDescendantElementIds_inner__.remove(elmtId)
            }
        } while (this.dirtDescendantElementIds_inner__.size > 0)
    }

    protected func purgeDeletedElmtIds(rmElmtIds: ArrayList<Int64>) {
        if (rmElmtIds.size == 0) {
            return
        }

        let removedElmtIds: ArrayList<Int64> = ArrayList<Int64>()

        for (elmtId in rmElmtIds) {
            match (updateFuncByElmtId_inner__.remove(elmtId)) {
                case None => ()
                case _ =>
                    purgeVariableDependenciesOnElmtId(elmtId)
                    removedElmtIds.add(elmtId)
            }
        }
        nativeView_inner__.deletedElmtIdsHaveBeenPurged(removedElmtIds);
    }

    /**
     * update function for ForEach.
     *
     * @param { Int64 } elmtId
     * @param { CollectionEx<T> } arr
     * @param { (T, Int64) -> Unit } itemGenFunc
     * @param { (T, Int64) -> String } keyGeneratorFunc
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func forEachUpdateFunction<T>(
        elmtId: Int64,
        arr: CollectionEx<T>,
        itemGenFunc!: (T, Int64) -> Unit,
        keyGeneratorFunc!: (T, Int64) -> String = {
            realData: T, idx: Int64 => match (realData) {
                case realDataStr: ToString => idx.toString() + "_" + realDataStr.toString()
                case _ => idx.toString()
            }
        }
    ): Unit {
        var newIdArray = ArrayList<String>(arr.size) {
            index => keyGeneratorFunc(arr[index], index)
        }
        let setIdResult = ForEach<T>.setIdArray(elmtId, newIdArray)
        let diffIndexArray = setIdResult.diffIndexArray
        for (idx in diffIndexArray) {
            let id = newIdArray[idx]
            ForEach<T>.createNewChildStart(id)
            itemGenFunc(arr[idx], idx)
            ForEach<T>.createNewChildFinish(id)
        }
        this.purgeDeletedElmtIds(setIdResult.removedChildElmtIds)
    }

    /**
     * observe component creation.
     *
     * @param { UpdateFuncNew } compilerAssignedUpdateFunc
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func observeComponentCreation(compilerAssignedUpdateFunc: UpdateFuncNew): Unit {
        let elmtId = ViewStackProcessor.AllocateNewElmetIdForNextComponent()
        ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
        compilerAssignedUpdateFunc(elmtId, true).initial()
        ViewStackProcessor.StopGetAccessRecording()
        updateFuncByElmtId_inner__.add(elmtId, compilerAssignedUpdateFunc)
        return
    }

    /**
     * observe recycle component creation.
     *
     * @param { String } name
     * @param { RecycleUpdateFunc } recycleUpdateFunc
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func observeRecycleComponentCreation(name: String, recycleUpdateFunc: RecycleUpdateFunc) {
        let compilerAssignedUpdateFunc: UpdateFuncNew = {
            elmtId: Int64, isFirstRender: Bool => recycleUpdateFunc(elmtId, isFirstRender, None)
        }
        let nodeOpt = (getRecycleManager()?.popRecycleNode(name)) ?? None
        if (!this.hasRecycleManager() || nodeOpt.isNone()) {
            compilerAssignedUpdateFunc(0, true)
            return
        }
        let node = nodeOpt.getOrThrow()
        let newElemtId = ViewStackProcessor.AllocateNewElmetIdForNextComponent()
        let oldElemtId = Int64(node.nativeView_inner__.getElementId())
        let recycleManager = recycleManager_.getOrThrow()
        recycleManager.updateNodeId(oldElemtId, newElemtId)
        node.hasBeenRecycled_ = false
        if (updateFuncByElmtId_inner__.contains(oldElemtId)) {
            updateFuncByElmtId_inner__[oldElemtId] = compilerAssignedUpdateFunc
        }
        ViewStackProcessor.StartGetAccessRecordingFor(newElemtId)
        recycleUpdateFunc(oldElemtId, true, node).initial()
        ViewStackProcessor.StopGetAccessRecording()
    }
    /**
     * Invoked when a reusable custom component is re-added to the node tree
     * from the reuse cache to receive construction parameters of the component.
     *
     * @param { ReuseParams } _ - Custom component init params.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func aboutToReuse(_: ReuseParams): Unit {} /*cjlint-ignore !G.FUNC.02 */
    /**
     * aboutToRecycle Method.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    protected open func aboutToRecycle(): Unit {}

    /**
     * internal func called when it is about to reuse.
     *
     * @param { ReuseParams } param
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public override func aboutToReuseInternal(param: ReuseParams): Unit {
        this.runReuse_ = true
        aboutToReuse(param)
        if (!this.delayRecycleNodeRerender_) {
            updateDirtyElements()
        } else {
            flushDelayCompleteRerender()
        }
        traverseChildDoRecycleOrReuse(false, param: param)
        runReuse_ = false
    }

    protected override func aboutToRecycleInternal(): Unit {
        runReuse_ = true
        aboutToRecycle()
        traverseChildDoRecycleOrReuse(true)
        runReuse_ = false
    }

    protected func getOrCreateRecycleManager(): RecycleManager {
        if (let Some(v) <- recycleManager_) {
            return v
        }
        recycleManager_ = RecycleManager()
        recycleManager_.getOrThrow()
    }

    protected func getRecycleManager(): ?RecycleManager {
        recycleManager_
    }

    protected func hasRecycleManager(): Bool {
        return recycleManager_.isSome()
    }

    protected override func recycleSelf(name: String) {
        match (parent_inner__) {
            case Some(v) =>
                v.getOrCreateRecycleManager().pushRecycleNode(name, this)
                hasBeenRecycled_ = true
            case None => resetRecycleCustomNode()
        }
    }

    protected func isRecycled(): Bool {
        hasBeenRecycled_
    }

    protected func traverseChildDoRecycleOrReuse(recycleOrReuse: Bool, param!: ReuseParams = ReuseParams([])): Unit {
        for (child in children_inner__.values()) {
            if (!child.hasBeenRecycled_) {
                if (recycleOrReuse) {
                    child.aboutToRecycleInternal()
                } else {
                    child.aboutToReuseInternal(param)
                }
            }
        }
    }

    protected func delayCompleteRerender(deep: Bool) {
        this.delayRecycleNodeRerender_ = true
        this.delayRecycleNodeRerenderDeep_ = deep
    }

    protected func flushDelayCompleteRerender() {
        this.forceCompleteRerender(this.delayRecycleNodeRerenderDeep_);
        this.delayRecycleNodeRerender_ = false
    }

    protected func resetRecycleCustomNode() {
        nativeView_inner__.resetRecycleCustomNode()
    }

    /**
     * Create recycle component.
     *
     * @param { CustomView } view
     * @param { Bool } isRecycling
     * @param { String } name
     * @param { () -> Unit } callback
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func createRecycle(view: CustomView, isRecycling: Bool, name: String, callback: () -> Unit) {
        View.createRecycle(view.getView(), isRecycling, name, callback)
    }

    /**
     * Create custom component.
     *
     * @param { CustomView } view
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public static func create(view: CustomView) {
        View.create(view.getView())
    }

    /**
     * Add provider state variable.
     *
     * @param { ObservedPropertyAbstract } value
     * @param { String } name
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func addProvideVar(value: ObservedPropertyAbstract, name: String) {
        this.provideVars_inner__.add(name, value)
    }

    /**
     * Initialize consume state variable.
     *
     * @param { String } name
     * @return { ObservedPropertyAbstract }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func initializeConsume(name: String): ObservedPropertyAbstract {
        match (provideVars_inner__.get(name)) {
            case Some(v) => return v
            case _ => throw BusinessException(10905304, "Missing @Provide property with name ${name}.")
        }
    }

    /**
     * notify read for state variable.
     *
     * @param { String } stateInfo
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func notifyRead(stateInfo: String): Unit {
        if (this.isRenderingInProgress_inner__) {
            propsUsedForRender_inner__.add(stateInfo)
        }
    }

    /**
     * notify update for state variable.
     *
     * @param { String } stateInfo
     * @param { ArrayList<Int64> } dependentElmtIds
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func onStateUpdate(stateInfo: String, dependentElmtIds: ArrayList<Int64>): Unit {
        nativeView_inner__.syncInstanceId()
        match (watchedProps_inner__.get(stateInfo)) {
            case Some(v) => v()
            case _ => ()
        }
        if (dependentElmtIds.size != 0 && !nativeView_inner__.isFirstRender()) {
            if (dirtDescendantElementIds_inner__.size == 0 && !runReuse_) {
                nativeView_inner__.markNeedUpdate()
            }
            for (elmtId in dependentElmtIds) {
                if (hasRecycleManager()) {
                    let rm = recycleManager_.getOrThrow()
                    dirtDescendantElementIds_inner__.add(rm.proxyNodeId(elmtId))
                } else {
                    dirtDescendantElementIds_inner__.add(elmtId)
                }
            }
        }
        nativeView_inner__.restoreInstanceId()
    }

    /**
     * Get component id.
     *
     * @return { Int64 }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func id(): Int64 {
        return compId_inner__
    }

    protected func markLazyForEachProcess(groupId: String): Unit {
        isLazyForEachProcess_inner__ = true
        lazyGroupId_inner__ = groupId
        if (!lazyGroups_inner__.contains(groupId)) {
            lazyGroups_inner__.add(groupId, ArrayList<String>())
        }
    }

    protected func resetLazyForEachProcess(): Unit {
        isLazyForEachProcess_inner__ = false
    }

    protected func removeChildGroupById(groupId: String): Bool {
        let optGroup = lazyGroups_inner__.remove(groupId)
        match (optGroup) {
            case Some(group) =>
                removeLazyGroup(group)
                true
            case _ => false
        }
    }

    private func removeLazyGroup(list: ArrayList<String>): Unit {
        for (viewId in list) {
            let optChild = lazyChildren_inner__.remove(viewId)
            match (optChild) {
                case Some(child) =>
                    child.nativeView_inner__.destroy()
                    ()
                case None => ()
            }
        }
    }

    /**
     * Add child by id.
     *
     * @param { Int64 } id
     * @param { CustomView } child
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func addChildById(id: Int64, child: CustomView): Unit {
        children_inner__.add(id, child)
    }

    protected func removeChildById(id: Int64): Bool {
        let child = children_inner__.remove(id)
        let res = child.isSome()
        if (res) {
            child?.setParent(Option.None)
        }
        return res
    }

    protected func getView(): View {
        nativeView_inner__
    }

    protected func setParent(parent: Option<CustomView>): Unit {
        this.parent_inner__ = parent
    }

    /**
     * Called when component is about to be deleted.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToBeDeleted(): Unit

    protected func aboutToBeDeletedInternal(): Unit {
        if (let Some(parent) <- parent_inner__) {
            parent.removeChildById(id())
        }
        if (hasRecycleManager()) {
            getRecycleManager().getOrThrow().purgeAllCachedRecycleNode()
        }
    }

    protected func onAboutToBeDeleted(): Unit {
        aboutToBeDeleted()
        children_inner__.clear()
        nativeView_inner__.release()
    }

    /**
     * update function for IfElse branch.
     *
     * @param { Int32 } branchId
     * @param { () -> Unit } branchFunc
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    @!Hide
    public func ifElseBranchUpdateFunction(branchId: Int32, branchFunc: () -> Unit) {
        let oldBranchId: Int32 = If.getBranchId()

        if (branchId == oldBranchId) {
            BaseLog.debug("IfElse branch unchanged, no work to do")
            return
        }

        If.branchId(branchId)
        branchFunc()
    }

    /**
     * get UIContext from current environment.
     *
     * @returns { UIContext } - The UIContext instance for the current component.
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getUIContext(): UIContext {
        UIContext(nativeView_inner__.getID())
    }
}
