/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.lazy_for_each.*
import std.collection.*

/**
 * 简单的 IDataSource 实现，用于测试
 */
class SimpleDataSource<T> <: IDataSource<T> {
    private let data_: ArrayList<T>
    public var listenerOp: Option<DataChangeListener> = None
    
    public init(data: ArrayList<T>) {
        this.data_ = data
    }
    
    public func totalCount(): Int64 {
        return this.data_.size
    }
    
    public func getData(index: Int64): T {
        return this.data_[index]
    }
    
    public func registerDataChangeListener(listener: DataChangeListener): Unit {
        this.listenerOp = Some(listener)
    }
    
    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
        this.listenerOp = None
    }
    
    // 辅助方法：通知数据变化
    public func notifyDataAdd(index: Int64): Unit {
        match (this.listenerOp) {
            case Some(listener) => listener.onDataAdd(IntNative(index))
            case None => ()
        }
    }
    
    public func notifyDataDelete(index: Int64): Unit {
        match (this.listenerOp) {
            case Some(listener) => listener.onDataDelete(IntNative(index))
            case None => ()
        }
    }
    
    public func notifyDataChange(index: Int64): Unit {
        match (this.listenerOp) {
            case Some(listener) => listener.onDataChange(IntNative(index))
            case None => ()
        }
    }
    
    public func notifyDataMove(from: Int64, to: Int64): Unit {
        match (this.listenerOp) {
            case Some(listener) => listener.onDataMove(IntNative(from), IntNative(to))
            case None => ()
        }
    }
    
    public func notifyDataReloaded(): Unit {
        match (this.listenerOp) {
            case Some(listener) => listener.onDataReloaded()
            case None => ()
        }
    }
}

