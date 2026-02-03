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

import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

/**
 * Shared type definitions for state management test cases
 * All test files should import and use these types to avoid redefinition errors
 */

/**
 * CustomModel: Used for @State, @Prop, @Link tests with custom types
 */
@Observed
public class CustomModel {
    @Publish var name: String = ""
    @Publish var value: Int64 = 0
    @Publish var count: Int64 = 0
}

/**
 * NestedItem: Used for complex nested type tests
 */
@Observed
public class NestedItem {
    @Publish var id: Int64 = 0
    @Publish var name: String = ""
    @Publish var value: Int64 = 0
}

/**
 * ComplexModel: Used for complex nested type tests with collections
 */
@Observed
public class ComplexModel {
    @Publish var title: String = ""
    @Publish var items: ObservedArrayList<NestedItem> = ObservedArrayList<NestedItem>([])
}

/**
 * LinkCustomModel: Used specifically for @Link tests with custom types
 */
@Observed
public class LinkCustomModel {
    @Publish var name: String = ""
    @Publish var value: Int64 = 0
    @Publish var active: Bool = false
}


