package ohos.base

import std.collection.HashMap
import ohos.labels.APILevel

/**
 * Defines class ReuseParams.
 */
@!APILevel[
    22,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class ReuseParams {
    private var maps: HashMap<String, Any>

    /**
     * ReuseParams constructor.
     *
     * @params { Array<(String, Any)> } arr
     * @returns { This }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public init(arr: Array<(String, Any)>) {
        maps = HashMap<String, Any>(arr.size, {
            i => (arr[i][0], arr[i][1])
        })
    }

    protected prop size: Int64 {
        get() {
            maps.size
        }
    }

    /**
     *
     * @params { String } key
     * @returns { ?T }
     */
    @!APILevel[
        22,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func get<T>(key: String): ?T {
        let anyVal = maps.get(key)
        if (let Some(v) <- anyVal) {
            return (v as T) ?? Option<T>.None
        }
        Option<T>.None
    }

    protected func contains(key: String): Bool {
        maps.contains(key)
    }

    protected func add(key: String, value: Any): ?Any {
        maps.add(key, value)
    }
}
