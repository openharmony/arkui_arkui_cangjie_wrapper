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

import std.collection.HashMap
import std.collection.ArrayList

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class RecycleManager {
    private let cachedRecycleNodes: HashMap<String, ArrayList<CustomView>>
    private let biMap: BidirectionalMap

    public init() {
        cachedRecycleNodes = HashMap<String, ArrayList<CustomView>>()
        biMap = BidirectionalMap()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func updateNodeId(oldElmtId: Int64, newElmtId: Int64) {
        biMap.remove(oldElmtId)
        biMap.put((oldElmtId, newElmtId))
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func proxyNodeId(oldElmtId: Int64): Int64 {
        let proxy = biMap.get(oldElmtId)
        if (let Some(v) <- proxy) {
            return v
        }
        return oldElmtId
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func pushRecycleNode(name: String, node: CustomView) {
        if (!cachedRecycleNodes.contains(name)) {
            cachedRecycleNodes.add(name, ArrayList<CustomView>([]))
        }
        if (let Some(arr) <- cachedRecycleNodes.get(name)) {
            arr.add(node)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func popRecycleNode(name: String): ?CustomView {
        let arr = cachedRecycleNodes.get(name) ?? return None
        if (arr.size > 0) {
            return arr.remove(at: arr.size - 1)
        }
        None
    }

    // When parent View is deleted, release all cached nodes
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func purgeAllCachedRecycleNode() {
        for ((key, arr) in cachedRecycleNodes) {
            for (node in arr) {
                node.resetRecycleCustomNode()
            }
        }
        cachedRecycleNodes.clear()
    }
}

class BidirectionalMap {
    private let fwdMap: HashMap<Int64, Int64>
    private let revMap: HashMap<Int64, Int64>

    init() {
        fwdMap = HashMap<Int64, Int64>()
        revMap = HashMap<Int64, Int64>()
    }

    func remove(key: Int64): Unit {
        if (!fwdMap.contains(key)) {
            return
        }
        let rev = fwdMap.get(key).getOrThrow()
        fwdMap.remove(key)
        revMap.remove(key)
        ()
    }

    func get(key: Int64): ?Int64 {
        let fwdVal = fwdMap.get(key)
        let revVal = revMap.get(key)
        if (let Some(v) <- fwdVal) {
            return v
        }
        if (let Some(v) <- revVal) {
            return v
        }
        return None
    }

    func put(pair: (Int64, Int64)) {
        fwdMap[pair[0]] = pair[1]
        revMap[pair[1]] = pair[0]
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ReuseParams <: FFIData {
    private var maps: HashMap<String, Any>

    public init() {
        super()
        maps = HashMap<String, Any>()
    }

    // used by @Component
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arr: Array<(String, Any)>) {
        super()
        maps = HashMap<String, Any>(arr.size, {
            i => (arr[i][0], arr[i][1])
        })
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public prop size: Int64 {
        get() {
            maps.size
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get(key: String): ?Any {
        maps.get(key)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func getValue<T>(key: String): ?T {
        let anyVal = maps.get(key)
        if (let Some(v) <- anyVal) {
            return (v as T) ?? Option<T>.None
        }
        Option<T>.None
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func contains(key: String): Bool {
        maps.contains(key)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func add(key: String, value: Any): ?Any {
        maps.add(key, value)
    }
}
