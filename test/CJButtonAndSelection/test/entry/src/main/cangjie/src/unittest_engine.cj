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

import ohos.application.test_runner.TestRunner
import ohos.hilog.*
import ohos.app.ability.ability_delegator_registry.AbilityDelegatorRegistry
import std.unittest.XmlReporter
import std.collection.filter
import std.fs
import std.collection.first
import std.collection.{forEach, none}
import std.convert.Parsable
import ohos.bundle.bundle_manager.BundleManager
import ohos.bundle.bundle_manager.BundleFlag
import std.collection.any
import std.collection.HashMap
import std.unittest.TestClass
import std.collection.HashSet
import std.collection.ArrayList
import std.unittest.TestSuite
import ohos.app.ability.want.Want
import std.process.Process
import ohos.arkui.component.line.Line
import std.unittest.common.Configuration
import ohos.ark_interop.*
import ohos.arkui.state_management.AppStorage
import std.sync.*
import ohos.ui_test.*
import stdx.encoding.json.*
import ohos.arkui.component.common.getInspectorByKey
import ohos.ui_test
import std.convert.*
import std.time.DateTime
import ohos.file.fs.FileIo
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.app.ability.ui_ability.UIAbilityContext
import ohos.app.ability.ui_ability.AbilityStageContext
import ohos.bundle.bundle_manager.BundleInfo
import std.collection.collectArray
import ohos.resource_manager.ResourceManager
import ohos.app.ability.ui_ability.ApplicationContext
import std.collection.enumerate
import std.io.ByteBuffer
import stdx.encoding.json.stream.JsonWriter
import std.collection.filterMap

foreign func __gcov_dump(): Unit

public func gcov_dump(coveragePath: String): Unit {
    Hilog.info(1, "Cangjie-Test", "execute test with coverage")
    Process.current.setEnv("GCOV_PREFIX", coveragePath)
    unsafe { __gcov_dump() }
}

public func registerTestSuite(_: String, testClassInstanceGenerator: () -> TestClass): Unit {
    OpenHarmonyTestRunner.testClassInstanceGenerators.add(testClassInstanceGenerator)
}

public class OpenHarmonyTestRunner <: TestRunner {
    private let configuration = Configuration()
    private static var _driver: ?ui_test.Driver = None
    public static prop driver: ui_test.Driver {
        get() {
            match (OpenHarmonyTestRunner._driver) {
                case None =>
                    let newDriver = ui_test.Driver.create()
                    OpenHarmonyTestRunner._driver = newDriver
                    newDriver
                case Some(driver) => driver
            }
        }
    }
    public static let testSuiteMap: HashMap<String, TestSuite> = HashMap<String, TestSuite>()
    public static let testClassInstanceGenerators: ArrayList<() -> TestClass> = ArrayList<() -> TestClass>()
    private static func getDetailedInfoOf(e: Exception): String {
        let sb = StringBuilder("exception: ${e.toString()}\n")
        e.getStackTrace() |>
            forEach {
            s => sb.append("         at ${s.declaringClass}.${s.methodName}(${s.fileName}:${s.lineNumber})\n")
        }
        sb.toString()
    }

    private func testClassNotFound(testClassName: String): Unit {
        let listOfAvailableTestClasses = String.join(OpenHarmonyTestRunner.testSuiteMap.keys().toArray(),
            delimiter: ", ")
        Hilog.info(1, "Cangjie-Test",
            "TestClass with name \"${testClassName}\" not found. Available TestClasses are: ${listOfAvailableTestClasses}")
    }
    private func executeTestClass(testClassName: String): Unit {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        Hilog.info(1, "Cangjie-Test", "EXECUTE_CLASS_START: \"${testClassName}\"")
        let testSuite = match (OpenHarmonyTestRunner.testSuiteMap.get(testClassName)) {
            case None =>
                testClassNotFound(testClassName)
                return
            case Some(testClassInstanceGenerator) => testClassInstanceGenerator
        }
        testSuite.runTests(this.configuration).reportTo(XmlReporter(fs.Path("/data/storage/el1/base")))

        let testReportXmlFileName = "test-default.${testClassName}.xml"
        match (fs.Directory.readFrom("/data/storage/el1/base/tests") |>
            filter {fileInfo => fileInfo.name == testReportXmlFileName} |> first) {
            case None => Hilog.info(1, "Cangjie-Test", "${testReportXmlFileName} not found.")
            case Some(testReportXmlFileInfo) =>
                let testReportXmlFilePath = testReportXmlFileInfo.path
                let testReportXmlFileContent = fs.File.readFrom(testReportXmlFilePath)
                let xmlReport = String.fromUtf8(testReportXmlFileContent)
                Hilog.info(1, "Cangjie-Test", "XML_REPORT_CONTENT_LENGTH: ${xmlReport.size}")
                xmlReport.split("\n", removeEmpty: true) |>
                    forEach {
                    line: String => Hilog.info(1, "Cangjie-Test", line)
                }
                Hilog.info(1, "Cangjie-Test", "EXECUTE_CLASS_END: \"${testClassName}\"")
        }
    }
    private func executeAllTestClasses(): Unit {
        for (testClassName in OpenHarmonyTestRunner.testSuiteMap.keys()) {
            executeTestClass(testClassName)
        }
    }
    private func executeTestCase(testClassName: String, testCaseName: String): Unit {
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        Hilog.info(1, "Cangjie-Test", "EXECUTE_METHOD_START: \"${testClassName}#${testCaseName}\"")
        let testSuite = match (OpenHarmonyTestRunner.testSuiteMap.get(testClassName)) {
            case None =>
                testClassNotFound(testClassName)
                return
            case Some(testClassInstanceGenerator) => testClassInstanceGenerator
        }
        this.configuration.setByName("filter", "${testClassName}.${testCaseName}")
        testSuite.runTests(this.configuration).reportTo(XmlReporter(fs.Path("/data/storage/el1/base")))

        let testReportXmlFileName = "test-default.${testClassName}.xml"
        match (fs.Directory.readFrom("/data/storage/el1/base/tests") |>
            filter {fileInfo => fileInfo.name == testReportXmlFileName} |> first) {
            case None => Hilog.info(1, "Cangjie-Test", "${testReportXmlFileName} not found.")
            case Some(testReportXmlFileInfo) =>
                let testReportXmlFilePath = testReportXmlFileInfo.path
                let testReportXmlFileContent = fs.File.readFrom(testReportXmlFilePath)
                let xmlReport = String.fromUtf8(testReportXmlFileContent)
                Hilog.info(1, "Cangjie-Test", "XML_REPORT_CONTENT_LENGTH: ${xmlReport.size}")
                xmlReport.split("\n", removeEmpty: true) |>
                    forEach {
                    line: String => Hilog.info(1, "Cangjie-Test", line)
                }
                Hilog.info(1, "Cangjie-Test", "EXECUTE_METHOD_END: \"${testClassName}#${testCaseName}\"")
        }
    }
    public override func onPrepare(): Unit {
        Hilog.info(1, "Cangjie-Test", "OpenHarmonyTestRunner onPrepare")
        for (testClassInstanceGenerator in OpenHarmonyTestRunner.testClassInstanceGenerators) {
            let testClassInstance = try {
                testClassInstanceGenerator()
            } catch (e: Exception) {
                Hilog.info(1, "Cangjie-Test",
                    "exception occurred during testsuite generation:\n${getDetailedInfoOf(e)}")
                continue
            }
            let testSuite = testClassInstance.asTestSuite()
            let testSuiteName = testSuite.name
            Hilog.info(1, "Cangjie-Test", "Registering TestSuite ${testSuiteName}")
            OpenHarmonyTestRunner.testSuiteMap.add(testSuiteName, testSuite)
        }
    }
    public override func onRun(): Unit {
        try {
            Hilog.info(1, "Cangjie-Test", "OpenHarmonyTestRunner onRun")
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
            const classFilePath = "/data/storage/el1/base/class.txt"
            const testTypeFilePath = "/data/storage/el1/base/testType.txt"
            const levelFilePath = "/data/storage/el1/base/level.txt"
            const dryRunFilePath = "/data/storage/el1/base/dryRun.txt"
            sleepFor(1.second)
            setUp()
            if (FileIo.access(dryRunFilePath)) {
                let dryRun = String.fromUtf8(fs.File.readFrom(dryRunFilePath))
                FileIo.unlink(dryRunFilePath)
                this.configuration.setByName(
                    "dryRun",
                    if (dryRun == "true") {
                        true
                    } else {
                        false
                    }
                )
                Hilog.info(1, "Cangjie-Test", "dryRun includeTags = ${dryRun}")
            } else if (let Some(dryRun) <- AbilityDelegatorRegistry.getArguments().parameters.get("-s dryRun")) {
                this.configuration.setByName(
                    "dryRun",
                    if (dryRun == "true") {
                        true
                    } else {
                        false
                    }
                )
            }

            let bundleName = "com.example.myapplication"
            let allTags = HashSet<String>()
            if (FileIo.access(testTypeFilePath)) {
                let testType = String.fromUtf8(fs.File.readFrom(testTypeFilePath))
                FileIo.unlink(testTypeFilePath)
                let tags = testType.split(",", removeEmpty: true) |> filterMap {
                    levelNumber: String => levelNumber
                } |> collectArray
                allTags.add(all: tags)
            } else if (let Some(testType) <- AbilityDelegatorRegistry.getArguments().parameters.get("-s testType")) {
                let tags = testType.split(",", removeEmpty: true) |> filterMap {
                    levelNumber: String => levelNumber
                } |> collectArray
                allTags.add(all: tags)
            }

            if (FileIo.access(levelFilePath)) {
                let levels = String.fromUtf8(fs.File.readFrom(levelFilePath))
                FileIo.unlink(levelFilePath)
                let tags = levels.split(",", removeEmpty: true) |>
                    filterMap {
                    levelNumber: String => if (levelNumber == "0") {
                        "TestLevel0"
                    } else if (levelNumber == "1") {
                        "TestLevel1"
                    } else if (levelNumber == "2") {
                        "TestLevel2"
                    } else {
                        None
                    }
                } |> collectArray
                allTags.add(all: tags)
            } else if (let Some(levels) <- AbilityDelegatorRegistry.getArguments().parameters.get("-s level")) {
                let tags = levels.split(",", removeEmpty: true) |>
                    filterMap {
                    levelNumber: String => if (levelNumber == "0") {
                        "TestLevel0"
                    } else if (levelNumber == "1") {
                        "TestLevel1"
                    } else if (levelNumber == "2") {
                        "TestLevel2"
                    } else {
                        None
                    }
                } |> collectArray
                allTags.add(all: tags)
            }
            let includeTags = String.join(allTags |> collectArray, delimiter: ",")
            Hilog.info(1, "Cangjie-Test",
                "After argument preprocessing, those tags would be included: ${includeTags} .")
            this.configuration.setByName("includeTags", includeTags)

            let moduleName = "entry"
            let abilityName = "EntryAbility"
            let want = Want(bundleName: bundleName, moduleName: moduleName, abilityName: abilityName)

            spawn {
                try {
                    abilityDelegator.startAbility(want)
                    if (FileIo.access(classFilePath)) {
                        let text = String.fromUtf8(fs.File.readFrom(classFilePath))
                        FileIo.unlink(classFilePath)
                        Hilog.info(1, "Cangjie-Test", "text includeTags = ${text}")
                        text.split(",", removeEmpty: true) |>
                            forEach {
                            t: String =>
                            let pair = t.split("#", removeEmpty: true)
                            let testClassName = match (pair.get(0)) {
                                case None => return
                                case Some(text) => text.trimAscii()
                            }
                            match (pair.get(1)) {
                                case None => executeTestClass(testClassName)
                                case Some(testCaseName) => executeTestCase(testClassName, testCaseName)
                            }
                        }
                    } else if (let Some(text) <- AbilityDelegatorRegistry.getArguments().parameters.get("-s class")) {
                        text.split(",", removeEmpty: true) |>
                            forEach {
                            t: String =>
                            let pair = t.split("#", removeEmpty: true)
                            let testClassName = match (pair.get(0)) {
                                case None => return
                                case Some(text) => text.trimAscii()
                            }
                            match (pair.get(1)) {
                                case None => executeTestClass(testClassName)
                                case Some(testCaseName) => executeTestCase(testClassName, testCaseName)
                            }
                        }
                    } else {
                        executeAllTestClasses()
                    }
                } catch (e: Exception) {
                    Hilog.info(1, "Cangjie-Test", "an exception occurred:\n${getDetailedInfoOf(e)}")
                }
                gcov_dump("/data/storage/el1/base/cov")
                abilityDelegator.finishTest("Test finished.", 0)
            }
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "Exception thrown when executing test runner: ${e.stackTrace}")
        }
    }
}

let _ = TestRunner.registerCreator("OpenHarmonyTestRunner") {OpenHarmonyTestRunner()}

public interface UnitExtension {
    prop second: Duration
    prop milliSecond: Duration
}

extend Int64 <: UnitExtension {
    public prop second: Duration {
        get() {
            Duration.second * this
        }
    }
    public prop milliSecond: Duration {
        get() {
            Duration.millisecond * this
        }
    }
}

extend Float64 <: UnitExtension {
    public prop second: Duration {
        get() {
            Duration.second * this
        }
    }
    public prop milliSecond: Duration {
        get() {
            Duration.millisecond * this
        }
    }
}

public func sleepFor(someDuration: Duration): Unit {
    sleep(someDuration)
}

public func pressHome(): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.pressHome()
}

public func pressBack(): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.pressBack()
}

public func wakeUpDisplay(): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.wakeUpDisplay()
}

public func setUp(): Unit {
    wakeUpDisplay()
    clickAllThoseButtons()
    pressHome()
    clickAllThoseButtons()
    pressHome()
    swipe(from: Point(622, 2671), to: Point(631, 2053))
    sleepFor(2.second)
    click(at: Point(627, 2439))
    pressHome()
}

public func clickAllThoseButtons(): Unit {
    while (true) {
        if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseIdEqualsTo("permission_dialog_allow_button")) {
            click(at: button.centerPoint)
        } else if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseIdEqualsTo(
            "permission_dialog_vertical_button_0")) {
            click(at: button.centerPoint)
        } else if (Screen.findTheOnlyUiComponentWhoseTextEqualsTo("仅充电").isSome()) {
            click(at: Point(618, 1680))
        } else if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseIdEqualsTo("advanced_dialog_button_0")) {
            click(at: button.centerPoint)
        } else if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseTextEqualsTo("稍后")) {
            click(at: button.centerPoint)
        } else if (Screen.findTheOnlyUiComponentWhoseIdEqualsTo("paf_permission_privacy_text_0").isSome()) {
            click(at: Point(930, 2500))
        } else if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseTextEqualsTo("下一步")) {
            click(at: button.centerPoint)
        } else {
            break
        }
        sleepFor(10.milliSecond)
    }
}

private enum Result<T, E> {
    | Ok(T)
    | Err(E)
}

public func await<T>(jsContext: JSContext, f: () -> T): T {
    let result = Box(None<Result<T, Exception>>)
    let monitor = Monitor()
    jsContext.postJSTask {
        => result.value = try {
            Result.Ok(f())
        } catch (e: Exception) {
            Result.Err(e)
        } finally {
            synchronized(monitor) {
                monitor.notify()
            }
        }
    }
    synchronized(monitor) {
        monitor.wait(timeout: Duration.second * 6)
    }
    match (result.value) {
        case None => throw Exception("await timeout")
        case Some(result) => match (result) {
            case Ok(value) => value
            case Err(err) => throw err
        }
    }
}

public abstract class UiComponentNotFound <: Exception {
    public UiComponentNotFound(message: String) {
        super(message)
    }
}

public class UiComponentNotFoundById <: UiComponentNotFound {
    public UiComponentNotFoundById(id: String) {
        super("ui component not found by id \"${id}\"")
    }
}

public class UiComponentNotFoundByText <: UiComponentNotFound {
    public UiComponentNotFoundByText(text: String) {
        super("ui component not found by text \"${text}\"")
    }
}

public class AmbiguousUiComponentsFound <: Exception {
    public AmbiguousUiComponentsFound() {
        super("ambiguous ui components were found.")
    }
}

public class Screen {
    public static func findAllUiComponentsWhoseIdEqualsTo(id: String): Array<UiComponent> {
        let driver = OpenHarmonyTestRunner.driver
        let uiComponents = ArrayList<UiComponent>()
        try {
            let result = driver.findComponents(ui_test.On().id(id)).getOrThrow()
            result |> forEach<ui_test.Component> {c => uiComponents.add(HybridUiComponent(c))}
        } catch (e: Exception) {
        }
        uiComponents.toArray()
    }
    public static func findTheOnlyUiComponentWhoseIdEqualsTo(id: String): Option<UiComponent> {
        let uiComponents = Screen.findAllUiComponentsWhoseIdEqualsTo(id)
        match (uiComponents.size) {
            case 0 => None
            case 1 => uiComponents[0]
            case _ => throw AmbiguousUiComponentsFound()
        }
    }
    public static func getTheOnlyUiComponentWhoseIdEqualsTo(id: String): UiComponent {
        match (findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(id)
        }
    }
    public static func findAllUiComponentsWhoseTextEqualsTo(someText: String): Array<UiComponent> {
        let driver = OpenHarmonyTestRunner.driver
        let uiComponents = ArrayList<UiComponent>()
        try {
            let result = driver.findComponents(ui_test.On().text(someText)).getOrThrow()
            result |> forEach<ui_test.Component> {c => uiComponents.add(HybridUiComponent(c))}
        } catch (e: Exception) {
        }
        uiComponents.toArray()
    }
    public static func findTheOnlyUiComponentWhoseTextEqualsTo(someText: String): Option<UiComponent> {
        let uiComponents = Screen.findAllUiComponentsWhoseTextEqualsTo(someText)
        match (uiComponents.size) {
            case 0 => None
            case 1 => uiComponents[0]
            case _ => throw AmbiguousUiComponentsFound()
        }
    }
    public static func getTheOnlyUiComponentWhoseTextEqualsTo(someText: String): UiComponent {
        match (findTheOnlyUiComponentWhoseTextEqualsTo(someText)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(someText)
        }
    }
}

public class UiComponentTree {
    public static func findAllUiComponentsWhoseIdEqualsTo(id: String): Array<UiComponent> {
        Hilog.info(1, "Cangjie-Test", "UiComponentTree.findAllUiComponentsWhoseIdEqualsTo(${id})")
        []
    }
    public static func findTheOnlyUiComponentWhoseIdEqualsTo(id: String): Option<UiComponent> {
        Hilog.info(1, "Cangjie-Test", "UiComponentTree.findTheOnlyUiComponentWhoseIdEqualsTo(${id})")
        match (Screen.findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => UiComponentById(id)
        }
    }
    public static func getTheOnlyUiComponentWhoseIdEqualsTo(id: String): UiComponent {
        Hilog.info(1, "Cangjie-Test", "UiComponentTree.getTheOnlyUiComponentWhoseIdEqualsTo(${id})")
        match (findTheOnlyUiComponentWhoseIdEqualsTo(id)) {
            case Some(uiComponent) => uiComponent
            case None => throw UiComponentNotFoundById(id)
        }
    }
}

public func enterPage(pageName: String): Unit {
    click(at: Screen.getTheOnlyUiComponentWhoseIdEqualsTo(pageName).centerPoint)
}

public func enterPage(scrollerId!: String, buttonId!: String): Unit {
    let scroller = Screen.getTheOnlyUiComponentWhoseIdEqualsTo(scrollerId)
    for (_ in 0..100) {
        if (let Some(button) <- Screen.findTheOnlyUiComponentWhoseIdEqualsTo(buttonId)) {
            click(at: button.centerPoint)
            sleep(Duration.second * 1)
            break
        }
        swipe(
            from: scroller.centerPoint,
            to: Point(
                scroller.centerPoint.x,
                scroller.centerPoint.y - 80
            )
        )
    }
}

public func click(at!: Point): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.click(at.x, at.y)
}

public func input(at!: Point, text!: String): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.inputText(ui_test.Point(at.x, at.y), text)
}

public func swipe(from!: Point, to!: Point): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.swipe(from.x, from.y, to.x, to.y)
}

public func swipe(from!: Point, deltaX!: Int32 = 0, deltaY!: Int32 = 0): Unit {
    swipe(from: from, to: Point(from.x + deltaX, from.y + deltaY))
}

public func drag(from!: Point, to!: Point): Unit {
    let driver = OpenHarmonyTestRunner.driver
    driver.drag(from.x, from.y, to.x, to.y)
}

public func slide(through!: Array<Point>): Unit {
    let driver = OpenHarmonyTestRunner.driver
    let pointerMatrix = PointerMatrix.create(1, Int32(through.size))
    through |> enumerate |>
        forEach {
        pair: (Int64, Point) =>
        let index = pair[0]
        let point = pair[1]
        pointerMatrix.setPoint(0, Int32(index), ui_test.Point(point.x, point.y))
    }
    driver.injectMultiPointerAction(pointerMatrix)
}

public interface UiComponent <: Hashable & Equatable<UiComponent> {
    prop centerPoint: Point
    func getAttribute(remainingAttributePath: String, remainingAttributeObject: JsonObject): JsonValue {
        match (remainingAttributePath.indexOf(".")) {
            case Some(indexOfFirstDot) => match (remainingAttributeObject.get(remainingAttributePath[..indexOfFirstDot])) {
                case None => throw Exception("属性${remainingAttributePath}未找到")
                case Some(result) => getAttribute(remainingAttributePath[indexOfFirstDot + 1..], result.asObject())
            }
            case None => match (remainingAttributeObject.get(remainingAttributePath)) {
                case None => throw Exception("属性${remainingAttributePath}未找到")
                case Some(result) => result
            }
        }
    }
    func getAttribute(attributePath: String): String {
        let inspectorInfoJsonString = getInspectorByKey(this.id.toString())
        if (inspectorInfoJsonString.isEmpty()) {
            throw Exception("UI组件树上未找到任何组件ID为\"${this.id}\"的UI组件")
        }
        let inspectorInfo = JsonValue.fromStr(inspectorInfoJsonString).asObject()
        let result = getAttribute(
            attributePath,
            inspectorInfo.get("$attrs").getOrThrow().asObject()
        )
        match (result.kind()) {
            case JsonKind.JsString => result.asString().toString()
            case _ => result.toString()
        }
    }
    func dump(): Unit {
        let info = StringBuilder()
        let inspectorInfoJsonString = getInspectorByKey(this.id.toString())
        let inspectorInfo = JsonValue.fromStr(inspectorInfoJsonString).asObject()
        info.append("start====${this.id}====\n")
        inspectorInfo.get("$attrs").getOrThrow().asObject().getFields() |>
            forEach {
            attribute =>
            let attributeName = attribute[0]
            let attributeValue = attribute[1].toString()
            info.append("${attributeName}-${attributeValue}\n")
        }
        info.append("end====${this.id}====\n")
        Hilog.info(1, "Cangjie-Test", info.toString())
    }
    operator func [](attributePath: String): String {
        getAttribute(attributePath)
    }
    prop text: String
    prop id: String
    func hashCode(): Int64 {
        this.id.hashCode()
    }
    operator func ==(anotherUiComponent: UiComponent): Bool {
        this.hashCode() == anotherUiComponent.hashCode()
    }
    operator func !=(anotherUiComponent: UiComponent): Bool {
        this.hashCode() != anotherUiComponent.hashCode()
    }
    func perform(action: MyAction): Unit {
        action.bePerformedOn(this)
    }
}

public class MyAction {
    public MyAction(public let bePerformedOn: (UiComponent) -> Unit) {}
}

public func click(): MyAction {
    MyAction {uiComponent: UiComponent => click(at: uiComponent.centerPoint)}
}

public func clearText(): MyAction {
    MyAction {
        uiComponent: UiComponent => (uiComponent as HybridUiComponent).getOrThrow()._uiComponent.clearText()
    }
}

public class UiComponentById <: UiComponent {
    public UiComponentById(public let _id: String) {}
    public prop centerPoint: Point {
        get() {
            throw Exception("the ui component with id \"${this._id}\" is not shown.")
        }
    }
    public prop text: String {
        get() {
            throw Exception("the ui component with id \"${this._id}\" is not shown.")
        }
    }
    public prop id: String {
        get() {
            this._id
        }
    }
}

public open class HybridUiComponent <: UiComponent {
    public HybridUiComponent(public let _uiComponent: ui_test.Component) {}
    public prop centerPoint: Point {
        get() {
            let a = this._uiComponent.getBoundsCenter()
            Point(Int32(a.x), Int32(a.y))
        }
    }
    public prop text: String {
        get() {
            this._uiComponent.getText()
        }
    }
    public prop id: String {
        get() {
            this._uiComponent.getId()
        }
    }
}

public class Point <: ToString {
    public Point(public let x: Int32, public let y: Int32) {}
    public func toString(): String {
        "Point[${this.x}, ${this.y}]"
    }
}

extend Exception {
    public prop stackTrace: String {
        get() {
            let sb = StringBuilder("exception: ${this.toString()}\n")
            this.getStackTrace() |>
                forEach {
                s => sb.append("         at ${s.declaringClass}.${s.methodName}(${s.fileName}:${s.lineNumber})\n")
            }
            sb.toString()
        }
    }
}

public class Event {
    public Event(public let timeStamp: DateTime, public let name: String, public let content: String) {}
}

public class LogManager {
    public let eventSequence: ArrayList<Event> = ArrayList<Event>()
    public let eventMap: HashMap<String, Event> = HashMap<String, Event>()
    private let mutex = Mutex()
    public func appendEvent(event: Event): Unit {
        synchronized(this.mutex) {
            this.eventSequence.add(event)
            this.eventMap.add(event.name, event)
        }
    }
    public func findEventWithName(eventName: String): Option<Event> {
        synchronized(this.mutex) {
            match (this.eventMap.get(eventName)) {
                case None => None
                case Some(event) => event
            }
        }
    }
}

public let logManager: LogManager = LogManager()

public func logEvent(eventName: String, eventContent: String): Unit {
    let timeStamp = DateTime.now()
    let event = Event(timeStamp, eventName, eventContent)
    logManager.appendEvent(event)
    Hilog.info(1, "Cangjie-Test", "[${eventName}]: ${eventContent}")
}

public func waitForEventWithName(eventName: String, timeOut!: Duration = Duration.Max, processor!: (Event) -> Unit): Unit {
    let monitor = Monitor()
    let result = Box(None<Event>)
    let checker = Timer.repeat(Duration.Zero, Duration.millisecond * 1,
        {
            => match (logManager.findEventWithName(eventName)) {
                case None => ()
                case Some(event) =>
                    result.value = event
                    synchronized(monitor) {
                        monitor.notify()
                    }
            }
        })
    synchronized(monitor) {
        monitor.wait(timeout: timeOut)
    }
    checker.cancel()
    match (result.value) {
        case None => @Assert("timed out after ${timeOut}." == "xxx")
        case Some(event) => processor(event)
    }
}

public func getAbilityContext(): UIAbilityContext {
    let result = Box(None<UIAbilityContext>)
    while (true) {
        match (AppStorage.get<UIAbilityContext>("abilityContext")) {
            case None => sleepFor(1.second)
            case Some(abilityContext) =>
                result.value = abilityContext
                break
        }
    }
    result.value.getOrThrow()
}

public func getAbilityStageContext(): AbilityStageContext {
    match (AppStorage.get<AbilityStageContext>("abilityStageContext")) {
        case None => throw Exception("failed to get ability stage context")
        case Some(abilityStageContext) => abilityStageContext
    }
}

func getFullBundleInfo(): BundleInfo {
    let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
        | BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
        BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
        BundleFlag.GET_BUNDLE_INFO_WITH_METADATA | BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE |
        BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | BundleFlag.GET_BUNDLE_INFO_WITH_MENU
    BundleManager.getBundleInfoForSelf(bundleFlags)
}

public func waitFor(timeOut: Duration, f: () -> Bool): Unit {
    let monitor = Monitor()
    let result = Box(None<Bool>)
    let checker = Timer.repeat(Duration.Zero, Duration.millisecond * 1,
        {
            => if (f()) {
                result.value = true
                synchronized(monitor) {
                    monitor.notify()
                }
            }
        })
    synchronized(monitor) {
        monitor.wait(timeout: timeOut)
    }
    checker.cancel()
    match (result.value) {
        case None => throw Exception("timed out after ${timeOut}.")
        case Some(event) => @Assert(event)
    }
}

public func pick<T>(p: (T) -> Bool): (Iterable<T>) -> T {
    {
        a: Iterable<T> =>
        for (i in a) {
            if (p(i)) {
                return i
            }
        }
        throw Exception("not found")
    }
}

public class getInspector {
    public operator func [](componentId: String, attributeName: String): String {
        attributeWithName(componentId, attributeName)
    }

    public func attributeWithName(componentId: String, attributeName: String): String {
        try {
            let inspectorInfoJsonString = getInspectorByKey(componentId)
            let inspectorInfo = JsonValue.fromStr(inspectorInfoJsonString).asObject()
            inspectorInfo.get("$attrs").getOrThrow().asObject().get(attributeName).getOrThrow().toString()
        } catch (e: Exception) {
            return "Not find Component or Json parser failed!"
        }
    }
}

public class EventBuilder {
    public EventBuilder(private let eventName: String) {}
    public let properties: HashMap<String, JsonValue> = HashMap<String, JsonValue>()
    public func add(propertyName: String, propertyValue: String): EventBuilder {
        this.add(propertyName, JsonString(propertyValue))
    }
    public func add(propertyName: String, propertyValue: Bool): EventBuilder {
        this.add(propertyName, JsonBool(propertyValue))
    }
    public func add(propertyName: String, propertyValue: Int64): EventBuilder {
        this.add(propertyName, JsonFloat(propertyValue))
    }
    public func add(propertyName: String, want: Want): EventBuilder {
        let byteBuffer = ByteBuffer()
        let jsonWriter = JsonWriter(byteBuffer)
        jsonWriter.startObject()
        jsonWriter.writeName("bundleName").writeValue(want.bundleName)
        jsonWriter.writeName("moduleName").writeValue(want.moduleName)
        jsonWriter.writeName("abilityName").writeValue(want.abilityName)
        jsonWriter.endObject()
        jsonWriter.flush()
        this.add(propertyName, String.fromUtf8(byteBuffer.bytes()))
    }
    public func add(propertyName: String, propertyValue: JsonValue): EventBuilder {
        this.properties.add(propertyName, propertyValue)
        this
    }
    public func yield(): Unit {
        logEvent(eventName, JsonObject(this.properties).toJsonString())
    }
}