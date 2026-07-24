package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

class MyDataSourceLz <: IDataSource<Int64> {
    public MyDataSourceLz(let data_: ArrayList<Int64>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): Int64 {
        return data_[index]
    }

    public func pushData(val: Int64): Unit {
        data_.add(val)
    }

    public func registerDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func unregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }
}

@Entry
@Component
public class View_Lazyforeach {
    let scroller: Scroller = Scroller()
    let data: MyDataSourceLz = MyDataSourceLz(ArrayList<Int64>([]))
    protected override func aboutToAppear() {
        for (i in 0..50) {
            data.pushData(i)
        }
    }

    public func build(): Unit {
        Column() {
            Button("Scroller").id("reuse_lazy_scroller").onClick({e=>
                this.scroller.scrollEdge(Edge.Bottom)
            })
            List(scroller: scroller) {
                LazyForEach(
                    data,
                    itemGenerator: {
                        item: Int64, idx: Int64 => ListItem() {
                            CardView(item: "${item}")
                        }
                    }
                )
            }
        }
    }
}

@Reusable
@Component
class CardView {
    @State
    var item: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        if (let Some(value) <- params.get<String>("item")) {
            item = value
        }
    }

    func build() {
        Column() {
            Text(item).fontSize(30).id("CardView_${item}")
            Child(childItem: item)
        }.borderWidth(1).height(100)
    }
}

@Component
class Child {
    @State
    var childItem: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        if (let Some(v) <- params.get<String>("childItem")) {
            childItem = v
        }
    }

    func build() {
        Column() {
            Text("Child_" + childItem).fontSize(30).id("Child_${childItem}")
        }
    }
}