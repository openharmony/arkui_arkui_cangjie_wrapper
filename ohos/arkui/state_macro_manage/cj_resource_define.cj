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

macro package ohos.arkui.state_macro_manage

import std.io.*
import std.fs.*
import std.ast.*
import std.process.*
import std.convert.*
import std.collection.*
import std.regex.*
import ohos.encoding.json.*

let RES_ORIGIN_POS = 0
let RES_TYPE_POS = 2
let RES_NAME_POS = 4
let MODULE_NAME = "moduleName"
let MODULE_TYPE = "moduleType"
let BUNDLE_NAME = "bundleName"
let APP_ID_DEFINED = "idDefined"
let OHOS_SYS_ID_DEFINED = "ohosSysIdDefined"
let HOS_SYS_ID_DEFINED = "hosSysIdDefined"
let RAWFILE_RESOURCE = "rawfileRes"
let INVALID_RES_ID: Int32 = 0
let APP_ID_MAP = HashMap<String, JsonObject>()
let SYS_ID_MAP = HashMap<String, JsonObject>()
let APP_FLAG = "app"
let SYS_FLAG = "sys"
var RES_ENV: ?ResEnv = None
let RES_TOKEN_PATTERN = Regex("^(app|sys|[.+?]).(\\S+?).(\\S+)$")

struct ResEnv {
    ResEnv(
        var bundleName: String,
        var moduleName: String,
        var moduleType: String,
        var appIdDefined: String,
        var ohosSysIdDefined: String,
        var hosSysIdDefined: String,
        var rawfileRes: String
    ) {}
}

func getResEnv(): ResEnv {
    if (let Some(env) <- RES_ENV) {
        return env
    }
    let curProcess = Process.current
    let env = curProcess.environment
    RES_ENV = ResEnv(
        env.get(BUNDLE_NAME) ?? "",
        env.get(MODULE_NAME) ?? "",
        env.get(MODULE_TYPE) ?? "",
        env.get(APP_ID_DEFINED) ?? "",
        env.get(OHOS_SYS_ID_DEFINED) ?? "",
        env.get(HOS_SYS_ID_DEFINED) ?? "",
        env.get(RAWFILE_RESOURCE) ?? ""
    )
    return RES_ENV.getOrThrow()
}

/**
 * input example
 * @r(app.media.icon)
 * @r(app.string.value, "hello", 1, 1.1)
 * @r(app.plural.value, 5, 5)
 */
public macro r(input: Tokens): Tokens {
    let env = getResEnv()
    let res = input[0..5]
    if (!checkResFormat(res)) {
        throw IllegalArgumentException("Parse resource failed: ${input.toString()} format error.")
    }
    let bundleName = env.bundleName
    let moduleType = env.moduleType
    let moduleName = env.moduleName
    var resParams = Tokens()
    if (input.size > 5) {
        resParams = input[6..input.size]
    }
    let resOrigin = res[RES_ORIGIN_POS].value
    let resName = res[RES_NAME_POS].value
    let resType = res[RES_TYPE_POS].value
    let resTypeVal = getResType(resType)
    var resId = INVALID_RES_ID
    if (resOrigin == APP_FLAG) {
        resId = getAppResId(env.appIdDefined, moduleName, resType, resName)
    }
    if (resOrigin == SYS_FLAG) {
        resId = getSysResId((env.ohosSysIdDefined, env.hosSysIdDefined), resType, resName)
    }
    if (resId == INVALID_RES_ID && !bundleName.isEmpty()) {
        throw NoneValueException("Resource not found: ${resOrigin}.${resType}.${resName}")
    }

    let resToken = quote(__GenerateResource__($bundleName, $moduleType, $moduleName, $resId, $(res.toString()), [$resParams], $resTypeVal))
    return resToken
}

/**
 * input example
 * @rawfile("image.png")
 */
public macro rawfile(input: Tokens): Tokens {
    let env = getResEnv()
    let bundleName = env.bundleName
    let moduleName = env.moduleName
    let moduleType = env.moduleType
    let rawfileRes = env.rawfileRes
    let expr = parseExpr(input)
    if (!isLiteral(expr) || !isStringType(expr)) {
        throw IllegalArgumentException("${input.toString()} invalid rawfile name.")
    }
    let name = (parseExpr(input) as LitConstExpr).getOrThrow().literal.value
    if (!rawfileRes.isEmpty() && !rawfileExists(rawfileRes, name)) {
        throw NoneValueException("Rawfile not found: ${name}")
    }
    return quote(__GenerateResource__($bundleName, $moduleType, $moduleName, 0, $name, [], 30000))
}

func rawfileExists(path: String, fileName: String): Bool {
    let filePath = path + "/" + fileName
    let realPath = canonicalize(filePath)
    return exists(realPath)
}

func getOrCreateAppIdJsonObj(path: String, moduleName: String): JsonObject {
    if (APP_ID_MAP.contains(moduleName)) {
        return APP_ID_MAP[moduleName]
    }
    var jsonObj = JsonObject()
    if (!path.isEmpty() && exists(path)) {
        var stringBuf = String.fromUtf8(File.readFrom(path))
        jsonObj = JsonValue.fromStr(stringBuf).asObject()
        APP_ID_MAP.add(moduleName, jsonObj)
    }
    return jsonObj
}

func getOrCreateSysIdJsonObj(path: String, sysType: String): JsonObject {
    if (SYS_ID_MAP.contains(sysType)) {
        return SYS_ID_MAP[sysType]
    }
    var jsonObj = JsonObject()
    if (!path.isEmpty() && exists(path)) {
        var stringBuf = String.fromUtf8(File.readFrom(path))
        jsonObj = JsonValue.fromStr(stringBuf).asObject()
        SYS_ID_MAP.add(sysType, jsonObj)
    }
    return jsonObj
}

func getAppResId(path: String, moduleName: String, resType: String, resName: String): Int32 {
    let jsonObj = getOrCreateAppIdJsonObj(path, moduleName)
    let recordOpt = jsonObj.get("record")
    var recordArr = ArrayList<JsonValue>([])
    if (let Some(record) <- recordOpt) {
        recordArr = record.asArray().getItems()
    }
    var id = INVALID_RES_ID
    for (item in recordArr) {
        let val = item.asObject()
        let ty = val
            .get("type")
            .getOrThrow({=> NoneValueException("resource type invalid: ${resType}")})
            .asString()
            .getValue()
        let name = val
            .get("name")
            .getOrThrow({=> NoneValueException("can not find resource: ${resName}")})
            .asString()
            .getValue()
        if (ty == resType && name == resName) {
            id = Int32.parse(
                val
                    .get("id")
                    .getOrThrow({=> NoneValueException("can not find resource: ${resName}")})
                    .asString()
                    .getValue())
            break
        }
    }
    return id
}

func findSysId(obj: JsonObject, resType: String, resName: String): Int32 {
    var id = INVALID_RES_ID
    if (obj.containsKey("startId")) {
        let startId = Int32.parse(
            obj
                .get("startId")
                .getOrThrow({=> NoneValueException("can not find system resource")})
                .asString()
                .getValue())
        var recordOpt = obj.get("record")
        var recordArr = ArrayList<JsonValue>([])
        if (let Some(record) <- recordOpt) {
            recordArr = record.asArray().getItems()
        }
        for (item in recordArr) {
            let val = item.asObject()
            let ty = val
                .get("type")
                .getOrThrow({=> NoneValueException("resource type invalid: ${resType}")})
                .asString()
                .getValue()
            let name = val
                .get("name")
                .getOrThrow({=> NoneValueException("can not find resource: ${resName}")})
                .asString()
                .getValue()
            if (ty == resType && name == resName) {
                if (val.containsKey("flags")) {
                    let flags = val
                        .get("flags")
                        .getOrThrow({=> NoneValueException("can not find resource: ${resName}")})
                        .asString()
                        .getValue()
                    if (flags == "private") {
                        break
                    }
                }
                id = Int32.parse(
                    val
                        .get("order")
                        .getOrThrow({=> NoneValueException("can not find resource: ${resName}")})
                        .asInt()
                        .getValue()
                        .toString()) + startId
                break
            }
        }
    }
    return id
}

func getSysResId(path: (String, String), resType: String, resName: String): Int32 {
    var id = INVALID_RES_ID
    let ohosObj = getOrCreateSysIdJsonObj(path[0], "ohos")
    let hosObj = getOrCreateSysIdJsonObj(path[1], "hos")
    id = findSysId(ohosObj, resType, resName)
    if (id != INVALID_RES_ID) {
        return id
    }
    id = findSysId(hosObj, resType, resName)
    return id
}

func getResType(val: String): Int64 {
    match (val) {
        case "color" => 10001
        case "float" => 10002
        case "string" => 10003
        case "plural" => 10004
        case "boolean" => 10005
        case "intarray" => 10006
        case "integer" => 10007
        case "pattern" => 10008
        case "strarray" => 10009
        case "media" => 20000
        case "rawfile" => 30000
        case "symbol" => 40000
        case _ => 0
    }
}

func checkResFormat(input: Tokens): Bool {
    let inputStr = input.toString()
    let matcher = RES_TOKEN_PATTERN.matcher(inputStr)
    return matcher.allCount() > 0
}
