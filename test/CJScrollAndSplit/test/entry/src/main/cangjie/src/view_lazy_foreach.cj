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

package ohos_app_cangjie_entry

import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.component.lazy_for_each.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.{ ArrayList, HashMap }

public class Student {
    public Student(
        let name: String,
        let id: Int64
    ) {}
}

class StudentDataSource <: IDataSource<Student> {
    public StudentDataSource(let data_: ArrayList<Student>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): Student {
        return data_[index]
    }

    public func registerDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func notifyChangeAll(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyRemove(index: Int64): Unit {
    let listener: DataChangeListener = listenerOp.getOrThrow()
    listener.onDataDelete(IntNative(index))
    }

    public func notifyInsert(index: Int64): Unit {
    let listener: DataChangeListener = listenerOp.getOrThrow()
    listener.onDataAdd(IntNative(index))
    }

    public func notifyMove(index1: Int64, index2: Int64): Unit {
    let listener: DataChangeListener = listenerOp.getOrThrow()
    listener.onDataMove(IntNative(index1), IntNative(index2))
    }

    public func notifyChange(index: Int64): Unit {
    let listener: DataChangeListener = listenerOp.getOrThrow()
    listener.onDataChange(IntNative(index))
    }
}

func getDS(): StudentDataSource {
    let data: ArrayList<Student> = ArrayList<Student>()
    for (i in 0..50) {
        data.add(Student("name ${i}", i * i))
    }
    let dataSourceStu: StudentDataSource = StudentDataSource(data)
    return dataSourceStu
}

let dataSourceStu: StudentDataSource = getDS()
var changeID: Int64 = 0

@Entry
@Component
public class ViewLazyforeach {
    public func build(): Unit {
        Column(space: 30) {
            Text("-----------------")
            Column {
                LazyForEach(
                    dataSourceStu,
                    itemGeneratorFunc: {
                        stu: Student, idx: Int64 => Column {
                            Text(stu.name).id("my_text_${idx}")
                        }
                    }
                )
            }.height(400.0)

            Text("click to notifyChange").onClick(
                {
                    evt =>
                    dataSourceStu.data_.remove(at: 3)
                    dataSourceStu.notifyRemove(3)
                    dataSourceStu.data_[5] =  Student("Yigao", 10086)
                    dataSourceStu.notifyChange(5)
                    dataSourceStu.data_.add( Student("xiaoming", 10086), at:changeID)
                    dataSourceStu.notifyInsert(changeID)
                    let temp = dataSourceStu.data_[7]
                    dataSourceStu.data_[7] = dataSourceStu.data_[8]
                    dataSourceStu.data_[8] = temp
                    dataSourceStu.notifyMove(7, 8)
                    dataSourceStu.notifyChangeAll()
                    changeID += 1
                }
            ).id("my_text")
        }
    }
}
