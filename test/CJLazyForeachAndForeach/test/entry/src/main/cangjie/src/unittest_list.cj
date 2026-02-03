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

/**
 * Created on 2025/01/31
 */
package ohos_app_cangjie_entry
let _ = testsuites()
private func testsuites():Unit{
    registerTestSuite("StateMgtAndControlUTForEach") {StateMgtAndControlUTForEach()}
    registerTestSuite("StateMgtAndControlUTLazyForEach") {StateMgtAndControlUTLazyForEach()}
}

let UT_views = [
    "StateMgtAndControl4Foreach",
    "StateMgtAndControl4LazyForeach"
]

// ForEach测试用例列表
let UT1 = [
    // 基础构造函数测试
    "ViewForeachTC001",
    "ViewForeachTC002",
    "ViewForeachTC003",
    "ViewForeachTC004",
    "ViewForeachTC005",
    "ViewForeachTC006",
    "ViewForeachTC007",
    "ViewForeachTC008",
    "ViewForeachTC009",
    "ViewForeachTC010",
    "ViewForeachTC011",
    "ViewForeachTC012",
    // itemGenerator测试
    "ViewForeachTC013",
    "ViewForeachTC014",
    "ViewForeachTC015",
    "ViewForeachTC016",
    "ViewForeachTC017",
    // keyGenerator测试
    "ViewForeachTC018",
    "ViewForeachTC019",
    "ViewForeachTC020",
    "ViewForeachTC021",
    "ViewForeachTC022",
    "ViewForeachTC023",
    // 组合场景测试
    "ViewForeachTC024",
    "ViewForeachTC025",
    "ViewForeachTC026",
    "ViewForeachTC027",
    "ViewForeachTC028",
    "ViewForeachTC029",
    "ViewForeachTC030",
    "ViewForeachTC031",
    "ViewForeachTC032",
    "ViewForeachTC033",
    "ViewForeachTC034",
    "ViewForeachTC035",
    "ViewForeachTC036",
    "ViewForeachTC037",
    "ViewForeachTC038",
    "ViewForeachTC039",
    "ViewForeachTC040",
    // 边界和异常场景
    "ViewForeachTC041",
    "ViewForeachTC042"
]

// LazyForEach测试用例列表
let UT2 = [
    // 基础构造函数测试
    "ViewLazyforeachTC001",
    "ViewLazyforeachTC002",
    "ViewLazyforeachTC003",
    "ViewLazyforeachTC004",
    "ViewLazyforeachTC005",
    "ViewLazyforeachTC006",
    "ViewLazyforeachTC007",
    "ViewLazyforeachTC008",
    "ViewLazyforeachTC009",
    "ViewLazyforeachTC010",
    // itemGenerator测试
    "ViewLazyforeachTC011",
    "ViewLazyforeachTC012",
    "ViewLazyforeachTC013",
    "ViewLazyforeachTC014",
    "ViewLazyforeachTC015",
    // keyGenerator测试
    "ViewLazyforeachTC016",
    "ViewLazyforeachTC017",
    "ViewLazyforeachTC018",
    "ViewLazyforeachTC019",
    "ViewLazyforeachTC020",
    "ViewLazyforeachTC021",
    // IDataSource接口测试
    "ViewLazyforeachTC022",
    "ViewLazyforeachTC023",
    "ViewLazyforeachTC024",
    "ViewLazyforeachTC025",
    "ViewLazyforeachTC026",
    "ViewLazyforeachTC027",
    "ViewLazyforeachTC028",
    // 懒加载特性测试
    "ViewLazyforeachTC029",
    "ViewLazyforeachTC032",
    // 组合场景测试
    "ViewLazyforeachTC033",
    "ViewLazyforeachTC034",
    "ViewLazyforeachTC035",
    "ViewLazyforeachTC036",
    "ViewLazyforeachTC037",
    "ViewLazyforeachTC038",
    "ViewLazyforeachTC039",
    "ViewLazyforeachTC040",
    "ViewLazyforeachTC041",
    "ViewLazyforeachTC042",
    // 边界和异常场景
    "ViewLazyforeachTC043"
]

