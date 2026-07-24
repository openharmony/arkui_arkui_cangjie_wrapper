package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList
import kit.PerformanceAnalysisKit.Hilog
import kit.LocalizationKit.*

class MyDataSourceMul <: IDataSource<String> {
    public MyDataSourceMul() {}
    private var dataArray: ArrayList<String> = ArrayList<String>()
    private var listenerOp: Option<DataChangeListener> = None

    public func totalCount(): Int64 {
        return dataArray.size
    }

    public func getData(index: Int64): String {
        return dataArray[index]
    }

    public func pushData(data: String): Unit {
        dataArray.add(data)
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
class View_Multitype {
    let data: MyDataSourceMul = MyDataSourceMul()
    let scroller: Scroller = Scroller()

    protected override func aboutToAppear() {
        for (i in 0..20) {
            data.pushData("${i}")
        }
    }

    @Builder
    func itemBuilderOne(item: String) {
        Column() {
            ChildComponentA(item: item)
            ChildComponentB(item: item)
            ChildComponentC(item: item)
        }
    }

    @Builder
    func itemBuilderTwo(item: String) {
        Column() {
            ChildComponentA(item: item)
            ChildComponentC(item: item)
            ChildComponentD(item: item)
        }
    }

    @Builder
    func itemBuilderThree(item: String) {
        Column() {
            ChildComponentA(item: item)
            ChildComponentB(item: item)
            ChildComponentD(item: item)
        }
    }

    public func build() {
        Column() {
            Button("Scroller").id("reuse_mul_scroller")
            .onClick({e=>
                this.scroller.scrollEdge(Edge.Bottom)
            })
            List(space: 40, scroller: scroller) {
            LazyForEach(
                data,
                itemGenerator: { item: String, index: Int64 =>
                    ListItem() {
                        if (index % 3 == 0) {
                            itemBuilderOne(item)
                        } else if (index % 5 == 0) {
                            itemBuilderTwo(item)
                        } else {
                            itemBuilderThree(item)
                        }
                    }
                    .backgroundColor(0xFFCCCCCC)
                    .width(100.percent)
                    .onAppear({ =>
                        Hilog.info(0, "Sample_ReusableComponent", "ListItem ${index} onAppear")
                    })
                }
            )
        }
            .width(100.percent)
            .height(100.percent)
            .cachedCount(0)
        }

    }
}

@Reusable
@Component
class ChildComponentA {
    @State var item: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        Hilog.info(0, "Sample_ReusableComponent", "ChildComponentA Reuse")
        if (let Some(value) <- params.get<String>("item")) {
            item = value
        }
    }

    protected override func aboutToRecycle() {
        Hilog.info(0, "Sample_ReusableComponent", "ChildComponentA Recycle")
    }

    func build() {
        Column() {
            Text("Item ${item} Child Component A")
                .fontSize(20)
                .margin(left: 10)
                .fontColor(Color.Blue)
                .id("compA_${item}")
            Grid() {
                ForEach([1,2,3,4,5,6,7,8,9], itemGenerator: { item: Int64, index: Int64 =>
                    GridItem() {
                        Image(@r(app.media.startIcon))
                            .height(20)
                    }
                })
            }
            .columnsTemplate("1fr 1fr 1fr 1fr 1fr")
            .rowsTemplate("1fr 1fr 1fr 1fr")
            .columnsGap(10)
            .width(90.percent)
            .height(160)
        }
        .margin(left: 10, right: 10)
        .backgroundColor(0xFAEEE0)
    }
}

@Reusable
@Component
class ChildComponentB {
    @State var item: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        if (let Some(value) <- params.get<String>("item")) {
            item = value
        }
    }

    func build() {
        Row() {
            Text("Item ${item} Child Component B")
                .fontSize(20)
                .margin(left: 10)
                .fontColor(Color.Red)
        }
        .margin(left: 10, right: 10)
    }
}

@Reusable
@Component
class ChildComponentC {
    @State var item: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        if (let Some(value) <- params.get<String>("item")) {
            item = value
        }
    }

    func build() {
        Row() {
            Text("Item ${item} Child Component C")
                .fontSize(20)
                .margin(left: 10)
                .fontColor(Color.Green)
        }
        .margin(left: 10, right: 10)
    }
}

@Reusable
@Component
class ChildComponentD {
    @State var item: String = ""

    protected override func aboutToReuse(params: ReuseParams) {
        if (let Some(value) <- params.get<String>("item")) {
            item = value
        }
    }

    func build() {
        Row() {
            Text("Item ${item} Child Component D")
                .fontSize(20)
                .margin(left: 10)
                .fontColor(Color.Green)
        }
        .margin(left: 10, right: 10)
    }
}