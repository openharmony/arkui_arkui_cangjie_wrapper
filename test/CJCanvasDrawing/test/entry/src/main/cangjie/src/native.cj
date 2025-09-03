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

import std.collection.*
import std.convert.*

public class JsonException <: Exception {
    public init() {
        super()
    }

    public init(message: String) {
        super(message)
    }

    public override func getClassName(): String {
        return "JsonException"
    }
}

/**
 * This enum used for identify the JSON type.
 */
public enum JsonKind {
    JsNull | JsBool | JsInt | JsFloat | JsString | JsArray | JsObject
}

sealed abstract class JsonValue <: ToString {

    public func toString(): String

    public func toJsonString(): String

    public func kind(): JsonKind

    public static func fromStr(s: String): JsonValue {
        parseString(s)
    }

    public func asNull(): JsonNull {
        match (this) {
            case jsonNull: JsonNull => jsonNull
            case _ => throw JsonException("Fail to convert to JsonNull")
        }
    }

    public func asBool(): JsonBool {
        match (this) {
            case jsonBool: JsonBool => jsonBool
            case _ => throw JsonException("Fail to convert to JsonBool")
        }
    }

    public func asInt(): JsonInt {
        match (this) {
            case jsonInt: JsonInt => jsonInt
            case _ => throw JsonException("Fail to convert to JsonInt")
        }
    }

    public func asFloat(): JsonFloat {
        match (this) {
            case jsonFloat: JsonFloat => jsonFloat
            case jsonInt: JsonInt => JsonFloat(jsonInt.getValue())
            case _ => throw JsonException("Fail to convert to JsonFloat")
        }
    }

    public func asString(): JsonString {
        match (this) {
            case jsonString: JsonString => jsonString
            case _ => throw JsonException("Fail to convert to JsonString")
        }
    }

    public func asArray(): JsonArray {
        match (this) {
            case jsonArray: JsonArray => jsonArray
            case _ => throw JsonException("Fail to convert to JsonArray")
        }
    }

    public func asObject(): JsonObject {
        match (this) {
            case jsonObject: JsonObject => jsonObject
            case _ => throw JsonException("Fail to convert to JsonObject")
        }
    }
}

/*
 * Size of indentation in JSON format.
 */
const INDENT_SIZE: Int64 = 2

/**
 * JsonNull class used for encapsulate JSON data: null.
 */
public class JsonNull <: JsonValue {

    public func kind(): JsonKind {
        return JsNull
    }

    public func toString(): String {
        return "null"
    }

    public func toJsonString(): String {
        return toString()
    }
}

/**
 * JsonBool class used for encapsulate JSON data: true or false.
 */
public class JsonBool <: JsonValue {
    /* Json data of the JsonBool(Bool). */
    private var value: Bool

    public init(bv: Bool) {
        this.value = bv
    }

    public func getValue(): Bool {
        return value
    }

    public func kind(): JsonKind {
        return JsBool
    }

    public func toString(): String {
        return value.toString()
    }

    public func toJsonString(): String {
        return toString()
    }
}

/**
 * JsonInt class used for encapsulate JSON data: number(integer).
 */
public class JsonInt <: JsonValue {
    /* Json data of the JsonInt(Int64). */
    private var value: Int64

    public init(iv: Int64) {
        this.value = iv
    }

    public func getValue(): Int64 {
        return value
    }

    public func kind(): JsonKind {
        return JsInt
    }

    public func toString(): String {
        return value.toString()
    }

    public func toJsonString(): String {
        return toString()
    }
}

/**
 * JsonFloat class used for encapsulate JSON data: number(float).
 */
public class JsonFloat <: JsonValue {
    /* Json data of the JsonFloat(Float64). */
    private var value: Float64

    public init(fv: Float64) {
        this.value = fv
    }

    public init(v: Int64) {
        this.value = Float64(v)
    }

    public func getValue(): Float64 {
        return value
    }

    public func kind(): JsonKind {
        return JsFloat
    }

    public func toString(): String {
        return value.toString()
    }

    public func toJsonString(): String {
        return toString()
    }
}

/**
 * JsonString class used for encapsulate JSON data: string.
 */
public class JsonString <: JsonValue {
    /* Json data of the JsonString(String). */
    var value: String

    public init(sv: String) {
        this.value = sv
    }

    public func getValue(): String {
        return value
    }

    public func kind(): JsonKind {
        return JsString
    }

    public func toString(): String {
        let buff = WriteBuffer(value.size + 2)
        jsonWriteWithoutFormat(this, buff)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }

    public func toJsonString(): String {
        let buff = WriteBuffer(value.size + 2)
        jsonWriteWithoutFormat(this, buff)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }
}

/**
 * JsonArray class used for encapsulate JSON data: array.
 */
public class JsonArray <: JsonValue {
    /* Json data of the JsonArray(ArrayList<JsonValue>). */
    private var items: ArrayList<JsonValue>

    init(capacity: Int64) {
        items = ArrayList<JsonValue>(capacity)
    }

    public init() {
        items = ArrayList<JsonValue>()
    }

    public init(list: ArrayList<JsonValue>) {
        items = list
    }

    public init(list: Array<JsonValue>) {
        items = ArrayList<JsonValue>(list)
    }

    public func kind(): JsonKind {
        return JsArray
    }

    public func toJsonString(): String {
        return toJsonString(0)
    }

    @OverflowWrapping
    public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = "  "): String {
        if (depth < 0) {
            throw IllegalArgumentException("Depth cannot be negative.")
        }
        if (!indent.isContainOnlySpaceAndTab()) {
            throw IllegalArgumentException("Indent must be an empty string or any combination of spaces and tabs.")
        }
        let buff = WriteBuffer(asumecapacity(this))
        jsonWriteArray(this, buff, depth, bracketInNewLine, indent)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }

    public func toString(): String {
        let buff = WriteBuffer(asumecapacity(this))
        jsonWriteWithoutFormat(this, buff)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }

    public func size(): Int64 {
        return items.size
    }

    public func add(jv: JsonValue): JsonArray {
        items.add(jv)
        return this
    }

    public func get(index: Int64): Option<JsonValue> {
        return items.get(index)
    }

    public operator func [](index: Int64): JsonValue {
        return match (items.get(index)) {
            case Some(v) => v
            case None => throw JsonException("The index ${index} of JsonArray does not exist.")
        }
    }

    public func getItems(): ArrayList<JsonValue> {
        return items
    }
}

/**
 * JsonObject class used for encapsulate JSON data: object.
 */
public class JsonObject <: JsonValue {
    /* Json data of the JsonObject(HashMap<String,JsonValue>). */
    private var fields: HashMap<String, JsonValue>

    public init() {
        fields = HashMap<String, JsonValue>()
    }

    init(capacity: Int64) {
        fields = HashMap<String, JsonValue>(capacity)
    }

    public init(map: HashMap<String, JsonValue>) {
        fields = map
    }

    public func kind(): JsonKind {
        return JsObject
    }

    public func toJsonString(): String {
        return toJsonString(0)
    }

    public func toJsonString(depth: Int64, bracketInNewLine!: Bool = false, indent!: String = "  "): String {
        if (depth < 0) {
            throw IllegalArgumentException("Depth cannot be negative.")
        }
        if (!indent.isContainOnlySpaceAndTab()) {
            throw IllegalArgumentException("Indent must be an empty string or any combination of spaces and tabs.")
        }
        let buff = WriteBuffer(asumecapacity(this))
        jsonWriteObject(this, buff, depth, bracketInNewLine, indent)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }

    public func toString(): String {
        let buff = WriteBuffer(asumecapacity(this))
        jsonWriteWithoutFormat(this, buff)
        return unsafe{String.fromUtf8Unchecked(buff.getAndClear())}
    }

    public func size(): Int64 {
        return fields.size
    }

    public func containsKey(key: String): Bool {
        return fields.contains(key)
    }

    public func put(key: String, v: JsonValue): Unit {
        fields.add(key, v)
    }

    public func get(key: String): Option<JsonValue> {
        return fields.get(key)
    }

    public operator func [](key: String): JsonValue {
        return match (fields.get(key)) {
            case Some(v) => v
            case None => throw JsonException("The Value of JsonObject does not exist")
        }
    }

    public func getFields(): HashMap<String, JsonValue> {
        return fields
    }
}

extend String {
    func isContainOnlySpaceAndTab() {
        for (i in this) {
            if (i != UInt8(UInt32(r' ')) && i != UInt8(UInt32(r'\t'))) {
                return false
            }
        }
        return true
    }
}


/**
 * @brief Get rows and columns of the error position
 *
 * @param Array<UInt8> JSON string array
 * @param Int64 The order of the error characters in the string
 * @return (Int64, Int64) Rows and columns of the error position
 * @throws IllegalArgumentException if there is no valid utf8 leading code in array `strArr`.
 */
func getErrRowAndCol(strArr: Array<UInt8>, errPos: Int64): (Int64, Int64) {
    var tempPos: Int64 = 0
    var errRow: Int64 = 1
    var errCol: Int64 = 1
    var lineStartPos: Int64 = 0
    while (tempPos < errPos) {
        let temp = Rune.fromUtf8(strArr, tempPos)
        let tempChr = temp[0]
        if (tempChr == r'\n') {
            errRow += 1
            lineStartPos = tempPos + 1
        }
        tempPos += temp[1]
    }
    while (lineStartPos < errPos) {
        let tempChr = Rune.fromUtf8(strArr, lineStartPos)[0]
        if (tempChr == r' ') {
            lineStartPos += 1
        } else {
            break
        }
    }
    while (lineStartPos < errPos) {
        let temp = Rune.fromUtf8(strArr, lineStartPos)
        let tempSize = temp[1]
        errCol += 1
        lineStartPos += tempSize
    }
    return (errRow, errCol)
}

/**
 * @brief Handle Escape Characters and Multibyte Characters
 *
 * @param Rune error characters
 * @return String Escaped character string
 */
func handleErrChr(errChr: Rune): String {
    match(errChr) {
        case r'\0' => return "\\0"
        case r'\b' => return "\\b"
        case r'\t' => return "\\t"
        case r'\n' => return "\\n"
        case r'\f' => return "\\f"
        case r'\r' => return "\\r"
        case r'\v' => return "\\v"
        case _ => return "${errChr}"
    }
}

enum NumberSystem {
    Binary |
    Octal |
    Decimal |
    Hex
}

class JsonParser {
    let data: Array<Byte>
    let size: Int64
    var offset: Int64
    let cache: Array<JsonValue>
    var cacheSize: Int64
    let strCache: ArrayList<Byte>

    init (str: String) {
        this.data = unsafe { str.rawData() }
        this.size = data.size
        this.offset = 0
        if ((size >> 1) > 16) {
            this.cache = Array<JsonValue>(size >> 1, repeat: JsonNull())
        } else {
            this.cache = Array<JsonValue>(16, repeat: JsonNull())
        }
        this.cacheSize = 0
        this.strCache = ArrayList<Byte>()
    }
}

func skipWhiteSpace(parser: JsonParser): Unit {
    var tmp = parser.data[parser.offset]
    while (tmp == UInt8(UInt32(r' ')) || tmp == UInt8(UInt32(r'\t')) || tmp == UInt8(UInt32(r'\n')) || tmp == UInt8(UInt32(r'\r'))) {
        parser.offset++
        if (parser.offset >= parser.size) {
            return
        }
        tmp = parser.data[parser.offset]
    }
}

func parseString(str: String): JsonValue {
    if (str.size == 0) {
        throw JsonException("Json String is empty!")
    }
    let parser = JsonParser(str)
    let res = parseJson(parser)
    if (parser.offset <= (parser.size - 1)) {
        skipWhiteSpace(parser)
    }
    if (parser.offset <= (parser.size - 1)) {
        let errRowAndCol = getErrRowAndCol(parser.data, parser.offset)
        let (errChr, _) = Rune.fromUtf8(parser.data, parser.offset)
        let errStr = handleErrChr(errChr)
        let errMsg: String = "Parse Error: [Line]: ${errRowAndCol[0]}, [Pos]: ${errRowAndCol[1]}, [Error]: Unexpected character: \'${errStr}\'."
        throw JsonException("the json data is Non-standard, please check:\n${errMsg}")
    }
    return res
}

func parseJson(parser: JsonParser): JsonValue {
    try {
        skipWhiteSpace(parser)
        let start = parser.data[parser.offset]
        match {
            case start == UInt8(UInt32(r'{')) => return parseJsonObject(parser)
            case start == UInt8(UInt32(r'[')) => return parseJsonArray(parser)
            case start == UInt8(UInt32(r'n')) => return parseJsonNull(parser)
            case start == UInt8(UInt32(r't')) => return parseJsonTrue(parser)
            case start == UInt8(UInt32(r'f')) => return parseJsonFalse(parser)
            case start == UInt8(UInt32(r'\"')) => return parseJsonString(parser)
            case start >= UInt8(UInt32(r'0')) && start <= UInt8(UInt32(r'9')) || start == UInt8(UInt32(r'-')) => return parseJsonNumber(parser)
            case _ => throw JsonException()
        }
    } catch (_: Exception) {
        unsafe {
            let strArr = parser.data
            var errPos = parser.offset
            if (errPos >= strArr.size) {
                errPos = strArr.size - 1
            }
            let errRowAndCol = getErrRowAndCol(strArr, errPos)
            let (errChr, _) = Rune.fromUtf8(strArr, errPos)
            let errStr = handleErrChr(errChr)
            let errMsg: String = "Parse Error: [Line]: ${errRowAndCol[0]}, [Pos]: ${errRowAndCol[1]}, [Error]: Unexpected character: \'${errStr}\'."
            throw JsonException("the json data is Non-standard, please check:\n${errMsg}")
        }
    }
}

func parseJsonObject(parser: JsonParser): JsonObject {
    parser.offset++
    skipWhiteSpace(parser)
    var count = 0
    var first = true
    while (parser.data[parser.offset] != UInt8(UInt32(r'}'))) {
        if (first) {
            first = false
        } else if (parser.data[parser.offset] == UInt8(UInt32(r','))) {
            parser.offset++
        } else {
            throw JsonException()
        }
        skipWhiteSpace(parser)
        let key = parseJsonString(parser)
        skipWhiteSpace(parser)
        if (parser.data[parser.offset] != UInt8(UInt32(r':'))) {
            throw JsonException()
        }
        parser.offset++
        let value = parseJson(parser)
        skipWhiteSpace(parser)
        parser.cache[parser.cacheSize] = key
        parser.cache[parser.cacheSize + 1] = value
        count++
        parser.cacheSize += 2
    }
    parser.offset++
    let map = HashMap<String, JsonValue>(count)
    for (i in count..0:-1) {
        let key = parser.cache[parser.cacheSize - (i * 2)].asString().getValue()
        let value = parser.cache[parser.cacheSize - (i * 2) + 1]
        map.add(key, value)
    }
    parser.cacheSize -= (2 * count)
    return JsonObject(map)
}

func parseJsonArray(parser: JsonParser): JsonArray {
    parser.offset++
    skipWhiteSpace(parser)
    var count = 0
    var first = true
    while (parser.data[parser.offset] != UInt8(UInt32(r']'))) {
        if (first) {
            first = false
        } else if (parser.data[parser.offset] == UInt8(UInt32(r','))) {
            parser.offset++
        } else {
            throw JsonException()
        }
        let item = parseJson(parser)
        skipWhiteSpace(parser)
        parser.cache[parser.cacheSize] = item
        count++
        parser.cacheSize++
    }
    parser.offset++
    let arr = ArrayList<JsonValue>(count)
    for (i in count..0:-1) {
        let item = parser.cache[parser.cacheSize - i]
        arr.add(item)
    }
    parser.cacheSize -= count
    return JsonArray(arr)
}

func parseJsonNull(parser: JsonParser): JsonNull {
    if (parser.data[parser.offset] != UInt8(UInt32(r'n'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'u'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'l'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'l'))) {
        throw JsonException()
    }
    parser.offset++
    return JsonNull()
}

func parseJsonTrue(parser: JsonParser): JsonBool {
    if (parser.data[parser.offset] != UInt8(UInt32(r't'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'r'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'u'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'e'))) {
        throw JsonException()
    }
    parser.offset++
    return JsonBool(true)
}

func parseJsonFalse(parser: JsonParser): JsonBool {
    if (parser.data[parser.offset] != UInt8(UInt32(r'f'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'a'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'l'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r's'))) {
        throw JsonException()
    }
    parser.offset++
    if (parser.data[parser.offset] != UInt8(UInt32(r'e'))) {
        throw JsonException()
    }
    parser.offset++
    return JsonBool(false)
}

func parseJsonNumber(parser: JsonParser): JsonValue {
    var isFloat = false
    let leftIndex = parser.offset
    var rightIndex = parser.offset
    parseSign(parser)
    let numSystem = parseNumberSystem(parser)
    let isNumber = checkNumberSystem(numSystem)
    parseInteger(parser, isNumber)
    isFloat = parseDecimal(parser, numSystem)
    if (isFloat) {
        parseExponent(parser, numSystem)
    } else {
        isFloat = parseExponent(parser, numSystem)
    }
    rightIndex = parser.offset
    let numStr = unsafe { String.fromUtf8Unchecked(parser.data[leftIndex..rightIndex]) }
    if (isFloat) {
        return JsonFloat(Float64.parse(numStr))
    }
    return JsonInt(Int64.parse(numStr))
}

func parseSign(parser: JsonParser): Unit {
    if (parser.data[parser.offset] == UInt8(UInt32(r'-'))) {
        parser.offset++
    }
}

func parseNumberSystem(parser: JsonParser): NumberSystem {
    if (parser.data[parser.offset] == UInt8(UInt32(r'0'))) {
        parser.offset++
        if (parser.offset >= parser.size) {
            parser.offset--
            return Decimal
        }
        match (parser.data[parser.offset]) {
            case 'b' | 'B' =>
                parser.offset++
                return Binary
            case 'o' | 'O' =>
                parser.offset++
                return Octal
            case 'x' | 'X' =>
                parser.offset++
                return Hex
            case _ =>
                parser.offset--
        }
    }
    return Decimal
}

func checkNumberSystem(numSystem: NumberSystem): (Byte) -> Bool {
    match (numSystem) {
        case Binary => return { byte: Byte => byte >= UInt8(UInt32(r'0')) && byte <= UInt8(UInt32(r'1')) }
        case Octal => return { byte: Byte => byte >= UInt8(UInt32(r'0')) && byte <= UInt8(UInt32(r'7')) }
        case Decimal => return { byte: Byte => byte >= UInt8(UInt32(r'0')) && byte <= UInt8(UInt32(r'9')) }
        case Hex => return { byte: Byte => byte >= UInt8(UInt32(r'0')) && byte <= UInt8(UInt32(r'9')) || byte >= UInt8(UInt32(r'a')) && byte <= UInt8(UInt32(r'f')) || byte >= UInt8(UInt32(r'A')) && byte <= UInt8(UInt32(r'F')) }
    }
}

func parseInteger(parser: JsonParser, isNumber: (Byte) -> Bool): Unit {
    var nextByte = parser.data[parser.offset]
    var hasNumber = false
    if (nextByte == UInt8(UInt32(r'0'))) {
        parser.offset++
        return
    }
    while (isNumber(nextByte)) {
        hasNumber = true
        parser.offset++
        if (parser.offset >= parser.size) {
            return
        }
        nextByte = parser.data[parser.offset]
    }
    if (!hasNumber) {
        throw JsonException()
    }
}

func parseDecimal(parser: JsonParser, numSystem: NumberSystem): Bool {
    if (parser.offset >= parser.size) {
        return false
    }
    if (parser.data[parser.offset] != UInt8(UInt32(r'.'))) {
        return false
    }
    match (numSystem) {
        case Decimal => ()
        case _ => throw JsonException()
    }
    parser.offset++
    return parseDigit(parser)
}

func parseExponent(parser: JsonParser, numSystem: NumberSystem): Bool {
    if (parser.offset >= parser.size) {
        return false
    }
    var nextByte = parser.data[parser.offset]
    if (nextByte != UInt8(UInt32(r'e')) && nextByte != UInt8(UInt32(r'E'))) {
        return false
    }
    match (numSystem) {
        case Decimal => ()
        case _ => throw JsonException()
    }
    parser.offset++
    nextByte = parser.data[parser.offset]
    if (nextByte == UInt8(UInt32(r'+')) || nextByte == UInt8(UInt32(r'-'))) {
        parser.offset++
    }
    return parseDigit(parser)
}

func parseDigit(parser: JsonParser): Bool {
    var nextByte = parser.data[parser.offset]
    var hasNumber = false
    while (nextByte >= UInt8(UInt32(r'0')) && nextByte <= UInt8(UInt32(r'9'))) {
        hasNumber = true
        parser.offset++
        if (parser.offset >= parser.size) {
            return true
        }
        nextByte = parser.data[parser.offset]
    }
    if (!hasNumber) {
        throw JsonException()
    }
    return true
}

func isHexNum(char: UInt8): Bool {
    if (!((char >= UInt8(UInt32(r'0')) && char <= UInt8(UInt32(r'9'))) || (char >= UInt8(UInt32(r'a')) && char <= UInt8(UInt32(r'f'))) || (char >= UInt8(UInt32(r'A')) && char <= UInt8(UInt32(r'F'))))) {
        return false
    }
    return true
}

func parseJsonString(parser: JsonParser): JsonString {
    if (parser.data[parser.offset] != UInt8(UInt32(r'\"'))) {
        throw JsonException("Fail to parseJsonString")
    }
    parser.offset++
    let start = parser.offset
    var next = parser.data[parser.offset]
    var needEscape = false
    var tmpStart = start
    while (next != UInt8(UInt32(r'\"'))) {
        if (next == UInt8(UInt32(r'\\'))) {
            if (!needEscape) {
                needEscape = true
            }
            parser.strCache.add(all: parser.data[tmpStart..parser.offset])
            parser.offset++
            handleEscape(parser)
            tmpStart = parser.offset + 1
        }
        parser.offset++
        next = parser.data[parser.offset]
    }
    parser.offset++
    if (!needEscape) {
        return unsafe { JsonString(String.fromUtf8Unchecked(parser.data[start..(parser.offset - 1)])) }
    } else {
        parser.strCache.add(all: parser.data[tmpStart..parser.offset - 1])
        let res = unsafe { JsonString(String.fromUtf8Unchecked(parser.strCache.getRawArray()[0..parser.strCache.size])) }
        parser.strCache.clear()
        return res
    }
}

func getNextHexNum(parser: JsonParser): Byte {
    parser.offset++
    let byte = parser.data[parser.offset]
    if (!isHexNum(byte)) {
        throw JsonException()
    }
    return byte
}

func handleEscape(parser: JsonParser): Unit {
    match (parser.data[parser.offset]) {
        case '\"' => parser.strCache.add(UInt8(UInt32(r'\"')))
        case '\\' => parser.strCache.add(UInt8(UInt32(r'\\')))
        case '/' => parser.strCache.add(UInt8(UInt32(r'/')))
        case 'b' => parser.strCache.add(UInt8(UInt32(r'\b')))
        case 'f' => parser.strCache.add(UInt8(UInt32(r'\f')))
        case 'n' => parser.strCache.add(UInt8(UInt32(r'\n')))
        case 'r' => parser.strCache.add(UInt8(UInt32(r'\r')))
        case 't' => parser.strCache.add(UInt8(UInt32(r'\t')))
        case 'u' =>
            let byte1 = getNextHexNum(parser)
            let byte2 = getNextHexNum(parser)
            let byte3 = getNextHexNum(parser)
            let byte4 = getNextHexNum(parser)
            let arr:Array<Byte> = [UInt8(UInt32(r'\'')), UInt8(UInt32(r'\\')), UInt8(UInt32(r'u')), UInt8(UInt32(r'{')), byte1, byte2, byte3, byte4, UInt8(UInt32(r'}')), UInt8(UInt32(r'\''))]
            try {
                let chr = unsafe { Rune.parse(String.fromUtf8Unchecked(arr)) }
                if (UInt32(chr) <= 127) {
                    parser.strCache.add(UInt8(UInt32(chr)))
                } else {
                    let str = chr.toString()
                    unsafe { parser.strCache.add(all: str.rawData()) }
                }
            } catch (_ :Exception) {
                parser.offset++
                if (parser.data[parser.offset] != UInt8(UInt32(r'\\'))) {
                    throw JsonException()
                }
                parser.offset++
                if (parser.data[parser.offset] != UInt8(UInt32(r'u'))) {
                    throw JsonException()
                }
                let byte5 = getNextHexNum(parser)
                let byte6 = getNextHexNum(parser)
                let byte7 = getNextHexNum(parser)
                let byte8 = getNextHexNum(parser)
                let str1 = unsafe { String.fromUtf8Unchecked([UInt8(UInt32(r'0')), UInt8(UInt32(r'x')), byte1, byte2, byte3, byte4]) }
                let str2 = unsafe { String.fromUtf8Unchecked([UInt8(UInt32(r'0')), UInt8(UInt32(r'x')), byte5, byte6, byte7, byte8]) }
                let num1 = UInt16.parse(str1) & 0b0000001111111111
                let num2 = UInt16.parse(str2) & 0b0000001111111111
                let str = Rune((((UInt32(num1)) << 10) | (UInt32(num2))) + 0x10000).toString()
                unsafe { parser.strCache.add(all: str.rawData()) }
            }
        case _ => throw JsonException("Fail to parseJsonString")
    }
}


@FastNative
foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32
@FastNative
foreign func CJ_CORE_Float64ToCPointer(num: Float64): CPointer<UInt8>
@FastNative
foreign func strlen(str: CPointer<UInt8>): UIntNative


let BOOL_TRUE_STRING = "true".toArray()
let BOOL_FALSE_STRING = "false".toArray()
let NULL_STRING = "null".toArray()

const MIN_CAPACITY = 16
const BLANK: Byte = ' '
/*
 * This is a stringbuilder customized for json serialization.
 * Compared with stringbuilder, it has the following optimization points:
 *  1. Constructor with capacity, and func asumecapacity(jv: JsonVaule) is used to
 *     estimate the capacity in advance. Although this is not accurate,
 *     it can reduce a large amount of memory application and copy during
 *     long jsonvalue serialization.
 *  2. The cache(_buffer) is initialized with blank character. when adding blanks,
 *     only need to move the pointer.
 *  3. append(str: String), faster then StringBuilder.
 *  4. func removetail(), faster then StringBuilder.
 */
class WriteBuffer {
    private var _buffer: Array<Byte>
    private var _size: Int64 = 0

    /*
     * buff must be filled with blank
    */
    init(capacity: Int64) {
        let cap = if (capacity > MIN_CAPACITY) {
            capacity
        } else {
            MIN_CAPACITY
        }
        _buffer = Array<Byte>(cap, repeat: BLANK)
    }

    public prop size: Int64 {
        get(){
            return _size
        }
    }

    /*
     * buff must be filled with blank
    */
    func checkAndExpend(addition: Int64): Unit {
        let minCapacity = _size + addition
        let oldCapacity: Int64 = _buffer.size
        if (minCapacity < oldCapacity) {
            return
        }

        var newCapacity: Int64 = oldCapacity + (oldCapacity >> 1)
        if (newCapacity < minCapacity) {
            newCapacity = minCapacity
        }
        let newArr: Array<Byte> = Array<Byte>(newCapacity, repeat: BLANK)
        _buffer.copyTo(newArr, 0, 0, _size)
        _buffer = newArr
    }

    func append(arr: Array<Byte>): WriteBuffer {
        checkAndExpend(arr.size)

        if(arr.size < 32) {
            for (index in 0..arr.size) {
                _buffer[_size] = arr[index]
                _size ++
            }
        } else {
            arr.copyTo(_buffer, 0, _size, arr.size)
            _size += arr.size
        }
        return this
    }

    func append(str: String): WriteBuffer {
        append(unsafe{str.rawData()})
        return this
    }

    func append(byte: Byte): WriteBuffer{
        checkAndExpend(1)
        _buffer[_size] = byte
        _size ++
        return this
    }

    func append(n: Int64): WriteBuffer {
        checkAndExpend(22)
        let len = writeBufferAppendInt(_buffer[_size..], n)
         _size += len
        return this
    }

    func append(fl: Float64): WriteBuffer {
        unsafe {
            let p: CPointer<UInt8> = CJ_CORE_Float64ToCPointer(fl)
            if (p.isNull()) {
                return this
            }
            let cpSize = unsafe { Int64(strlen(p)) }
            checkAndExpend(cpSize)
            let dest = acquireArrayRawData(_buffer)
            memcpy_s(dest.pointer + _size, UIntNative(_buffer.size - _size), p, UIntNative(cpSize))
            releaseArrayRawData(dest)
            LibC.free(p)
            _size += cpSize
        }

        // the result of CJ_CORE_Float64ToCPointer have at least 6 decimal points
        // there is no out-of-bounds risk
        while (_buffer[_size - 1] == UInt8(UInt32(r'0'))) {
            _size--
        }
        if (_buffer[_size - 1] == UInt8(UInt32(r'.'))) {
            _size--
        }
        return this
    }

    func append(b: Bool): WriteBuffer {
        if (b) {
            append(BOOL_TRUE_STRING)
        } else {
            append(BOOL_FALSE_STRING)
        }
    }

    func appendBlank(n: Int64): WriteBuffer {
        checkAndExpend(n)
        _size += n
        return this
    }


    func removetail(): WriteBuffer{
        if(_size > 0) {
            _size--
        }
        return this
    }

    func appendEscape(str: String): WriteBuffer {
        var escapenum = 0

        escapenum = stringEscapeCharNumGet(str.toArray())

        if (escapenum == 0) {
            append(str)
            return this
        } else {
            checkAndExpend(str.size + escapenum)
            let len = replaceEscapeChar(str.toArray(), str.size, _buffer[_size..])
            _size += len
            return this
        }
    }

    func getAndClear(): Array<Byte>{
        let ret = _buffer[0.._size]
        _buffer = Array<Byte>(0, repeat: BLANK)
        _size = 0
        return ret
    }
}


func jsonWriteWithoutFormat(json: JsonValue, buff: WriteBuffer): Unit {
    match (json) {
        case jo: JsonObject =>
            if (jo.size() == 0) {
                buff.append("{}".toArray())
                return
            }
            buff.append(UInt8(UInt32(r'{')))
            for ((strKey, jv) in jo.getFields()) {
                buff.append(UInt8(UInt32(r'\"'))).appendEscape(strKey).append("\":".toArray())
                jsonWriteWithoutFormat(jv, buff)
                buff.append(UInt8(UInt32(r',')))
            }
            buff.removetail()
            buff.append(UInt8(UInt32(r'}')))
        case ja: JsonArray =>
            if (ja.size() == 0) {
                buff.append("[]".toArray())
                return
            }
            buff.append(UInt8(UInt32(r'[')))
            for (item in ja.getItems()) {
                jsonWriteWithoutFormat(item, buff)
                buff.append(UInt8(UInt32(r',')))
            }
            buff.removetail()
            buff.append(UInt8(UInt32(r']')))
        case js: JsonString =>
            buff.append(UInt8(UInt32(r'\"'))).appendEscape(js.getValue()).append(UInt8(UInt32(r'\"')))
        case jb: JsonBool =>
            buff.append(jb.getValue())
        case ji: JsonInt =>
            buff.append(ji.getValue())
        case jf: JsonFloat =>
            buff.append(jf.getValue())
        case _ =>
            buff.append(NULL_STRING)
    }
}

func jsonWriteObject(json: JsonObject, buff: WriteBuffer, depth: Int64, bracketInNewLine: Bool, indent: String): Unit {
    if (bracketInNewLine) {
        for (_ in 0..depth) {
            buff.append(indent)
        }
    }

    if (json.size() == 0) {
        buff.append("{}".toArray())
        return
    }

    buff.append(UInt8(UInt32(r'{')))
    let new_depth = depth + 1
    for((key, jv) in json.getFields()) {
        buff.append(UInt8(UInt32(r'\n')))
        for (_ in 0..new_depth) {
            buff.append(indent)
        }
        buff.append(UInt8(UInt32(r'\"'))).appendEscape(key).append(UInt8(UInt32(r'\"'))).append(UInt8(UInt32(r':'))).appendBlank(1)
        match(jv) {
            case jo: JsonObject => jsonWriteObject(jo, buff, new_depth, false, indent)
            case ja: JsonArray => jsonWriteArray(ja, buff, new_depth, false, indent)
            case _ => jsonWriteWithoutFormat(jv, buff)
        }
        buff.append(UInt8(UInt32(r',')))
    }
    buff.removetail()
    buff.append(UInt8(UInt32(r'\n')))
    for (_ in 0..depth) {
        buff.append(indent)
    }
    buff.append(UInt8(UInt32(r'}')))
}

func jsonWriteArray(json: JsonArray, buff: WriteBuffer, depth: Int64, bracketInNewLine: Bool, indent: String): Unit {
    if (bracketInNewLine) {
        for (_ in 0..depth) {
            buff.append(indent)
        }
    }

    if (json.size() == 0) {
        buff.append("[]".toArray())
        return
    }

    buff.append(UInt8(UInt32(r'[')))
    let new_depth = depth + 1
    for(v in json.getItems()) {
        buff.append(UInt8(UInt32(r'\n')))
        for (_ in 0..new_depth) {
            buff.append(indent)
        }
        match (v) {
            case jo: JsonObject => jsonWriteObject(jo, buff, new_depth, false, indent)
            case ja: JsonArray => jsonWriteArray(ja, buff, new_depth, false, indent)
            case _ => jsonWriteWithoutFormat(v, buff)
        }
        buff.append(UInt8(UInt32(r',')))
    }
    buff.removetail()
    buff.append(UInt8(UInt32(r'\n')))
    for (_ in 0..depth) {
        buff.append(indent)
    }
    buff.append(UInt8(UInt32(r']')))
}

func asumecapacity(json: JsonValue): Int64 {
    match (json) {
        case jo: JsonObject =>
            var sum = 2
            for ((k,v) in jo.getFields()) {
                sum = sum + k.size + 4 // + "key": value,
                sum += asumecapacity(v)
            }
            return sum
        case ja: JsonArray =>
            var sum = 2
            for (v in ja.getItems()) {
                sum = sum + asumecapacity(v) + 1
            }
            return sum
        case js: JsonString =>
            return js.value.size + 2 // "value"
        case _: JsonBool =>
            return 5 // max of "false" and "true"
        case _: JsonInt =>
            return 22 // max len is 22
        case _: JsonFloat =>
            return 200 // not precision
        case _ =>
            return 4 // len of "null" is 4
    }
}

func replaceEscapeChar(input: Array<Byte>, inputlen: Int64, buffer: Array<Byte>): Int64 {
    var remainlen = inputlen
    let hex: Array<Byte> = "0123456789abcdef".toArray()
    var j: Int64 = 0
    for (i in 0..remainlen) {
        let b = input[i]
        if (b == 0X7f) {
            buffer[j..j+6] = [b'\\', b'u', b'0', b'0', b'7', b'f']
            j += 6 // 6 is the sizeof("\u007f")
            continue
        }
        if ((b >= 32) && (b != b'\"') && (b != b'\\') && (b != b'&')) { // ASCII code over 32 don't need escape
            buffer[j] = input[i]
            j++
            continue
        }
        match (b) {
            case b'\b' =>
                buffer[j..j+2] = [b'\\', b'b']
                j += 2 // add 2 bytes
            case b'\f' =>
                buffer[j..j+2] = [b'\\', b'f']
                j += 2 // add 2 bytes
            case b'\n' =>
                buffer[j..j+2] = [b'\\', b'n']
                j += 2 // add 2 bytes
            case b'\r' =>
                buffer[j..j+2] = [b'\\', b'r']
                j += 2 // add 2 bytes
            case b'\t' =>
                buffer[j..j+2] = [b'\\', b't']
                j += 2 // add 2 bytes
            case b'\\' =>
                buffer[j..j+2] = [b'\\', b'\\']
                j += 2 // add 2 bytes
            case b'\"' =>
                buffer[j..j+2] = [b'\\', b'\"']
                j += 2 // add 2 bytes
            case _ =>
                buffer[j..j+6] = [b'\\', b'u', b'0', b'0', hex[Int64(b) >> 4], hex[Int64(b) & 0xF]]
                j += 6 // add 6 bytes
        }
    }
    return j
}

@OverflowWrapping
func writeBufferAppendInt(arr: Array<Byte>, num: Int64): Int64 {
    if (num < 0) {
        let unum = UInt64(-num)
        arr[0] = b'-'
        return writeBufferAppendUint(arr[1..], unum) + 1
    } else {
        return writeBufferAppendUint(arr, UInt64(num))
    }
}

func writeBufferAppendUint(arr: Array<Byte>, num: UInt64): Int64 {
    var index = 0
    var numStartPos = 0
    var unum = num
    do {
        arr[index] = UInt8(unum % 10) + b'0' // mod 10
        unum /= 10                       // mod 10
        index++
    } while (unum > 0)

    var temp: UInt8 = 0
    var i = 0
    var iOpposite = 0
    let mid = (index - 1) / 2
    for (i in numStartPos..=mid) {
        iOpposite = (index + numStartPos - i) - 1
        temp = arr[i]
        arr[i] = arr[iOpposite]
        arr[iOpposite] = temp
    }
    return index
}

func stringEscapeCharNumGet(arr: Array<Byte>): Int64 {
    var escapeCharacters = 0
    for (byte in arr) {
        if (byte == 127) {
            escapeCharacters += 5
            continue
        }
        // ASCII code over 32 don't need escape
        if ((byte >= 32) && (byte != b'\"') && (byte != b'\\') &&
            (byte != b'&')) {
            continue
        }
        match(byte) {
            case b'\r' | b'\f' | b'\t' | b'\b' | b'\n' | b'\"' | b'\\' =>
                escapeCharacters++
            case _ =>
                escapeCharacters += 5
        }
    }
    return  escapeCharacters
}