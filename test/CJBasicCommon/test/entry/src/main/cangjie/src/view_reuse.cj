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
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

public class Student1 {
    public Student1(
        let name: String,
        let id: Int64
    ) {}
}

class Student1DataSource <: IDataSource<Student1> {
    public Student1DataSource(let data_: ArrayList<Student1>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): Student1 {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func notifyChangeAll(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }

    public func notifyRemove(index: Int64): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataDelete(index)
    }

    public func notifyInsert(index: Int64): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataAdd(index)
    }

    public func notifyMove(index1: Int64, index2: Int64): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataMove(index1, index2)
    }

    public func notifyChange(index: Int64): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataChange(index)
    }
}

func getDS1(): Student1DataSource {
    let data: ArrayList<Student1> = ArrayList<Student1>()
    for (i in 0..500) {
        data.add(Student1("name ${i}", i * i))
    }
    let dataSourceStu1: Student1DataSource = Student1DataSource(data)
    return dataSourceStu1
}

let dataSourceStu1: Student1DataSource = getDS1()

@Entry
@Component
public class View_Reuse {
    protected override func onDidBuild() {
        Hilog.info(1, "1", "Cangjie-App", "### onDidBuild")
    }
    public func build(): Unit {
        Column() {
            List() {
                //                LazyForEach(
                //                    dataSourceStu1,
                //                    itemGeneratorFunc: {
                //                        stu: Student1, idx: Int64 => ListItem() {
                //                            Child(name: "${idx}", idx: idx)
                //                        }
                //                    }
                //                )
            }
        }
    }
}

@Reusable
@Component
class Child {
    @State
    var name: String = ""
    @State
    var idx: Int64 = 0
    protected override func onDidBuild() {
        Hilog.info(1, "1", "Cangjie-App", "## onDidBuild")
    }
    protected override func aboutToReuse(val: ReuseParams) {
        if (val.contains("name")) {
            let nameVal = val.get("name").getOrThrow()
            this.name = nameVal as String ?? "None"
            Hilog.info(1, "1", "Cangjie-App", "### aboutToReuse name ${name}")
        }
        if (val.contains("idx")) {
            let idxVal = val.get("idx").getOrThrow()
            this.idx = idxVal as Int64 ?? 0
            Hilog.info(1, "1", "Cangjie-App", "### aboutToReuse idx ${idx}")
        }
    }
    protected override func aboutToRecycle() {
        Hilog.info(1, "1", "Cangjie-App", "### aboutToRecycle")
    }
    func build() {
        Column() {
            Text("name: ${name} idx: ${idx}").fontSize(30)
        }.borderWidth(1).margin(bottom: 10)
    }
}
