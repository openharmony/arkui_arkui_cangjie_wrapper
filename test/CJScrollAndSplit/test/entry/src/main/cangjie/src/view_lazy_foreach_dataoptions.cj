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

let datasetSourceStu: StudentDatasetSource = getDatasetStudent()
var datasetSourceCnt = 0

class StudentDatasetSource <: IDataSource<Student> {
    public StudentDatasetSource(let data_: ArrayList<Student>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        Hilog.info(1, "info", "totalCount = ${data_.size}")
        return data_.size
    }
    public func getData(index: Int64): Student {
        Hilog.info(1, "info", "getData index = ${index}")
        return data_[index]
    }

    public func registerDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func notifyChange(): Unit {
    }
}

func getDatasetStudent(): StudentDatasetSource
{
    let data: ArrayList<Student> = ArrayList<Student>()
    for (i in 0..50) {
        data.add(Student("name ${i}", i * i))
    }
    let dataSourceStu: StudentDatasetSource = StudentDatasetSource(data)
    return dataSourceStu
}

@Entry
@Component
public class ViewLazyforeachDataOptions {
    @State var msg: String = ""
    public func build(): Unit {
        Column(space: 30) {
            Text("-----------------")
            List() {
                LazyForEach(datasetSourceStu, itemGeneratorFunc: {stu: Student, idx: Int64 =>
                    ListItem {
                        Text(stu.name).id("stu ${idx}")
                    }
                })
            }.height(400.px)

            Text("click to notifyChange").onClick({ evt =>
                dataSourceStu.data_.add(Student("xiaoming", 10086), at: 0)
                datasetSourceStu.notifyChange()
                datasetSourceCnt++
            }).id('notifyChange')

            Text(this.msg).id("msg")
            Button("verify").onClick({ evt =>
                this.msg = "2:${dataSourceStu.data_[2].name},3:${dataSourceStu.data_[3].name},4:${dataSourceStu.data_[4].name},"
                this.msg += "5:${dataSourceStu.data_[5].name},11:${dataSourceStu.data_[11].name},12:${dataSourceStu.data_[12].name}"
            }).id('verify')
        }
    }
}
