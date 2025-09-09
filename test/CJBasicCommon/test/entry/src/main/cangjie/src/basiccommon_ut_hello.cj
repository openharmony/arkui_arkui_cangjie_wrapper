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

import std.unittest.testmacro.*
import std.unittest.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.ui_context.*
import ohos.router.*
import std.math.MathExtension
import ohos.ark_interop.*
import ohos.ui_test.*
import std.collection.ArrayList
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.PixelMapFormat
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.Size as UniqueImageSize
import ohos.display.Orientation as DisplayOrientation
import ohos.display.*
import ohos.prompt_action.*
import ohos.callback_invoke.*
internal import kit.ArkUI.{isFoldable, getFoldStatus, getFoldDisplayMode, getCurrentFoldCreaseRegion, FoldCreaseRegion,
    getDefaultDisplaySync, getAllDisplays, DisplayState, DisplayOrientation as orientation, DisplayRect,
    WaterfallDisplayAreaRects, CutoutInfo, FoldDisplayMode}

import ohos.window.{Window, WindowStage, WindowCallbackType, WindowEventType, WindowStageEventType,
    Size, WindowStatusType, TitleButtonRect, SystemBarProperties, Orientation,createWindow,findWindow,WindowType,getLastWindow,shiftAppWindowFocus,
    AvoidAreaType,WindowProperties,ColorSpace, Configuration as WindowConfig, Rect as WindowRect, AvoidArea}

@Test
class BasicCommonUTHello {
    prop driver: Driver{
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    protected override func beforeAll() {
        let scrollBar = driver.waitForComponent(On().id("scroller"),500).getOrThrow()
        Hilog.error(1, "Cangjie-App", "started")
        scrollBar.scrollSearch(On().id("ViewHello")).getOrThrow().click()
        driver.delayMs(500)
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testText() {
        Hilog.info(1, "Cangjie-Test", "test_text start")
        let firstButton = driver.findComponent(On().id("textController")).getOrThrow()
        firstButton.click()
        try {
            var textController = TextController()
            textController.closeSelectionMenu()
        }catch (e: Exception) {
                Hilog.info(1, "Cangjie-Test", "test_text " + e.toString())
        }
        Hilog.info(1, "Cangjie-Test", "test_text end")
    }

     //add1
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testViewArray() {
        Hilog.info(1, "Cangjie-Test", "test_viewArray start")
        let helloCangjie = driver.findComponent(On().id("helloCangjie")).getOrThrow()
        helloCangjie.click()
        let recycleManager = driver.waitForComponent(On().id("RecycleManager"),600).getOrThrow()
        recycleManager.click()
        let reuseParams = driver.waitForComponent(On().id("ReuseParams"),600).getOrThrow()
        reuseParams.click()
        driver.delayMs(600)
        Hilog.info(1, "Cangjie-Test", "test_viewArray end")
    }

//    @TestCase
//    @Tag[APILevel12, TestLevel0]
//    func testBigint() {
//        Hilog.info(1, "Cangjie-Test", "test_bigint start")
//        var vectorFloat64: FFIVectorFloat64 = FFIVectorFloat64(10)
//        vectorFloat64.setElement(1, 64.0)
//        var float_a = vectorFloat64.getElement(1)
//        var size = vectorFloat64.getSize()
//        @Expect(size, 10)
//        var handle: VectorFloat64Handle = vectorFloat64.getNativeHandle()
//        var vectorFloat64_2: FFIVectorFloat64 = FFIVectorFloat64(handle)
//        vectorFloat64.free()
//
//        var vectorFloat32: FFIVectorFloat32 = FFIVectorFloat32(10)
//        vectorFloat32.setElement(1, 32.0)
//        var float_b = vectorFloat32.getElement(1)
//        size = vectorFloat32.getSize()
//        @Expect(size, 10)
//        var handle2: VectorFloat32Handle = vectorFloat32.getNativeHandle()
//        var vectorFloat32_2: FFIVectorFloat32 = FFIVectorFloat32(handle2)
//        vectorFloat32.free()
//
//        var vectorUInt32: FFIVectorUInt32 = FFIVectorUInt32(10)
//        vectorUInt32.setElement(1, 32)
//        var uInt_b = vectorUInt32.getElement(1)
//        size = vectorUInt32.getSize()
//        @Expect(size, 10)
//        var handle3: VectorUInt32Handle = vectorUInt32.getNativeHandle()
//        var vectorUInt32_2: FFIVectorUInt32 = FFIVectorUInt32(handle3)
//        vectorUInt32.free()
//
//        var vectorInt64: FFIVectorInt64 = FFIVectorInt64(10)
//        vectorInt64.setElement(1, 32)
//        var int64_b = vectorInt64.getElement(1)
//        size = vectorInt64.getSize()
//        @Expect(size, 10)
//        var handle4: VectorInt64Handle = vectorInt64.getNativeHandle()
//        var vectorInt64_2: FFIVectorInt64 = FFIVectorInt64(handle4)
//        vectorInt64.free()
//
//        var vectorInt32: FFIVectorInt32 = FFIVectorInt32(10)
//        vectorInt32.setElement(1, 32)
//        var int32_b = vectorInt32.getElement(1)
//        size = vectorInt32.getSize()
//        @Expect(size, 10)
//        var handle5: VectorInt64Handle = vectorInt32.getNativeHandle()
//        var vectorInt32_2: FFIVectorInt32 = FFIVectorInt32(handle5)
//        vectorInt32.free()
//
//        var vectorString: FFIVectorString = FFIVectorString(10)
//        vectorString.setElement(1, "32")
//        var str_b = vectorString.getElement(1)
//        size = vectorString.getSize()
//        @Expect(size, 10)
//
//        var vectorCJInt64: FFIVectorCJInt64 = FFIVectorCJInt64(10)
//        vectorCJInt64.setElement(1, 32)
//        var handle6: VectorCJInt64Handle = vectorCJInt64.getNativeHandle()
//        var vectorCJInt64_2: FFIVectorCJInt64 = FFIVectorCJInt64(handle6)
//        vectorCJInt64.free()
//
//        var vectorBool: FFIVectorBool = FFIVectorBool(10)
//        vectorBool.setElement(1, true)
//        var bool_a = vectorBool.getElement(1)
//        size = vectorBool.getSize()
//        @Expect(size, 10)
//        var handle7: VectorBoolHandle = vectorBool.getNativeHandle()
//        var vectorBool_2: FFIVectorBool = FFIVectorBool(handle7)
//        vectorBool.free()
//
//        var vectorUInt8: FFIVectorUInt8 = FFIVectorUInt8(10)
//        vectorUInt8.setElement(1, 8)
//        var uInt8_a = vectorUInt8.getElement(1)
//        size = vectorUInt8.getSize()
//        @Expect(size, 10)
//        var handle9: VectorUInt8Handle = vectorUInt8.getNativeHandle()
//        var vectorUInt8_2: FFIVectorUInt8 = FFIVectorUInt8(handle9)
//        vectorUInt8.free()
//        Hilog.info(1, "Cangjie-Test", "test_bigint end")
//    }

//    @TestCase
//    @Tag[APILevel16, TestLevel0]
//    func testFFIVectorNavigationItem() {
//        Hilog.info(1, "Cangjie-Test", "test_FFIVectorNavigationItem start")
//        try {
//            var vectorNavigationItem: FFIVectorNavigationItem = FFIVectorNavigationItem(10)
////            var item_a = vectorNavigationItem.getElement(0)
////            vectorNavigationItem.setElement(0, item_a)
//            var size = vectorNavigationItem.getSize()
//            var handle8: VectorNavigationItemHandle = vectorNavigationItem.getNativeHandle()
//            var vectorNavigationItem_2: FFIVectorNavigationItem = FFIVectorNavigationItem(handle8)
//            vectorNavigationItem.free()
//        } catch (e: Exception) {
//            Hilog.info(1, "Cangjie-Test", "test_FFIVectorNavigationItem: ${e.toString()}")
//        }
//        Hilog.info(1, "Cangjie-Test", "test_FFIVectorNavigationItem end")
//    }

     //add1
//    @TestCase
//    @Tag[APILevel16, TestLevel0]
//    func testNavigationItemFFI() {
//        Hilog.info(1, "Cangjie-Test", "test_NavigationItemFFI start")
//        try {
//            var vectorNavigationItem: FFIVectorNavigationItem = FFIVectorNavigationItem(10)
//            let cValue: CString = unsafe { LibC.mallocCString("test_FFIVectorNavigationItem") }
////            vectorNavigationItem.setElement(1, NavigationItemFFI(cValue, cValue, 2))
////            var item_a = vectorNavigationItem.getElement(1)
////            var size = vectorNavigationItem.getSize()
////            @Expect(size, 10)
////            var handle8: VectorNavigationItemHandle = vectorNavigationItem.getNativeHandle()
////            var vectorNavigationItem_2: FFIVectorNavigationItem = FFIVectorNavigationItem(handle8)
////            vectorNavigationItem.free()
////            cValue.free()
////            cValue.toStringOption()
//        } catch (e: Exception) {
//            Hilog.info(1, "Cangjie-Test", "test_NavigationItemFFI: ${e.toString()}")
//        }
//        Hilog.info(1, "Cangjie-Test", "test_NavigationItemFFI end")
//    }
    //

//    @TestCase
//    @Tag[APILevel16, TestLevel0]
//    func testGetOrThrow() {
//        Hilog.info(1, "Cangjie-Test", "test_getOrThrow start")
//        var msg = "msg"
//        try {
//            getOrThrow<String>(Option<String>.None, msg: "NoneValueException")
//        } catch (e: Exception) {
//            msg = e.toString()
//            Hilog.info(1, "Cangjie-App", msg_string)
//            Hilog.info(1, "Cangjie-Test", "test_getOrThrow setProperty: ${e.toString()}")
//        }
//        @Expect(msg.contains("NoneValueException"))
//        Hilog.info(1, "Cangjie-Test", "test_getOrThrow end")
//    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testLengthProp() {
        Hilog.info(1, "Cangjie-Test", "test_lengthProp start")
        var float_a: Float64 = 30.0
        var length = float_a.percent
        var lpx = float_a.lpx

        var type_lpx: LengthType = LengthType.parse(4)
        var vp: LengthType = LengthType.parse(5)
        @Expect(0.3, length.value)

        try {
            Main.hasEnded()
            Main.end()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_lengthProp setProperty: ${e.toString()}")
        }

        try {
            var lazy = LazyForEach()
            lazy.update()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_lengthProp setProperty: ${e.toString()}")
        }
        Hilog.info(1, "Cangjie-Test", "test_lengthProp end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testForEach() {
        Hilog.info(1, "Cangjie-Test", "test_forEach start")
        try {
            var foreach: ForEach = ForEach(){}
            foreach.create()
            foreach.update()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_forEach setProperty: ${e.toString()}")
        }
        try {
            var dtcustom = DtTestCustomView(Option.None, LocalStorage())
            var foreach2: ForEach = ForEach(){}
            foreach2.create<String>(1, dtcustom, ObservedArrayList<String>(["1"]), itemGeneratorFunc: {viewName: String, _: Int64 => })
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_forEach setProperty: ${e.toString()}")
        }
        Hilog.info(1, "Cangjie-Test", "test_forEach end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testCustomview() {
        Hilog.info(1, "Cangjie-Test", "test_customview start")
        var message = "test_ObservedObject success"
        var dtcustom = DtTestCustomView(Option.None, Option.None)
        try {
            dtcustom.getLocalStorage()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview getLocalStorage: ${e.toString()}")
            message = e.toString()
        }
        try {
            dtcustom.aboutToRecycleInternal()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview aboutToRecycleInternal: ${e.toString()}")
            message = e.toString()
        }
        try {
            dtcustom.addProvideVar(ObservedProperty<String>("info", "initValue"), "addProvideVar")
            dtcustom.initializeConsume("addProvideVar")
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview addProvideVar: ${e.toString()}")
            message = e.toString()
        }
        try {
            dtcustom.markLazyForEachProcess("lazyGroupId1")
            dtcustom.markLazyForEachProcess("lazyGroupId2")
            dtcustom.removeChildGroupById("lazyGroupId1")
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview markLazyForEachProcess: ${e.toString()}")
            message = e.toString()
        }
        try {
            var bId = If.getBranchId()
            dtcustom.ifElseBranchUpdateFunction(bId, { => })
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview testInitDt: ${e.toString()}")
            message = e.toString()
        }
        try {
            dtcustom.testInitDt()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview testInitDt: ${e.toString()}")
            message = e.toString()
        }
        try {
            DtTestCustomView.createRecycle(dtcustom, false, "name", { => })
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview createRecycle: ${e.toString()}")
            message = e.toString()
        }
        try {
            dtcustom.observeRecycleComponentCreation("name", {ab, bc, cd => return If({ =>})})
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview observeRecycleComponentCreation: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_ObservedObject success")
        Hilog.info(1, "Cangjie-Test", "test_customview end")
    }

    @TestCase
     @Tag[APILevel16, TestLevel0]
    func testCustomview2() {
        Hilog.info(1, "Cangjie-Test", "test_customview2 start")
        var message = "test_customview2 success"
        var dtcustom = DtTestCustomView(Option.None, Option.None)
        try {
            dtcustom.observeRecycleComponentCreation("name", {ab, bc, cd => return If({ =>})})
            var recycleManager = dtcustom.getAnRecycleManager()
            dtcustom.observeRecycleComponentCreation("name", {ab, bc, cd => return If({ =>})})
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_customview observeRecycleComponentCreation: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_customview2 success")
        Hilog.info(1, "Cangjie-Test", "test_customview2 end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testView() {
        Hilog.info(1, "Cangjie-Test", "test_view start")
        var message = ""
        try {
            var view: View = View.create(23232323)
            view.needsUpdate()
            view.markStatic()
            view.isStatic()
            view.destroy()
        } catch (e: Exception) {
            message = e.toString()
            Hilog.info(1, "Cangjie-Test", "test_view setProperty: ${e.toString()}")
        }
        @Expect(message.contains("NoneValueException"))
        Hilog.info(1, "Cangjie-Test", "test_view end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testView2() {
        Hilog.info(1, "Cangjie-Test", "test_view2 start")
//        try {
//            NativeOptionFloat64(true, 2.0)
//            var view: View = View.create(23232321)
//            view.needsUpdate()
//            view.deletedElmtIdsHaveBeenPurged(ArrayList<Int64>([0]))
//        } catch (e: Exception) {
//            Hilog.info(1, "Cangjie-Test", "test_view2 setProperty: ${e.toString()}")
//        }
//        var nativeInt = NativeOptionInt64(true, 2)
//        @Expect(2, nativeInt.value)
//        var nativeFloat = NativeOptionFloat64(true, 2.0)
//        @Expect(2.0, nativeFloat.value)
//        Hilog.info(1, "Cangjie-Test", "test_view2 end")
    }


    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLazyforEach() {
        Hilog.info(1, "Cangjie-Test", "test_lazyforEach start")
//        try {
//            var foreach: LazyForEach = LazyForEach()
//            foreach.update()
//        } catch (e: Exception) {
//            Hilog.info(1, "Cangjie-Test", "test_lazyforEach setProperty: ${e.toString()}")
//        }
        Hilog.info(1, "Cangjie-Test", "test_lazyforEach end")
    }

    @TestCase
     @Tag[APILevel12, TestLevel0]
    func testViewbuild() {
        Hilog.info(1, "Cangjie-Test", "test_viewbuild start")
        var message = "Invalid args or ret"
        var legal = LegalCallCheck()
        LegalCallCheck.check(ViewBuilder({ => }))
        LegalCallCheck.check(ViewBuilder({ => }))
        @Expect(message.contains("Invalid args or ret"))
        Hilog.info(1, "Cangjie-Test", "test_viewbuild end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testResourceToUInt() {
        Hilog.info(1, "Cangjie-Test", "test_resource_toUInt start")
        var message = "Invalid args or ret"
        try {
            var color: ResourceColor = @r(app.color.blue_23C452)
            color.toUInt32()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_resource_toUInt: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message.contains("AppResource can not get 'UInt32' value from ResourceColor"))
        Hilog.info(1, "Cangjie-Test", "test_resource_toUInt end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testLengthValue() {
        Hilog.info(1, "Cangjie-Test", "test_length_value start")
        var message1 = "get value success"
        try {
            var length1: Length = @r(app.string.width_100p)
            length1.value
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_length_value: ${e.toString()}")
            message1 = e.toString()
        }
        @Expect(message1.contains("Current type not support get 'value' attribute"))

        var message2 = "get unitType success"
        try {
            var length2: Length = @r(app.string.width_100p)
            length2.unitType
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_length_value: ${e.toString()}")
            message2 = e.toString()
        }
        @Expect(message2.contains("Current type not support get 'unitType' attribute"))
        Hilog.info(1, "Cangjie-Test", "test_length_value end")
    }

    @TestCase
     @Tag[APILevel12, TestLevel0]
    func testRecycle() {
        Hilog.info(1, "Cangjie-Test", "test_Recycle start")
        var message = "test_Recycle success"
        try {
           var recycle = __Recycle__()
            recycle.pop()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_hitrace: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_Recycle success")
        Hilog.info(1, "Cangjie-Test", "test_Recycle end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testOpenView() {
        Hilog.info(1, "Cangjie-Test", "test_openView start")
        var message = "test_openView success"
        try {
            PersonGestureType()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_openView: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_openView success")
        Hilog.info(1, "Cangjie-Test", "test_openView end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGetLastWindow03() {
        Hilog.info(1, "Cangjie-Test", "test_getLastWindow_03 start")
        let displayClass = getDefaultDisplaySync()
        let displayList = getAllDisplays()

        Hilog.info(1, "Cangjie-Test","id:    " + displayClass.id.toString())
        Hilog.info(1, "Cangjie-Test","name:  " + displayClass.name)
        Hilog.info(1, "Cangjie-Test","alive: " + displayClass.alive.toString())
        Hilog.info(1, "Cangjie-Test","refreshRate: " + displayClass.refreshRate.toString())
        Hilog.info(1, "Cangjie-Test","rotation:    " + displayClass.rotation.toString())
        Hilog.info(1, "Cangjie-Test","width:       " + displayClass.width.toString())
        Hilog.info(1, "Cangjie-Test","height:      " + displayClass.height.toString())
        Hilog.info(1, "Cangjie-Test","densityDPI:  " + displayClass.densityDPI.toString())
        Hilog.info(1, "Cangjie-Test","densityPixels: " + displayClass.densityPixels.toString())
        Hilog.info(1, "Cangjie-Test","scaledDensity: " + displayClass.scaledDensity.toString())
        Hilog.info(1, "Cangjie-Test","xDPI: " + displayClass.xDPI.toString())
        Hilog.info(1, "Cangjie-Test","yDPI: " + displayClass.yDPI.toString())

        if (isFoldable()) {
            let status = getFoldStatus()
            let mode = getFoldDisplayMode()
        } else {
            let status = getFoldStatus()
            let mode = getFoldDisplayMode()
        }
        try {
            let region = getCurrentFoldCreaseRegion()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test","Not fold display.")
        }
        Hilog.info(1, "Cangjie-Test", "test_getLastWindow_03 end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testGetLastWindow02() {
        Hilog.info(1, "Cangjie-Test", "test_getLastWindow_02 start")
            var mainWindow = Global.getMainWindow()
        try {
            mainWindow.resize(300, 300)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_getLastWindow_02 resize: ${e.toString()}")
        }
        try {
            mainWindow.minimize()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_getLastWindow_02 minimize: ${e.toString()}")
        }
        Hilog.info(1, "Cangjie-Test", "test_getLastWindow_02 end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testRemoteView() {
        Hilog.info(1, "Cangjie-Test", "test_remoteView start")
        var message = "test_remoteView success"
        try {
            var remoteView = PersonRemoteView()
            remoteView.testDt()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_remoteView: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_remoteView success")
        Hilog.info(1, "Cangjie-Test", "test_remoteView end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testObservable() {
        Hilog.info(1, "Cangjie-Test", "test_Observable start")
        var message = "test_Observable success"
        try {
            var observable = PersonObservable()
            observable.testDt()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_Observable: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_Observable success")
        Hilog.info(1, "Cangjie-Test", "test_Observable end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testObservedObject() {
        Hilog.info(1, "Cangjie-Test", "test_ObservedObject start")
        var message = "test_ObservedObject success"
        try {
            var observable = PersonObservedObject()
            observable.testDt()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_ObservedObject: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_ObservedObject success")
        Hilog.info(1, "Cangjie-Test", "test_ObservedObject end")
    }

    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testEnvironment() {
        Hilog.info(1, "Cangjie-Test", "test_Environment start")
        var message = "test_Environment success"
        try {
            Environment.aboutToBeDeleted()
                let d1 = AppStorage.delete("accessibilityEnabled")
    let d2 = AppStorage.delete("colorMode")
    let d3 = AppStorage.delete("fontScale")
    let d4 = AppStorage.delete("fontWeightScale")
    let d5 = AppStorage.delete("layoutDirection")
    let d6 = AppStorage.delete("languageCode")

    // 都是 true
    let SysAccessibilityEnabled = Environment.envProp<Bool>("accessibilityEnabled", false)
    let SysAccessibilityEnabled1 = Environment.envProp<Bool>("accessibilityEnabled", false)
    let SysColorMode = Environment.envProp<ColorMode>("colorMode", ColorMode.Light)
    let SysFontScale = Environment.envProp<Float64>("fontScale", 1.30)
    let SysFontWeightScale = Environment.envProp<Float64>("fontWeightScale",1.40)
    let SysLayoutDirection = Environment.envProp<LayoutDirection>("layoutDirection", LayoutDirection.Ltr)
    let SysLanguageCode = Environment.envProp<String>("languageCode", "en")
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_Environment: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_Environment success")
        Hilog.info(1, "Cangjie-Test", "test_Environment end")
    }


    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testObservedProperty() {
        Hilog.info(1, "Cangjie-Test", "test_observedProperty start")
        var message = "test_observedProperty success"
        try {
           var color = ObservedProperty<PersonObservedObject>("info", PersonObservedObject())
            color.set(PersonObservedObject())
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_hitrace: ${e.toString()}")
            message = e.toString()
        }
        @Expect(message, "test_observedProperty success")
        Hilog.info(1, "Cangjie-Test", "test_observedProperty end")
    }

    @TestCase
    @Tag[APILevel19, TestLevel0]
    func testEnum() {
        Hilog.info(1, "Cangjie-Test", "test_enum start")
        var panDirection = PanDirection.None | PanDirection.Left
        var panDirection2 = PanDirection.Right & PanDirection.Left
        Hilog.info(1, "Cangjie-Test", "test_hitrace end")
    }

     //add1
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func testEmptyComponent() {
        Hilog.info(1, "Cangjie-Test", "test_emptyComponent start")
        var emptyComponent = EmptyComponent()

        var dPickerResult: DatePickerResult = DatePickerResult(2024, 11, 25)

        var refreshOptions: RefreshOptions = RefreshOptions(refreshing: false)

        var rectA: WindowRect = WindowRect(left: 3, top: 3, width: 3, height: 3)
        var WindowProperties: WindowProperties = WindowProperties(
                    windowRect: rectA,
                    drawableRect: rectA,
                    winType: WindowType.TypeApp,
                    isFullScreen: false,
                    isLayoutFullScreen: false,
                    focusable: false,
                    touchable: false,
                    brightness: 3.0,
                    isKeepScreenOn: false,
                    isPrivacyMode: false,
                    isTransparent: false,
                    id: 333
        )
        Hilog.info(1, "Cangjie-Test", "test_emptyComponent WindowProperties")

        var avoidArea: AvoidArea = AvoidArea(
                    visible: false,
                    leftRect: rectA,
                    topRect: rectA,
                    rightRect: rectA,
                    bottomRect: rectA
        )
        Hilog.info(1, "Cangjie-Test", "test_emptyComponent AvoidArea")

        var measureOptions: MeasureOptions = MeasureOptions(textContent: "textContent")

        var gridRowOption: GridRowOptions = GridRowOptions(32)

        var reuseParams: ReuseParams = ReuseParams([("a", 3), ("b", 4)])
        var aaa = reuseParams.get<Int64>("a")
        @Expect(aaa, 3)

        var testCollectionEx: TestCollectionEx = TestCollectionEx(5)
        var ttt = testCollectionEx.size
        @Expect(ttt, 5)
        testCollectionEx[0] = 5
        var size = testCollectionEx[0]
        @Expect(size, 5)
        Hilog.info(1, "Cangjie-Test", "test_emptyComponent end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testRicheditor() {
        Hilog.info(1, "Cangjie-Test", "test_richeditor start")
        var gridColOption = GridColOptions(33)

        let color = Array<UInt8>(96, { i => UInt8(i+1) })
        let opts = InitializationOptions(UniqueImageSize(4, 6), editable: true, pixelFormat: Rgba8888)
        let pixelMap = createPixelMap(color, opts)
        var LeadingMarginPlaceholder = LeadingMarginPlaceholder(pixelMap: pixelMap, size: (3.vp, 3.vp))
        var richEditorParagraphStyle = RichEditorParagraphStyle(leadingMargin: LeadingMarginPlaceholder)

//        var dragItemInfo = DragItemInfo(pixelMap, { => },"")
//        dragItemInfo.pixelMap = pixelMap
//        var b = dragItemInfo.builder
        Hilog.info(1, "Cangjie-Test", "test_richeditor end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testDisplay() {
        Hilog.info(1, "Cangjie-Test", "test_display start")
        try {
            var display = getDefaultDisplaySync()
            var cutoutInfo = display.getCutoutInfo()
            var foldable = isFoldable()
            var foldStatus = getFoldStatus()
            var foldDisplayMode = getFoldDisplayMode()
            Hilog.info(1, "Cangjie-Test", "test_display foldDisplayMode: success")
            off(ListenerType.ListnerTypeAdd)
            off(ListenerType.ListnerTypeRemove)
            off(ListenerType.ListnerTypeChange)
            off(ListenerType.ListnerTypeFoldAngleChange)
            off(ListenerType.ListnerTypeCaptureStatusChange)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_display foldDisplayMode: ${e.toString()}")
        }
        try {
            getCurrentFoldCreaseRegion()

        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_display getCurrentFoldCreaseRegion: ${e.toString()}")
        }
        let aa = FoldStatusCallback()
        try {
            on(ListenerType.ListnerTypeFoldStatusChange, aa)
            off(ListenerType.ListnerTypeFoldStatusChange, aa)
            off(ListenerType.ListnerTypeFoldStatusChange)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_display FoldStatusCallback: ${e.toString()}")
        }
        let bb = FoldDisplayModeCallback()
        try {
            on(ListenerType.ListnerTypeFoldDisplayModeChange, bb)
            off(ListenerType.ListnerTypeFoldDisplayModeChange, bb)
            off(ListenerType.ListnerTypeFoldDisplayModeChange)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_display FoldDisplayModeCallback: ${e.toString()}")
        }
        try {
            var display2 = getDefaultDisplaySync()
            var orientation: DisplayOrientation = display2.orientation
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_display FoldDisplayModeCallback: ${e.toString()}")
        }
        Hilog.info(1, "Cangjie-Test", "test_display end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testLength() {
        Hilog.info(1, "Cangjie-Test", "test_length start")
        var lengthType: LengthType = LengthType.vp(3.0)
        var a = lengthType.value
        var b = lengthType.unitType
        Hilog.info(1, "Cangjie-Test", "test_length end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testPageTransitionEnter() {
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter start")
        var pageTransitionEnter1: PageTransitionEnter = PageTransitionEnter()
        pageTransitionEnter1.onEnter({a, b => })
        pageTransitionEnter1.slide(SlideEffect.Left)
        pageTransitionEnter1.slide(SlideEffect.Top)
        pageTransitionEnter1.slide(SlideEffect.Bottom)
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter slide")
        pageTransitionEnter1.translate()
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter translate")
        pageTransitionEnter1.scale()
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter scale")
        pageTransitionEnter1.opacity(0.5)
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter opacity")

        var pageTransitionExit: PageTransitionExit = PageTransitionExit()
        pageTransitionExit.slide(SlideEffect.Right)
        Hilog.info(1, "Cangjie-Test", "pageTransitionExit slide")
        pageTransitionExit.onExit({a, b => })
        Hilog.info(1, "Cangjie-Test", "pageTransitionExit onExit")
        Hilog.info(1, "Cangjie-Test", "test_PageTransitionEnter end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testPromptAction() {
        Hilog.info(1, "Cangjie-Test", "test_prompt_action start")
        var baseDialogOptions = BaseDialogOptions(maskRect: Rectangle(x: 0.vp, y: 0.vp, width: 100.percent, height: 100.percent))
        Hilog.info(1, "Cangjie-Test", "test_prompt_action BaseDialogOptions")
        var baseDialogOptions2 = CustomDialogOptions(builder: {=>})
        var showDialogOptions = ShowDialogOptions()
        var actionMenuOptions = ActionMenuOptions(buttons: [])
        var showToastOptions = ShowToastOptions(message: "", shadow: ShadowOptions(radius: 3.0))
        showToastOptions.shadow.getOrThrow()
        Hilog.info(1, "Cangjie-Test", "test_prompt_action end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testWindow() {
        Hilog.info(1, "Cangjie-Test", "test_window start")
        var rectA: WindowRect = WindowRect(left: 3, top: 3, width: 3, height: 3)
        var avoidArea: AvoidArea = AvoidArea(
                    visible: false,
                    leftRect: rectA,
                    topRect: rectA,
                    rightRect: rectA,
                    bottomRect: rectA
        )
        Hilog.info(1, "Cangjie-Test", "test_window on AvoidArea")

        let onKeyboardHeightChangeCb = OnKeyboardHeightChangeCallback()
        var TestSubWindow1 = Global.getMainWindow()
        Hilog.info(1, "Cangjie-Test", "test_window on TestSubWindow1")
        try {
            TestSubWindow1.on(WindowCallbackType.KeyboardHeightChange, onKeyboardHeightChangeCb)
        }catch (e: Exception) {
                Hilog.info(1, "Cangjie-Test", "test_window on" + e.toString())
        }
        try {
            TestSubWindow1.off(WindowCallbackType.KeyboardHeightChange, onKeyboardHeightChangeCb)
        }catch (e: Exception) {
                Hilog.info(1, "Cangjie-Test", "test_window off onKeyboardHeightChangeCb" + e.toString())
        }
        try {
            TestSubWindow1.off(WindowCallbackType.KeyboardHeightChange)
        }catch (e: Exception) {
                Hilog.info(1, "Cangjie-Test", "test_window off" + e.toString())
        }
        Hilog.info(1, "Cangjie-Test", "test_window end")
    }

    @TestCase
    @Tag[APILevel16, TestLevel0]
    func testWindow2() {
        Hilog.info(1, "Cangjie-Test", "test_window2 start")
        let mainWindow: Window = Global.getMainWindow()
        try {
            let property: SystemBarProperties = SystemBarProperties(
                statusBarColor: '#ff00ff',
                statusBarContentColor: '#0000ff',
                navigationBarColor: '#00ff00',
                navigationBarContentColor: '#ff0000',
                enableStatusBarAnimation: true,
                enableNavigationBarAnimation: true
            )
            // mainWindow.setWindowSystemBarProperties(property)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_window2 setWindowSystemBarProperties: ${e.toString()}")
        }
        try {
            mainWindow.resize(20, 20)
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_window2 resize: ${e.toString()}")
        }
        try {
            mainWindow.minimize()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_window2 minimize: ${e.toString()}")
        }
        try {
            mainWindow.snapshot()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_window2 snapshot: ${e.toString()}")
        }
        try {
            mainWindow.destroyWindow()
        } catch (e: Exception) {
            Hilog.info(1, "Cangjie-Test", "test_window2 destroyWindow: ${e.toString()}")
        }
        Hilog.info(1, "Cangjie-Test", "test_window2 end")
    }
}

class PersonView <: View {
    protected init(id: Int64){
        super(id)
    }
}

class DtTestCustomView <: CustomView {
    public init(parent: Option<CustomView>, localStorage: Option<LocalStorage>) {
        super(parent, localStorage)
    }

    public override func aboutToBeDeleted() {
        SubscriberManager
            .getInstance()
            .delete(this)
        this.aboutToBeDeletedInternal()
    }

    public func build() {

    }

    public func getAnRecycleManager() {
        super.getOrCreateRecycleManager()
    }

    public func testInitDt() {
        super.initialRenderView()
        super.updateElement(super.id())
        super.getOrCreateRecycleManager()
        super.getOrCreateRecycleManager()
        super.getRecycleManager()
        super.isRecycled()
        super.delayCompleteRerender(true)
        super.flushDelayCompleteRerender()
        super.aboutToRecycleInternal()

        super.recycleSelf("name")
        super.setParent(DtTestCustomView(Option.None, Option.None))
        super.recycleSelf("name")
        super.addChildById(3, DtTestCustomView(Option.None, Option.None))
        super.traverseChildDoRecycleOrReuse(true)
        super.traverseChildDoRecycleOrReuse(false)
    }
}

class PersonRemoteView <: RemoteView {
    public init(){
        super()
    }
    public func build(): Unit {

    }

    public func testDt() {
        super.rerender()
        super.purgeVariableDependenciesOnElmtId(1)
        super.updateWithJson("updateWithJson")
        super.onAboutToRender()
        super.onAfterRender()
        super.onAboutToBeDeleted()
        super.forceCompleteRerender(true)
        super.aboutToRecycleInternal()
        super.recycleSelf("recycleSelf")
    }
}

class PersonObservable <: Observable {
    public init(){
        super()
    }

    public func testDt() {
        var customview = DtTestCustomView(Option.None, Option.None)
        super.subscribe(customview)
        var isTrue = super.isSubscribed(customview)
        super.notifyChangesInner("Name", ArrayList<Int64>())
    }
}

class PersonGestureType {
    public init(){
    }
}

class PersonObservedObject <: ObservedObject {
    public init(){
        super()
    }

    public override func set(v: ObservedComplexAbstract) {

    }

    public func testDt() {
        super.getPublishVar()
    }
}

class FoldStatusCallback <: Callback1Argument<FoldStatus> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: FoldStatus) {
        callbackMsg += "\nNoInteractionDetected"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1,"Cangjie-App", callbackMsg)
    }
}

class FoldDisplayModeCallback <: Callback1Argument<FoldDisplayMode> {
    public init() {}
    public open func invoke(err: ?BusinessException, event: FoldDisplayMode) {
        callbackMsg += "\nNoInteractionDetected"
        if (let Some(v) <- err) {
            callbackMsg += "error: ${err.toString()}"
        }
        Hilog.info(1,"Cangjie-App", callbackMsg)
    }
}

class TestCollectionEx <: CollectionEx<Int64> {

    private var internalValue: ArrayList<Int64>

    public init(size: Int64) {
        this.internalValue = ArrayList<Int64>(size)
    }

    public prop size: Int64 {
        get() {
            this.internalValue.size
        }
    }

    public operator func [](idx: Int64, value!: Int64): Unit {
        this.internalValue[idx] = value
    }

    public operator func [](idx: Int64): Int64 {
        this.internalValue[idx]
    }
}