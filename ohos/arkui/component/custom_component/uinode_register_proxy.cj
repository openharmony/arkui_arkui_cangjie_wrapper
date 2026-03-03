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

import ohos.arkui.state_management.{ViewStackProcessor}
import ohos.labels.{APILevel, Hide}
import std.collection.{HashMap, ArrayList}

func uiNodeCleanUpIdleTask(maxTimeInMs: Int64): Unit {
    UINodeRegisterProxy.obtainDeletedElmtIds()
    UINodeRegisterProxy.unregisterElmtIdsFromIViews()
}

@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public func uiNodeCleanUpByElmtId(elmtId: Int64): Unit {
    UINodeRegisterProxy.unregisterElmtIdsFromIViewsById(elmtId)
}


@!APILevel[
    since: "22",
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
@!Hide
public func dumpElementIdToOwningViewPUSize(): Int64 {
    UINodeRegisterProxy.elementIdToOwningViewPUSize()
}

/**
 * UINodeRegisterProxy singleton class
 *
 * Acts on behalf of ElementRegister to hold elmtIds of deleted UINodes
 * until these get unregistered from a CustomView.
 */
protected class UINodeRegisterProxy {
    private static let INSTANCE_ = UINodeRegisterProxy()
    private var removeElementsInfo_ = ArrayList<Int64>()
    private static let ELEMENT_ID_TO_OWNING_VIEW_PU_ = HashMap<Int64, CustomView>()

    protected init() {
    }

    /**
     * Get the singleton instance.
     */
    protected static func getInstance(): UINodeRegisterProxy {
        return INSTANCE_
    }

    /**
     * Register element ID to owning view mapping.
     */
    protected static func registerElementId(elmtId: Int64, view: CustomView): Unit {
        ELEMENT_ID_TO_OWNING_VIEW_PU_.add(elmtId, view)
    }

    /**
     * Unregister element ID from owning view mapping.
     */
    protected static func unregisterElementId(elmtId: Int64): Unit {
        ELEMENT_ID_TO_OWNING_VIEW_PU_.remove(elmtId)
    }

    /**
     * Static method to obtain deleted element IDs from native side.
     */
    protected static func obtainDeletedElmtIds(): Unit {
        INSTANCE_.obtainDeletedElmtIdsInner()
    }

    /**
     * Static method to unregister element IDs from all views.
     */
    protected static func unregisterElmtIdsFromIViews(): Unit {
        INSTANCE_.unregisterElmtIdsFromIViewsInner()
    }

    /**
     * Static method to unregister element IDs from views by ID.
     */
    protected static func unregisterElmtIdsFromIViewsById(elmtId: Int64): Unit {
        INSTANCE_.unregisterElmtIdsFromIViewsByIdInner(elmtId)
    }

    /**
     * Unregisters all the received removedElements in func parameter.
     */
    protected static func unregisterRemovedElmtsFromViewPUs(removedElements: ArrayList<Int64>): Unit {
        INSTANCE_.populateRemoveElementInfo(removedElements)
        INSTANCE_.unregisterElmtIdsFromIViewsInner()
    }

    /**
     * Obtain elementIdToOwningViewPU size.
     */
    protected static func elementIdToOwningViewPUSize(): Int64 {
        ELEMENT_ID_TO_OWNING_VIEW_PU_.size
    }

    /**
     * Populate remove element info from the given array.
     */
    private func populateRemoveElementInfo(removedElements: ArrayList<Int64>): Unit {
        for (elmtId in removedElements) {
            this.removeElementsInfo_.add(elmtId)
        }
    }

    /**
     * Obtain deleted element IDs from native side (instance method).
     */
    private func obtainDeletedElmtIdsInner(): Unit {
        this.removeElementsInfo_ = ViewStackProcessor.moveDeletedElmtIds()
    }

    /**
     * Unregister element IDs from all views (instance method).
     */
    private func unregisterElmtIdsFromIViewsInner(): Unit {
        if (this.removeElementsInfo_.size == 0) {
            return
        }
        for (elmtId in this.removeElementsInfo_) {
            match (ELEMENT_ID_TO_OWNING_VIEW_PU_.remove(elmtId)) {
                case Some(owningView) =>
                    owningView.purgeDeleteElmtId(elmtId)
                case None => ()
            }
        }
        this.removeElementsInfo_.clear()
    }

    /**
     * Unregister element ID.
     */
    private func unregisterElmtIdsFromIViewsByIdInner(removeId: Int64): Unit {
        match (ELEMENT_ID_TO_OWNING_VIEW_PU_.remove(removeId)) {
            case Some(owningView) =>
                owningView.purgeDeleteElmtId(removeId)
            case None => ()
        }
    }
}

