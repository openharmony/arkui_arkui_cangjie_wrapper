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

import ohos.state_manage.*
import std.sort.*

foreign func FfiOHOSAceFrameworkLoadNativeView(view: Int64): Bool

foreign func FfiOHOSAceFrameworkProcessViewId(view: Int64): ExternalString

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public func loadNativeView(view: CustomView): Bool {
    FFIDataManager.getInstance().register(view)
    unsafe {
        FfiOHOSAceFrameworkLoadNativeView(view.getView().getID())
    }
}

type UpdateFuncNew = (Int64, Bool) -> ComponentRender

type RecycleUpdateFunc = (Int64, Bool, ?CustomView) -> ComponentRender

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public abstract class CustomView <: RemoteView & Observer {
    @!APILevel[
        16,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public let nativeView: View

    private let compId_: Int64

    private var provideVars_ = HashMap<String, ObservedPropertyAbstract>()
    private let watchedProps_ = HashMap<String, () -> Unit>()

    protected var dirtDescendantElementIds_ = HashSet<Int64>()
    private var propsUsedForRender = HashSet<String>()
    private var isRenderingInProgress: Bool = false
    protected var updateFuncByElmtId = HashMap<Int64, UpdateFuncNew>()

    private var children_: HashMap<Int64, CustomView> = HashMap<Int64, CustomView>()

    private let lazyChildren_ = HashMap<String, CustomView>()
    private let lazyGroups_ = HashMap<String, ArrayList<String>>()
    private var isLazyForEachProcess_ = false
    private var lazyGroupId_: String = ""
    private var localStorage_: Option<LocalStorage> = None
    private var parent_: Option<CustomView> = None

    public var isReusable: Bool = false
    private var recycleManager_: ?RecycleManager = None
    private var hasBeenRecycled_: Bool = false
    private var delayRecycleNodeRerender: Bool = false
    private var delayRecycleNodeRerenderDeep: Bool = false
    private var runReuse_: Bool = false

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(parent: Option<CustomView>, localStorage: Option<LocalStorage>) {
        super()
        nativeView = View.create(id_)
        compId_ = SubscriberManager.getInstance().makeId()
        provideVars_.add(all: parent?.provideVars_ ?? HashMap<String, ObservedPropertyAbstract>())
        parent_ = parent
        localStorage_ = localStorage
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getLocalStorage(): LocalStorage {
        if (localStorage_.isNone() && parent_.isSome()) {
            localStorage_ = parent_.getOrThrow().getLocalStorage()
        }
        if (localStorage_.isNone()) {
            localStorage_ = LocalStorage()
        }
        localStorage_.getOrThrow()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func declareWatch<T>(propMember: ObservedProperty<T>, callBack: () -> Unit) {
        match (propMember.getInner() as ObservedComplexAbstract) {
            case Some(value) =>
                watchedProps_.add(value.getInfo(), callBack)
                let propsInfo = value.getPropsInfo()
                for (info in propsInfo) {
                    watchedProps_.add(info, callBack)
                }
            case None => ()
        }

        match (propMember as ObservedPropertyAbstract) {
            case Some(value) => watchedProps_.add(value.getInfo(), callBack)
            case None => ()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func build(): Unit

    protected func initialRenderView(): Unit {
        this.build()
    }

    protected override func onAboutToRender(): Unit {
        isRenderingInProgress = true
        propsUsedForRender.clear()
    }

    protected override func onAfterRender(): Unit {
        isRenderingInProgress = false
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func forceCompleteRerender(deep: Bool): Unit {
        let arr = this.updateFuncByElmtId.keys().toArray()
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
            for (child in children_.values()) {
                if (!child.isRecycled()) {
                    child.forceCompleteRerender(true)
                } else {
                    child.delayCompleteRerender(deep)
                }
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateElement(elmtId: Int64): Unit {
        if (elmtId == id()) {
            return
        }
        match (updateFuncByElmtId.get(elmtId)) {
            case None => BaseLog.error("update function of ElementId ${elmtId} not found, internal error!")
            case Some(updateFunc) =>
                ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
                updateFunc(elmtId, false).update()
                ViewStackProcessor.StopGetAccessRecording()
                nativeView.finishUpdateFunc(elmtId)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateDirtyElements() {
        do {
            let deletedElmtIds = nativeView.getDeletedElemtIds()
            this.purgeDeletedElmtIds(deletedElmtIds)
            let arr = dirtDescendantElementIds_.toArray()
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
                this.dirtDescendantElementIds_.remove(elmtId)
            }
        } while (this.dirtDescendantElementIds_.size > 0)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func purgeDeletedElmtIds(rmElmtIds: ArrayList<Int64>) {
        if (rmElmtIds.size == 0) {
            return
        }

        let removedElmtIds: ArrayList<Int64> = ArrayList<Int64>()

        for (elmtId in rmElmtIds) {
            match (updateFuncByElmtId.remove(elmtId)) {
                case None => ()
                case _ =>
                    purgeVariableDependenciesOnElmtId(elmtId)
                    removedElmtIds.add(elmtId)
            }
        }
        nativeView.deletedElmtIdsHaveBeenPurged(removedElmtIds);
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func forEachUpdateFunction<T>(
        elmtId: Int64,
        arr: ArrayLike<T>,
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
        let setIdResult = ForEach.setIdArray(elmtId, newIdArray)
        let diffIndexArray = setIdResult.diffIndexArray
        for (idx in diffIndexArray) {
            let id = newIdArray[idx]
            ForEach.createNewChildStart(id)
            itemGenFunc(arr[idx], idx)
            ForEach.createNewChildFinish(id)
        }
        this.purgeDeletedElmtIds(setIdResult.removedChildElmtIds)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func observeComponentCreation(compilerAssignedUpdateFunc: UpdateFuncNew): Unit {
        let elmtId = ViewStackProcessor.AllocateNewElmetIdForNextComponent()
        ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
        compilerAssignedUpdateFunc(elmtId, true).initial()
        ViewStackProcessor.StopGetAccessRecording()
        updateFuncByElmtId.add(elmtId, compilerAssignedUpdateFunc)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
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
        let oldElemtId = Int64(node.nativeView.getElementId())
        let recycleManager = recycleManager_.getOrThrow()
        recycleManager.updateNodeId(oldElemtId, newElemtId)
        node.hasBeenRecycled_ = false
        if (updateFuncByElmtId.contains(oldElemtId)) {
            updateFuncByElmtId[oldElemtId] = compilerAssignedUpdateFunc
        }
        ViewStackProcessor.StartGetAccessRecordingFor(newElemtId)
        recycleUpdateFunc(oldElemtId, true, node).initial()
        ViewStackProcessor.StopGetAccessRecording()
    }

    protected open func aboutToReuse(_: ReuseParams): Unit {} /*cjlint-ignore !G.FUNC.02 */
    protected open func aboutToRecycle(): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func aboutToReuseInternal(param: ReuseParams): Unit {
        this.runReuse_ = true
        aboutToReuse(param)
        if (!this.delayRecycleNodeRerender) {
            updateDirtyElements()
        } else {
            flushDelayCompleteRerender()
        }
        traverseChildDoRecycleOrReuse(false, param: param)
        runReuse_ = false
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public override func aboutToRecycleInternal(): Unit {
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
        match (parent_) {
            case Some(v) =>
                v.getOrCreateRecycleManager().pushRecycleNode(name, this)
                hasBeenRecycled_ = true
            case None => resetRecycleCustomNode()
        }
    }

    protected func isRecycled(): Bool {
        hasBeenRecycled_
    }

    protected func traverseChildDoRecycleOrReuse(recycleOrReuse: Bool, param!: ReuseParams = ReuseParams()): Unit {
        for (child in children_.values()) {
            if (!child.hasBeenRecycled_) {
                if (recycleOrReuse) {
                    child.aboutToRecycleInternal()
                } else {
                    child.aboutToReuseInternal(param)
                }
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func delayCompleteRerender(deep: Bool) {
        this.delayRecycleNodeRerender = true
        this.delayRecycleNodeRerenderDeep = deep
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func flushDelayCompleteRerender() {
        this.forceCompleteRerender(this.delayRecycleNodeRerenderDeep);
        this.delayRecycleNodeRerender = false
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resetRecycleCustomNode() {
        nativeView.resetRecycleCustomNode()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func createRecycle(view: CustomView, isRecycling: Bool, name: String, callback: () -> Unit) {
        View.createRecycle(view.getView(), isRecycling, name, callback)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func create(view: CustomView) {
        View.create(view.getView())
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addProvideVar(value: ObservedPropertyAbstract, name: String) {
        this.provideVars_.add(name, value)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func initializeConsume(name: String): ObservedPropertyAbstract {
        match (provideVars_.get(name)) {
            case Some(v) => return v
            case _ => throw NoneValueException("missing @Provide property with name ${name}.")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateUpdate(stateInfo: String): Unit {
        nativeView.syncInstanceId()
        match (watchedProps_.get(stateInfo)) {
            case Some(v) => v()
            case _ => ()
        }
        if (propsUsedForRender.contains(stateInfo)) {
            nativeView.markNeedUpdate()
        }
        nativeView.restoreInstanceId()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func notifyRead(stateInfo: String): Unit {
        if (this.isRenderingInProgress) {
            propsUsedForRender.add(stateInfo)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func onStateUpdate(stateInfo: String, dependentElmtIds: ArrayList<Int64>): Unit {
        nativeView.syncInstanceId()
        match (watchedProps_.get(stateInfo)) {
            case Some(v) => v()
            case _ => ()
        }
        if (dependentElmtIds.size != 0 && !nativeView.isFirstRender()) {
            if (dirtDescendantElementIds_.size == 0 && !runReuse_) {
                nativeView.markNeedUpdate()
            }
            for (elmtId in dependentElmtIds) {
                if (hasRecycleManager()) {
                    let rm = recycleManager_.getOrThrow()
                    dirtDescendantElementIds_.add(rm.proxyNodeId(elmtId))
                } else {
                    dirtDescendantElementIds_.add(elmtId)
                }
            }
        }
        nativeView.restoreInstanceId()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func id(): Int64 {
        return compId_
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func markLazyForEachProcess(groupId: String): Unit {
        isLazyForEachProcess_ = true
        lazyGroupId_ = groupId
        if (!lazyGroups_.contains(groupId)) {
            lazyGroups_.add(groupId, ArrayList<String>())
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func resetLazyForEachProcess(): Unit {
        isLazyForEachProcess_ = false
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeChildGroupById(groupId: String): Bool {
        let optGroup = lazyGroups_.remove(groupId)
        match (optGroup) {
            case Some(group) =>
                removeLazyGroup(group)
                true
            case _ => false
        }
    }

    private func removeLazyGroup(list: ArrayList<String>): Unit {
        for (viewId in list) {
            let optChild = lazyChildren_.remove(viewId)
            match (optChild) {
                case Some(child) =>
                    child.nativeView.destroy()
                    ()
                case None => ()
            }
        }
    }

    private func processViewId(id: Int64): String {
        let unsafeStr = unsafe {
            FfiOHOSAceFrameworkProcessViewId(id)
        }

        var res = unsafeStr.toString()
        unsafe { unsafeStr.free() }
        res
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func addChildById(id: Int64, child: CustomView): Unit {
        children_.add(id, child)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func removeChildById(id: Int64): Bool {
        let child = children_.remove(id)
        let res = child.isSome()
        if (res) {
            child?.setParent(Option.None)
        }
        return res
    }

    protected func getView(): View {
        nativeView
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setParent(parent: Option<CustomView>): Unit {
        this.parent_ = parent
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func aboutToBeDeleted(): Unit

    protected func aboutToBeDeletedInternal(): Unit {
        if (let Some(parent) <- parent_) {
            parent.removeChildById(id())
        }
        if (hasRecycleManager()) {
            getRecycleManager().getOrThrow().purgeAllCachedRecycleNode()
        }
    }

    protected func onAboutToBeDeleted(): Unit {
        aboutToBeDeleted()
        children_.clear()
        nativeView.release()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func ifElseBranchUpdateFunction(branchId: Int32, branchFunc: () -> Unit) {
        let oldBranchId: Int32 = If.getBranchId()

        if (branchId == oldBranchId) {
            BaseLog.debug("IfElse branch unchanged, no work to do")
            return
        }

        If.branchId(branchId)
        branchFunc()
    }
}
