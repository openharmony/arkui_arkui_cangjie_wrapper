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

import std.ast.*
import std.collection.*
import std.unicode.*

public macro Component(input: Tokens): Tokens {
    checkComponentSyntax(input)
    let classDecl = (parseDecl(input) as ClassDecl).getOrThrow()
    let classModifier = classDecl.modifiers
    let classKeyWord = classDecl.keyword
    let classIdent = classDecl.identifier
    let classBody = classDecl.body

    checkChildMessage(classBody.decls, classDecl.identifier.value)
    let classBodyAfterExpand = handleClassBody(classBody.decls)
    let initFunc = generateInitFunc(classDecl)
    let aboutTbDeleteFunc = generateAboutToBeDelete(classDecl)
    let updateParamFunc = generateUpdateParam(classDecl)
    let rerenderFunc = handleRerender()
    let forceRerendFunc = handleForceRerender()
    let purgeVariableFunc = handlePurgeVariable(classDecl)

    // record state with component and state kind
    stateManageHandler.compWithStateInfo.add(classIdent.value, stateManageHandler.stateInformation.clone())

    // reset global var declaration in macro
    stateManageHandler.clearGlobalInComponent()

    // emit all error in component
    diag.emit()

    // generate class after expand.
    createClassDeclaration(
        modifiers: quote($classModifier),
        identifier: quote($classIdent),
        superTypes: quote($CUSTOM_VIEW),
        body: quote(
            $classBodyAfterExpand
            $initFunc
            $aboutTbDeleteFunc
            $updateParamFunc
            $rerenderFunc
            $purgeVariableFunc
            $forceRerendFunc
        )
    )
}

func isForEach(refExpr: RefExpr) {
    return COMPONENT_TYPE_FOREACH_LIST.contains(refExpr.identifier.value)
}

@When[pipeline == "NG"]
func generateForEachCreate(callExpr: CallExpr, thisView: Tokens) {
    let baseExpr = match (callExpr.callFunc) {
        case v: RefExpr => v
        case _ => throw IllegalArgumentException("callFunc must be RefExpr")
    }

    // the second parameter is lambdaExpr, and it contains child components
    let paraExpr = callExpr.arguments[1].expr
    let lamExpr = match (paraExpr) {
        case v: LambdaExpr => v
        case _ =>
            diag.fatal(quote($paraExpr), "there should be a lambda in ForEach component.")
            throw IllegalArgumentException("there should be a lambda in ForEach component.")
    }
    var dataParam = Tokens()
    for (param in lamExpr.funcParams) {
        dataParam = dataParam + quote($param)
    }
    let lamExprBody = lamExpr.nodes
    let lamDealBody = generateFuncBody(lamExprBody, thisView)

    var res = quote(
        $baseExpr {
        let forEachItemGenFunction = {
            $dataParam =>
            $lamDealBody
        }
        $thisView.forEachUpdateFunction\(elmtId,
    )
    for (idx in 0..callExpr.arguments.size) {
        let para = callExpr.arguments[idx]
        let paraExpr = para.expr

        // In ForEach component, the second parameter is lambdaExpr.
        if (idx == 1) {
            res = res + quote(itemGenFunc: forEachItemGenFunction)
            if (idx != callExpr.arguments.size - 1) {
                res = res + quote(, )
            }
        } else {
            res = res + quote($para)
        }
    }
    return res + quote(\)
        }
    )
}

func generateLazyForEachCreate(callExpr: CallExpr, thisView: Tokens) {
    let baseExpr = match (callExpr.callFunc) {
        case v: RefExpr => v
        case _ => throw IllegalArgumentException("callFunc must be RefExpr")
    }

    let compId = generateNewId()
    var res = quote($baseExpr().create\($compId, $thisView, )
    for (idx in 0..callExpr.arguments.size) {
        let para = callExpr.arguments[idx]
        let paraExpr = para.expr

        // In ForEach component, the second parameter is lambdaExpr, and it contains child components
        if (idx == 1) {
            let lamExpr = match (paraExpr) {
                case v: LambdaExpr => v
                case _ =>
                    // The second parameter should be lambdaExpr, compiler will check it.
                    continue
            }
            checkLazyForEachBody(paraExpr)
            let lamExprParams = lamExpr.funcParams
            let ident = getArgumentIdentifier(para)
            var myBuild = match (ident.value) {
                case "" => quote({)
                case _ => ident + quote(: {)
            }
            for (param in lamExprParams) {
                myBuild = myBuild + quote($param)
            }
            let lamExprBody = lamExpr.nodes
            myBuild = myBuild + quote( => ) + generateFuncBody(lamExprBody, thisView)
            res = res + myBuild + quote(})
            if (idx != callExpr.arguments.size - 1) {
                res = res + quote(, )
            }
        } else {
            res = res + quote($para)
        }
    }
    return res + quote(\)
    )
}

func generateCompCreate(callExpr: CallExpr) {
    let baseExpr = match (callExpr.callFunc) {
        case v: RefExpr => v
        case _ => throw IllegalArgumentException("baseFunc must be RefExpr")
    }

    var res = quote($baseExpr.create\()

    for (item in callExpr.arguments) {
        res = res + quote($item)
    }
    return res + quote(\)
    )
}

/**
 *  generate `component.create(...)`
 */
func generateBaseComp(input: Expr, thisView: Tokens): Tokens {
    match (input) {
        case callExpr: CallExpr =>
            if (!(callExpr.callFunc is RefExpr)) {
                return generateBaseComp(callExpr.callFunc, thisView)
            }
            let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
            if (refExpr.identifier.value == "ForEach") {
                return generateForEachCreate(callExpr, thisView)
            }
            if (refExpr.identifier.value == "LazyForEach") {
                return generateLazyForEachCreate(callExpr, thisView)
            }
            return generateCompCreate(callExpr)
        case v: TrailingClosureExpr =>
            // only inside TrailingClosureExpr may have other LambdaBody, can get the complete LambdaBody for judgment
            let expr = v.expr
            let componentName = getTrailingClosureExprValue(expr)
            if (COMPONENT_NUMBER_CONSTRAINT_LIST.contains(componentName)) {
                checkMonadicContainer(input, componentName)
            }
            if (isComponent(expr) && COMPONENT_NO_CHILD_CONSTRAINT_LIST.contains(componentName)) {
                // throws the same error in ETS.
                diag.error(quote($input), "${quote($input)}, The component ${componentName} cannot have any child.")
            }
            if (COMPONENT_TYPE_CONSTRAINT_LIST.contains(componentName)) {
                checkChild(input, componentName)
            }
            checkParent(input, componentName)
            return generateBaseComp(expr, thisView)
        case memAccess: MemberAccess =>
            let filed = memAccess.field
            // example: pkg.Text("")
            if (MACRO_EXPAND_COMPONENTS.contains(filed.value)) {
                return quote(
                    $filed.create()
                )
            }
            return generateBaseComp(memAccess.baseExpr, thisView)
        case v: RefExpr => return quote(
                $input.create()
            )
        case _ =>
            diag.fatal(quote($input), "The format of component is error.")
            return Tokens()
    }
    return Tokens()
}

extend<T> ArrayList<T> {
    /*
    @APILevel[
        16,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
     */
    public func append(elements: ArrayList<T>): Unit {
        for (element in elements) {
            add(element)
        }
    }
}

func getTrailingClosureExprValues(input: Expr): ArrayList<String> {
    var idents: ArrayList<String> = ArrayList<String>([])
    match (input) {
        case v: CallExpr => idents.add(all: getTrailingClosureExprValues(v.callFunc))
        case v: TrailingClosureExpr => idents.add(all: getTrailingClosureExprValues(v.expr))
        case v: MemberAccess =>
            idents.add(v.field.value)
            idents.add(all: getTrailingClosureExprValues(v.baseExpr))
        case v: RefExpr => idents.add(v.identifier.value)
        case v: IfExpr => idents.add("if")
        case _ => idents.add("")
    }
    return idents
}

func getTrailingClosureExprValue(input: Expr): String {
    match (input) {
        case v: CallExpr => return getTrailingClosureExprValue(v.callFunc)
        case v: TrailingClosureExpr => return getTrailingClosureExprValue(v.expr)
        case v: MemberAccess => return getTrailingClosureExprValue(v.baseExpr)
        case v: RefExpr => return v.identifier.value
        case v: IfExpr => return "if"
        case _ => return ""
    }
}

func isGesture(gestureFunc: String) {
    return gestureFunc == "gesture" || gestureFunc == "priorityGesture" || gestureFunc == "parallelGesture"
}

func getGestureName(expr: Expr): Token {
    match (expr) {
        case v: MemberAccess => return getGestureName(v.baseExpr)
        case v: CallExpr => return getGestureName(v.callFunc)
        case v: RefExpr => return v.identifier
        case _ =>
            diag.fatal(quote($expr), "illegal expr in gesture.")
            return Token()
    }
}

func isBaseGesture(name: String) {
    return name != "GestureGroup"
}

/**
 * generate gesture methods like onAction, onActionUpdate, etc
 * example:
 * LongPressGesture().onAction(..)
 * =>
 * LongPressGesture.create()
 * LongPressGesture.onAction(..)
 * LongPressGesture.pop()
 */
func generateGestureActions(name: Token, expr: Expr): Tokens {
    let callExpr = match (expr) {
        case v: CallExpr => v
        case _ =>
            diag.fatal(quote($expr), "Gesture should be callExpression.")
            throw IllegalArgumentException("Gesture should be callExpression.")
    }

    let baseExpr = callExpr.callFunc
    var args = Tokens()
    for (arg in callExpr.arguments) {
        args = args + quote($arg)
    }
    match (baseExpr) {
        case memAccess: MemberAccess =>
            let field = memAccess.field
            return quote(
                $name.$field($args)
            ) + generateGestureActions(name,
                memAccess.baseExpr)
        case _ => return Tokens()
    }
}

func generateGestureArgs(expr: Expr): ArrayList<Argument> {
    let callExpr = match (expr) {
        case v: CallExpr => v
        case _ =>
            diag.fatal(quote($expr), "Gesture should be callExpression.")
            throw IllegalArgumentException("Gesture should be callExpression.")
    }

    match (callExpr.callFunc) {
        case v: MemberAccess => return generateGestureArgs(v.baseExpr)
        case _ => return callExpr.arguments
    }
}

func generateBaseGesture(name: Token, expr: Expr): Tokens {
    var actions = generateGestureActions(name, expr)

    var args = Tokens()
    for (arg in generateGestureArgs(expr)) {
        args = args + quote($arg)
    }
    quote(
        $name.create($args)
        $actions
        $name.pop()
    )
}

/**
 * expand GestureGroup
 * example:
 * GestureGroup(GestureMode.Parallel,
 *     RotationGesture().onActionUpdate(..),
 *     LongPressGesture().onAction(..)
 * )
 * =>
 * GestureGroup.create(GestureMode.Parallel)
 * RotationGesture.create()
 * RotationGesture.onActionUpdate(..)
 * RotationGesture.pop()
 * LongPressGesture.create()
 * LongPressGesture.onAction(..)
 * LongPressGesture.pop()
 * GestureGroup.pop()
 */
func generateCombineGesture(name: Token, expr: Expr): Tokens {
    var actions = generateGestureActions(name, expr)
    let args = generateGestureArgs(expr)
    let gestureArg = args[0]
    var baseGestures = Tokens()
    for (i in 1..args.size) {
        let gestureExpr = args[i].expr
        baseGestures = baseGestures + generateBaseGesture(getGestureName(gestureExpr), gestureExpr)
    }
    quote(
        $name.create($gestureArg)
        $actions
        $baseGestures
        $name.pop()
    )
}

func generateGesture(expr: Expr): Tokens {
    let gestureName = getGestureName(expr)
    if (isBaseGesture(gestureName.value)) {
        // like TapGesture, LongPressGesture, PinchGesture, etc
        generateBaseGesture(gestureName, expr)
    } else {
        // like GestureGroup
        generateCombineGesture(gestureName, expr)
    }
}

func handleGesture(gestureFunc: String, callExpr: CallExpr) {
    var res = Tokens()
    let callExprArgs = callExpr.arguments

    var maskArg = Tokens()
    var gesture = Tokens()

    for (callExprArg in callExprArgs) {
        let name = getArgumentIdentifier(callExprArg)
        let expr = callExprArg.expr

        if (name.value == "mask") {
            maskArg = quote(, $name: $expr)
        } else if (name.value == "gesture") {
            /*
             * expand gesture
             * example:
             * TapGesture(..).onAction(..)
             * =>
             * TapGesture.create(..)
             * TapGesture.onAction(..)
             * TapGesture.pop()
             */
            gesture = generateGesture(expr)
        }
    }

    if (gestureFunc == "gesture") {
        res = res + quote(
            Gesture.create(priority: GesturePriority.Low $maskArg)
        )
    } else if (gestureFunc == "priorityGesture") {
        res = res + quote(
            Gesture.create(priority: GesturePriority.High $maskArg)
        )
    } else {
        res = res + quote(
            Gesture.create(priority: GesturePriority.Parallel $maskArg)
        )
    }

    res = res + gesture

    res = res + quote(
        Gesture.pop()
    )
    return res
}

func generateSingleAttribute(callExpr: CallExpr, baseCompRef: Tokens) {
    let baseFunc = callExpr.callFunc
    match (baseFunc) {
        case memAccess: MemberAccess =>
            let myProp = memAccess.field
            /*
             * handle gesture
             * example:
             * Row {...}.gesture(
             *     mask: GestureMask.Normal,
             *     gesture: TapGesture().onAction({evt =>
             *         ...
             *     })
             * )
             */
            if (isGesture(myProp.value)) {
                return generateComponentAttribute(memAccess.baseExpr, baseCompRef) + handleGesture(myProp.value,
                    callExpr)
            }

            /*
             * If the filed is a built-in component, it means that
             * all the attributes of the component have been generated, return without Tokens.
             * example:
             * pkg.Text("hello")
             */
            if (MACRO_EXPAND_COMPONENTS.contains(myProp.value)) {
                return Tokens()
            }
            var res = quote($baseCompRef.$myProp\()
            for (idx in 0..callExpr.arguments.size) {
                let para = callExpr.arguments[idx]
                res = res + quote($para)
            }
            res = res + quote(\))
            return generateComponentAttribute(memAccess.baseExpr, baseCompRef) + res
        case _ => return Tokens()
    }
}

/**
 * generate component attribute
 * like: Text("").fontSize(20)
 */
func generateComponentAttribute(input: Expr, baseCompRef: Tokens): Tokens {
    match (input) {
        case callExpr: CallExpr => return generateSingleAttribute(callExpr, baseCompRef) + NEWLINE
        case trailingClosureExpr: TrailingClosureExpr =>
            // example: Column {...}.onClick {evt => ...}
            let expr = trailingClosureExpr.expr
            let lambdaExpr = trailingClosureExpr.lambdaExpr
            if (isComponent(expr)) {
                return Tokens()
            }
            if (expr is MemberAccess) {
                let memAccess = (expr as MemberAccess).getOrThrow()
                let myProp = memAccess.field
                // example: pkg.Text("")
                if (MACRO_EXPAND_COMPONENTS.contains(myProp.value)) {
                    return Tokens()
                }
                let res = quote($baseCompRef.$myProp $lambdaExpr)
                return generateComponentAttribute(memAccess.baseExpr, baseCompRef) + res + NEWLINE
            }
            if (expr is CallExpr) {
                let callExpr = (expr as CallExpr).getOrThrow()
                return generateSingleAttribute(callExpr, baseCompRef) + quote($lambdaExpr) + NEWLINE
            }
        case _ =>
            diag.fatal(quote($input),
                "Illegal tokens ${quote($input)}, attributes of components should be a call expression.")
            return Tokens()
    }
    return Tokens()
}

func isComponent(expr: Expr) {
    match (expr) {
        case refExpr: RefExpr => return MACRO_EXPAND_COMPONENTS.contains(refExpr.identifier.value)
        case callExpr: CallExpr =>
            let baseFunc = callExpr.callFunc
            match (baseFunc) {
                case v: RefExpr => return MACRO_EXPAND_COMPONENTS.contains(v.identifier.value)
                case v: MemberAccess => return MACRO_EXPAND_COMPONENTS.contains(v.field.value)
                case _ => return false
            }
        case memberAccess: MemberAccess => return MACRO_EXPAND_COMPONENTS.contains(memberAccess.field.value)
        case _ => return false
    }
    return false
}

/**
 * get children of component
 */
func getChild(input: Expr): ArrayList<Node> {
    match (input) {
        case callExpr: CallExpr =>
            //example: Column {...}.onClick({evt => ...})
            return getChild(callExpr.callFunc)
        case trailingClosureExpr: TrailingClosureExpr =>
            //example: Column { ... }
            let expr = trailingClosureExpr.expr
            let lambdaExpr = trailingClosureExpr.lambdaExpr
            if (isComponent(expr)) {
                return lambdaExpr.nodes
            }
            //example: Column {...}.onClick {evt => ...}
            return getChild(expr)
        case memAccess: MemberAccess =>
            //example: Column {...}.onClick
            return getChild(memAccess.baseExpr)
        case _ => return ArrayList<Node>([])
    }
}

/**
 * get children of component
 */
func changeTrailingExpr(input: Expr, tokens: Tokens): Unit {
    match (input) {
        case callExpr: CallExpr => return changeTrailingExpr(callExpr.callFunc, tokens)
        case trailingClosureExpr: TrailingClosureExpr =>
            let expr = trailingClosureExpr.expr
            let lambdaExpr = trailingClosureExpr.lambdaExpr
            if (isComponent(expr)) {
                let arrNode = ArrayList<Node>()
                var (e, p) = parseExprFragment(tokens, startFrom: 0)
                arrNode.add((e as Node).getOrThrow())
                while (p != tokens.size) {
                    (e, p) = parseExprFragment(tokens, startFrom: p)
                    arrNode.add((e as Node).getOrThrow())
                }
                trailingClosureExpr.lambdaExpr.nodes = arrNode
                return
            }
            //example: Column {...}.onClick {evt => ...}
            return changeTrailingExpr(expr, tokens)
        case memAccess: MemberAccess =>
            //example: Column {...}.onClick
            return changeTrailingExpr(memAccess.baseExpr, tokens)
        case _ => return
    }
}

func getCompName(input: Expr): Tokens {
    match (input) {
        case callExpr: CallExpr =>
            if (!(callExpr.callFunc is RefExpr)) {
                return getCompName(callExpr.callFunc)
            }
            let ret = callExpr.callFunc
            return quote($ret)
        case trailingClosureExpr: TrailingClosureExpr =>
            // only inside TrailingClosureExpr may have other LambdaBody, can get the complete LambdaBody for judgment
            let expr = trailingClosureExpr.expr
            let componentName = getTrailingClosureExprValue(expr)
            return getCompName(expr)
        case memAccess: MemberAccess =>
            let field = memAccess.field
            // example: pkg.Text("")
            if (MACRO_EXPAND_COMPONENTS.contains(field.value)) {
                return quote($field)
            }
            return getCompName(memAccess.baseExpr)
        case v: RefExpr => return quote($input)
        case _ =>
            diag.fatal(quote($input), "The format of component is error.")
            return Tokens()
    }
}

// Check whether the component parameter contains subcomponents.
func hasChildInParams(input: Expr): Bool {
    match (input) {
        case callExpr: CallExpr =>
            match (callExpr.callFunc) {
                case memberAccess: MemberAccess => return hasChildInParams(memberAccess.baseExpr)
                case _ => ()
            }

            let arguments = callExpr.arguments
            if (arguments.size > 0) {
                let lastArgument = arguments[arguments.size - 1]
                let lastExpr = lastArgument.expr
                match (lastExpr) {
                    case lambda: LambdaExpr => return true
                    case _ => return false
                }
            } else {
                return false
            }

        case _ => return false
    }
}

/**
 * Parse subcomponent func when a subcomponent is used as a component parameter instead of trailing closures.
 * example
 * Button({ => Text("button") })
 * =>
 * Button({ => this.observeComponentCreation({ elmtId, isInitialRender => Text("button") }) })
 */
func parseChildInParams(input: Expr): Unit {
    let callExpr = (input as CallExpr).getOrThrow()

    match (callExpr.callFunc) {
        case memberAccess: MemberAccess => return parseChildInParams(memberAccess.baseExpr)
        case _ => ()
    }

    let arguments = callExpr.arguments
    let lastArgument = arguments[arguments.size - 1]
    let lastExpr = lastArgument.expr
    let lambda = (lastExpr as LambdaExpr).getOrThrow()
    let nodes = lambda.nodes
    checkChildInBody(nodes, getTrailingClosureExprValue(input))
    let childComps = generateFuncBody(nodes, quote(this))
    let baseExpr = callExpr.callFunc

    let funcParams = lambda.funcParams
    lastArgument.expr = LambdaExpr(quote({ $funcParams => $childComps }))
}

/**
 * expand built-in component
 * example
 * Text("hello").fontSize(100)
 * =>
 * this.observeComponentCreation({elmtId, isInitialRender =>
 *     Text("hello").fontSize(100)
 * })
 */
@When[pipeline == "NG"]
func handleRender(input: Expr, thisView: Tokens): Tokens {
    // Generate LazyForEach().create(..)
    if (input is CallExpr) {
        let callExpr = (input as CallExpr).getOrThrow()
        if (callExpr.callFunc is RefExpr) {
            let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
            if (refExpr.identifier.value == "LazyForEach") {
                let baseComp: Tokens = generateLazyForEachCreate(callExpr, thisView)
                return thisView + quote(.observeComponentCreation({elmtId, isInitialRender =>
                        if (!isInitialRender) {
                            return FakeComponent()
                        }
                        $baseComp
                    })
                )
            } else if (refExpr.identifier.value == "ForEach") {
                let baseComp: Tokens = generateForEachCreate(callExpr, thisView)
                return thisView + quote(.observeComponentCreation({elmtId, isInitialRender =>
                        $baseComp
                    })
                )
            }
        }
    }

    // hasChild
    let _ = generateBaseComp(input, thisView)
    let childs = getChild(input)
    if (childs.size != 0) {
        // hasChild
        let childComps = generateFuncBody(childs, thisView)
        changeTrailingExpr(input, childComps)
        return thisView + quote(.observeComponentCreation({elmtId, isInitialRender =>
                $input
            })
        )
    } else {
        // noChild

        let compName = getTrailingClosureExprValue(input)
        if (stateManageHandler.isContainerComponent(compName) && hasChildInParams(input)) {
            parseChildInParams(input)
            return thisView + quote(.observeComponentCreation({elmtId, isInitialRender =>
                    $input
                })
            )
        }
        return thisView + quote(.observeComponentCreation({elmtId, isInitialRender =>
                $input
            })
        )
    }
}

/**
 * Son(arg: arg)
 * if arg is state variable, it will expand =>
 * Son(arg: stateVarDecl_arg_)
 * otherwise =>
 * Son(arg: ObservedProperty("", arg))
 */
func generateArgs(identifier: Token, argValue: Expr, argName: Token) {
    let formatArg: Tokens = if (argName.value == "") {
        Tokens()
    } else {
        quote($argName:)
    }
    match (stateManageHandler.stateInformation.get(mangle(identifier.value))) {
        case Some(v) =>
            let variableKind = v[0]
            match (variableKind) {
                case CommonTy => return quote(, $formatArg $OBSERVED_PROPERTY("", $argValue))
                case _ =>
                    let stateIdentifier = Token(TokenKind.IDENTIFIER, mangle(identifier.value))
                    return quote(, $formatArg $stateIdentifier)
            }
        case _ => return quote(, $formatArg $OBSERVED_PROPERTY("", $argValue))
    }
}

func generateCustomComponentArgs(argValue: Expr, argName: Token): Tokens {
    let formatArg: Tokens = if (argName.value == "") {
        Tokens()
    } else {
        quote($argName:)
    }
    match (argValue) {
        case refExpr: RefExpr =>
            let identifier = refExpr.identifier
            return generateArgs(identifier, argValue, argName)
        case memberAccess: MemberAccess =>
            /*
             * In the case like Son(arg: this.arg), expand as memberAccess and handle the field.
             */
            let identifier = memberAccess.field
            let baseExpr = memberAccess.baseExpr
            match (baseExpr) {
                /*
                 * case: Son(arg: thi.arg), if arg is stateVar. it will expend =>
                 * Son(arg: stateVarDecl_arg)
                 * otherwise =>
                 * Son(arg: $OBSERVED_PROPERTY("", arg))
                 */
                case v: RefExpr where v.identifier.value == "this" =>
                    if (stateManageHandler.stateInformation.contains(mangle(identifier.value))) {
                        return generateArgs(identifier, argValue, argName)
                    } else {
                        return quote(, $formatArg $OBSERVED_PROPERTY("", $argValue))
                    }
                case _ => return generateArgs(identifier, argValue, argName)
            }
        case _ => return quote(, $formatArg $OBSERVED_PROPERTY("", $argValue))
    }
}

/**
 * expand component defined by developers
 * example
 * SubComponent(cnt: 0)
 * =>
 * ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
 * CustomView.create(SubComponent(this, cnt: 0))
 * ViewStackProcessor.StopGetAccessRecording()
 */
@When[pipeline == "NG"]
func handleCustomRender(input: Expr, thisView: Tokens): Tokens {
    let callExpr = handleCallArgs(input, thisView)
    let expr = (input as CallExpr).getOrThrow()
    let funcName = expr.callFunc.toTokens().toString()
    handleReuseRender(funcName, input, callExpr, thisView)
}

enum ComponentType {
    BuiltInComponent | CustomComponent | IfComponent | BuilderComponent | MethodCall
}

func getComponentType(input: Expr): ComponentType {
    match (input) {
        case callExpr: CallExpr => return getComponentType(callExpr.callFunc)
        case trailingClosureExpr: TrailingClosureExpr => return getComponentType(trailingClosureExpr.expr)
        case memAccess: MemberAccess =>
            let field = memAccess.field.value
            if (MACRO_EXPAND_COMPONENTS.contains(field)) {
                return ComponentType.BuiltInComponent
            }
            if (stateManageHandler.isInMacroComponents(field)) {
                return ComponentType.CustomComponent
            }
            if (stateManageHandler.isInBuilderComponents(field) || stateManageHandler.isInBuilderParams(field)) {
                return ComponentType.BuilderComponent
            }
            return getComponentType(memAccess.baseExpr)
        case refExpr: RefExpr =>
            let ref = refExpr.identifier.value
            if (MACRO_EXPAND_COMPONENTS.contains(ref)) {
                return ComponentType.BuiltInComponent
            }
            if (stateManageHandler.isInMacroComponents(ref)) {
                return ComponentType.CustomComponent
            }
            if (stateManageHandler.isInBuilderComponents(ref) || stateManageHandler.isInBuilderParams(ref)) {
                return ComponentType.BuilderComponent
            }
            return ComponentType.MethodCall
        case v: IfExpr => return ComponentType.IfComponent
        case _ => return ComponentType.CustomComponent
    }
}

func printUISyntaxError(value: Node) {
    diag.error(quote($value),
        "Only UI component syntax can be written in build method. " + "${quote($value)} does not meet UI component.")
}

func generateFuncBody(funcBody: ArrayList<Node>, thisView: Tokens): Tokens {
    var renderFunc = Tokens()
    for (each in funcBody) {
        match (each) {
            case value: Expr => match (getComponentType(value)) {
                case BuiltInComponent => renderFunc = renderFunc
                    .append(Token(TokenKind.NL))
                    .append(handleRender(value, thisView))
                case CustomComponent => renderFunc = renderFunc
                    .append(Token(TokenKind.NL))
                    .append(handleCustomRender(value, thisView))
                case IfComponent => renderFunc = renderFunc
                    .append(Token(TokenKind.NL))
                    .append(handleIfRender(value, thisView))
                case BuilderComponent => renderFunc = renderFunc
                    .append(Token(TokenKind.NL))
                    .append(handleBuilderRender(value, thisView))
                case MethodCall => renderFunc = renderFunc
                    .append(Token(TokenKind.NL))
                    .append(handleMethodCallRender(value, thisView))
            }
            case _ => printUISyntaxError(each)
        }
    }
    return renderFunc
}

/**
 * expand if component
 * example
 * if (condition) {
 *     Text("hello")
 * } else {
 *     Text("world")
 * }
 * =>
 * observeComponentCreation({elmtId, isInitialRender =>
 *     ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
 *     If.create()
 *     if (condition) {
 *         this.ifElseBranchUpdateFunction(0, { =>
 *             this.observeComponentCreation({elmtId, isInitialRender =>
 *                 ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
 *                 Text.create("hello")
 *                 if (!isInitialRender) {
 *                     Text.pop()
 *                 }
 *                 ViewStackProcessor.StopGetAccessRecording()
 *             })
 *             Text.pop()
 *         })
 *     } else {
 *         this.ifElseBranchUpdateFunction(1, { =>
 *             this.observeComponentCreation({ elmtId, isInitialRender =>
 *                 ViewStackProcessor.StartGetAccessRecordingFor(elmtId)
 *                 Text.create("world")
 *                 if (!isInitialRender) {
 *                     Text.pop()
 *                 }
 *                 ViewStackProcessor.StopGetAccessRecording()
 *             })
 *             Text.pop()
 *         })
 *     }
 *     if (!isInitialRender) {
 *         If.pop()
 *     }
 *     ViewStackProcessor.StopGetAccessRecording()
 * }
 * If.pop()
 */
@When[pipeline == "NG"]
func handleIfRender(input: Expr, thisView: Tokens): Tokens {
    // each if branch id begins with 0
    let ifExpr = (input as IfExpr).getOrThrow()
    let visitor = IfExprBodyVisitor()
    ifExpr.traverse(visitor)
    thisView + quote(.observeComponentCreation\({elmtId, isInitialRender =>
            If {
    ) + generateIfBranch(
        ifExpr, 0, thisView) + quote(
            }
        }\)

    )
}

func generateIfBranch(input: IfExpr, id: Int32, thisView: Tokens): Tokens {
    var branchId = id
    let condition = input.condition
    let ifBody = input.ifBlock.nodes
    let ifBodyExpand = generateIfBody(ifBody, branchId, thisView)
    branchId++

    var ret = quote(
        if ($condition) {
            $ifBodyExpand
        }
    )

    ret = ret + quote( else )
    try {
        match (input.elseExpr) {
            case ifExpr: IfExpr =>
                ret = ret + generateIfBranch(ifExpr, branchId, thisView)
                branchId++
            case elseBody: Block =>
                // else branch
                ret = ret + quote(
                    {
                ) + generateIfBody(elseBody.nodes, branchId,
                    thisView) + quote(
                    }
                )
                branchId++
            case _ => throw IllegalArgumentException("unreachable")
        }
    } catch (e: Exception) {
        // no else branch
        ret = ret + quote(
            {
                If.branchId($branchId)
            }
        )
        return ret
    }
    return ret
}

@When[pipeline == "NG"]
func generateIfBody(ifBody: ArrayList<Node>, id: Int32, thisView: Tokens): Tokens {
    let body = generateFuncBody(ifBody, thisView)
    return thisView + quote(.ifElseBranchUpdateFunction($id, { =>
            $body
        })
    )
}

// generate updateWithValueParams function
func generateUpdateParam(classDecl: ClassDecl) {
    var updateAssigment = Tokens()
    let paramList = ArrayList<Tokens>()
    let varDecls = getVarDecls(classDecl)
    for (varDecl in varDecls) {
        if (varDecl.keyword.value == "let") {
            continue
        }
        var varDeclKind = VariableKind.CommonTy
        let rawVarDecl = match (stateManageHandler.stateInformation.get(varDecl.identifier.value)) {
            // v is VariableKind*VarDecl, v[1] get the variable declaration before expanded by macro
            case Some(v) =>
                updateAssigment = updateAssigment + generateUpdateAssignment(v)
                v[1]
            case _ => varDecl
        }
        let identifier = rawVarDecl.identifier
        let valType = rawVarDecl.getTypeByInitializer()
        paramList.add(quote($identifier!: Option<$valType> = Option<$valType>.None))
    }
    let updateParams = joinListToTokens(paramList, quote(, ))
    return quote(
        func updateWithValueParams($updateParams): Unit {
            $updateAssigment
        }
    )
}

func generateUpdateAssignment(value: (VariableKind, VarDecl)) {
    let variableKind = value[0]
    let varDecl = value[1]
    let identifier = varDecl.identifier
    match (variableKind) {
        case LinkTy => Tokens()
        case _ => quote(
                match ($identifier) {
                    case Some(v) => this.$identifier = v
                    case _ => ()
                }
            )
    }
}

func generateWatchDecls(): Tokens {
    var watchDecls = Tokens()
    for ((declType, variable, funcInfo) in stateManageHandler.watchDeclare) {
        watchDecls = watchDecls + quote(
            this.declareWatch<$declType>($variable, $funcInfo)
        )
    }
    return watchDecls
}

func generateCustomDialogBindDecls(): Tokens {
    var customDialogBind = Tokens()
    for ((varName, callExpr) in stateManageHandler.customDialogInfo) {
        let baseExpr = callExpr.callFunc
        let args = callExpr.arguments
        var componentArg = Tokens()
        for (arg in args) {
            let argValue = arg.expr
            let argName = getArgumentIdentifier(arg)
            componentArg = componentArg + generateCustomComponentArgs(argValue, argName)
        }
        customDialogBind = customDialogBind + quote(
            this.$varName.bindView(this)
            this.$varName.setBuilder({ =>
                let cjDialog = $baseExpr(this $componentArg)
                $CUSTOM_VIEW.create(cjDialog)
                cjDialog.setController(this.$varName)
            })
        )
    }
    return customDialogBind
}

@When[pipeline == "NG"]
func generateInitFunc(classDecl: ClassDecl) {
    // variable declarations: variable declarations in @Component Class
    let varDecls = getVarDecls(classDecl)

    var initParams = Tokens()
    var initBodyAssign = Tokens()
    var initBodySubscribe = Tokens()

    // generate init function
    for (item in varDecls) {
        let initValue = generateVarDecl(item)
        if (initValue[0].size != 0) {
            initParams = initParams + quote(, ) + initValue[0]
        }
        initBodyAssign = initBodyAssign + initValue[1]
        initBodySubscribe = initBodySubscribe + initValue[2]
    }

    let watchDecls = generateWatchDecls()

    let customDialogBindDecls = generateCustomDialogBindDecls()

    let localStorageVarInit = Tokens()
    for (item in localStorageStateInfo) {
        let state = item[0]
        let initDecl = item[1]
        localStorageVarInit.append(quote(this.$state = $initDecl))
        localStorageVarInit.append(Token(TokenKind.NL))
    }
    localStorageStateInfo = ArrayList([])

    // add init function
    return quote(
        public init(parent: Option<$CUSTOM_VIEW> $initParams, localStorage!: Option < LocalStorage >= None) {
            super(parent, localStorage)
            $localStorageVarInit
            $initBodyAssign
            $initBodySubscribe
            SubscriberManager.getInstance().add(this)
            $customDialogBindDecls
            $watchDecls
            registerSelf()
            parent?.addChildById(id(), this)
        }
    )
}

func generateBuildFunc(funcDecl: FuncDecl) {
    var funcBody = funcDecl.block.nodes
    checkBuildFunc(funcBody, funcDecl)
    funcBody = bindBuilderCtx(funcBody, quote(this))

    createMethodDeclaration(
        modifiers: quote(public),
        identifier: quote(build),
        body: generateFuncBody(funcBody, quote(this)) + quote(
            ()
        )
    )
}

func handleFuncInClassBody(funcDecl: FuncDecl) {
    // handler build function, rename to build, and expand components
    if (funcDecl.identifier.value == "build") {
        return generateBuildFunc(funcDecl)
    }
    // other functions are inserted without change.
    return quote(
        $funcDecl
    )
}

func handleVarDeclInClassBody(varDecl: VarDecl) {
    let commonVarKeyword = varDecl.keyword

    // remove initializer for mutable 'varDecl', which will be initialized in 'init function'
    if (commonVarKeyword.value == "var") {
        let commonVarDeclIdent = varDecl.identifier
        let commonVarDeclType = varDecl.declType
        return quote(
            $commonVarKeyword $commonVarDeclIdent: $commonVarDeclType
        )
    }
    return quote(
        $varDecl
    )
}

func checkBinderValue(classBody: ArrayList<Decl>, binderValue: String): Bool {
    var ret = false
    var stateValue = "stateVarDecl_${binderValue}_"
    for (item in classBody) {
        match (item) {
            case varDecl: VarDecl =>
                var value = varDecl.identifier.value
                if (value == binderValue || value == stateValue) {
                    return true
                }
            case _ => ()
        }
    }
    return ret
}

func checkChildMessage(classBody: ArrayList<Decl>, className: String) {
    let messages = getChildMessages("Binder")
    for (m in messages) {
        if (!m.hasItem("IDENTIFIER")) {
            continue
        }
        let value1 = m.getString("IDENTIFIER")
        if (!checkBinderValue(classBody, value1)) {
            diag.error(quote($value1), "${value1} is not a member of class ${className}")
        }
    }
}

func handleClassBody(classBody: ArrayList<Decl>) {
    var ret = Tokens()
    for (item in classBody) {
        // handle function
        match (item) {
            case funcDecl: FuncDecl => ret = ret + handleFuncInClassBody(funcDecl)
            case varDecl: VarDecl =>
                // CustomDialogController Type VarDecl need to generate
                if (isNeeadGenerateCustomDialog(varDecl)) {
                    generateCustomDialogControllerCreate(varDecl)
                }
                ret = ret + quote(
                    $varDecl
                )
            case _ =>
                // other declarations are inserted without change.
                ret = ret + quote(
                    $item
                )
        }
    }
    return ret
}

func generateAboutToBeDelete(classDecl: ClassDecl) {
    let varDecls = getVarDecls(classDecl)
    var tokens = Tokens()
    for (item in varDecls) {
        let identifier = item.identifier
        match (stateManageHandler.stateInformation.get(identifier.value)) {
            case None => quote()
            case Some(v) => tokens += quote(
                this.$identifier.unsubscribeEx(this)
            )
        }
    }

    for ((varName, callExpr) in stateManageHandler.customDialogInfo) {
        tokens += quote(
            this.$varName.releaseSelf()
        )
    }

    quote(
        public override func aboutToBeDeleted() {
            $tokens
            SubscriberManager.getInstance().delete(this)
            this.aboutToBeDeletedInternal()
        }
    )
}

@When[pipeline == "NG"]
func handleRerender() {
    quote(
        public func rerender() {
            this.updateDirtyElements()
        }
    )
}

func handleForceRerender() {
    quote(
        public func forceRerender(deep!: Bool = false) {
            this.forceCompleteRerender(deep)
        }
    )
}

@When[pipeline == "NG"]
func handlePurgeVariable(classDecl: ClassDecl) {
    let varDecls = getVarDecls(classDecl)
    var purgeVariable = Tokens()
    for (item in varDecls) {
        let identifier = item.identifier
        match (stateManageHandler.stateInformation.get(identifier.value)) {
            case None => ()
            case Some(v) => purgeVariable = purgeVariable + quote(
                this.$identifier.purgeDependencyOnElmtId(rmElmtId)
            )
        }
    }
    quote(
        public func purgeVariableDependenciesOnElmtId(rmElmtId: Int64) {
            $purgeVariable
        }
    )
}

func generateCustomDialogControllerCreate(varDecl: VarDecl): Unit {
    var hasInitializer = false
    try {
        varDecl.expr
        hasInitializer = true
    } catch (e: Exception) {
        hasInitializer = false
    }
    if (!hasInitializer) {
        return
    }

    let expr = varDecl.expr
    match (expr as CallExpr) {
        case None => diag.fatal(quote($varDecl),
            "${quote($varDecl)}, CustomDialogController can only create by CustomDialogController Constructer")
        case _ => ()
    }

    let callExpr = (expr as CallExpr).getOrThrow()
    let callfunc = callExpr.callFunc
    if (!isCustomdialogController(callfunc.toTokens().toString().trim())) {
        diag.fatal(quote($varDecl),
            "${quote($varDecl)}, CustomDialogController can only create by CustomDialogController Constructer")
    }
    let params = callExpr.arguments
    if (params.size != 1) {
        return
    }

    let options = params[0].expr
    match (options as CallExpr) {
        case None => diag.fatal(quote($varDecl),
            "${quote($varDecl)}, CustomDialogController can only create with CustomDialogControllerOptions")
        case _ => ()
    }
    let optionsCallExpr = (options as CallExpr).getOrThrow()
    let optionsParams = optionsCallExpr.arguments
    let optionsBuilder = optionsParams[0].expr

    match (optionsBuilder as CallExpr) {
        case None => diag.fatal(quote($varDecl),
            "${quote($varDecl)}, CustomDialogControllerOptions must contain a CustomDialog Builder")
        case _ => ()
    }

    stateManageHandler.customDialogInfo.add((varDecl.identifier, (optionsBuilder as CallExpr).getOrThrow()))
    optionsParams.remove(at: 0)
}

func handleReuseRender(funcName: String, input: Expr, callExpr: Tokens, thisView: Tokens): Tokens {
    let expr = (input as CallExpr).getOrThrow()
    let args = expr.arguments
    var paramTokens = Tokens()
    paramTokens += quote([)
    for (i in 0..args.size) {
        let key = getArgumentIdentifier(args[i]).value
        let value = args[i].expr.toTokens()
        paramTokens += quote(($key, $value))
        if (i != args.size - 1) {
            paramTokens += quote(, )
        }
    }
    paramTokens += quote(])
    return quote(
        match ($callExpr) {
            case cv: $CUSTOM_VIEW =>
                if (cv.isReusable) {
                    let rp: ReuseParams = ReuseParams($paramTokens)
                    $thisView.observeComponentCreation({elmtId, isInitialRender => __Recycle__ {
                        $thisView.observeRecycleComponentCreation($funcName, {elmtId, isInitialRender, recycleNode =>
                            CustomView.createRecycle(recycleNode ?? cv, recycleNode.isSome(), $funcName, { =>
                                if (let Some(rn) <- recycleNode) {
                                    rn.aboutToReuseInternal(rp)
                                }
                            })
                            FakeComponent()
                        })
                    }})
                } else {
                    ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent())
                    $CUSTOM_VIEW.create(cv)
                    ViewStackProcessor.StopGetAccessRecording()
                }
            case vb: $VIEW_BUILDER =>
                vb.build()
            case _ => LegalCallCheck.check($callExpr)
        }
    )
}

@When[pipeline == "NG"]
func handleMethodCallRender(input: Expr, thisView: Tokens): Tokens {
    let callExpr = handleCallArgs(input, thisView)
    let expr = (input as CallExpr).getOrThrow()
    let funcName = expr.callFunc.toTokens().toString()
    handleReuseRender(funcName, input, callExpr, thisView)
}

@When[pipeline == "NG"]
func handleBuilderRender(input: Expr, thisView: Tokens): Tokens {
    let callExpr = handleCallArgs(input, thisView)
    return quote($callExpr.build())
}

@When[pipeline == "NG"]
func handleCallArgs(input: Expr, thisView: Tokens): Tokens {
    let callExpr = (input as CallExpr).getOrThrow()
    let baseExpr = callExpr.callFunc
    let args = callExpr.arguments
    var componentArg = Tokens()
    for (arg in args) {
        let argValue = arg.expr
        let argName = getArgumentIdentifier(arg)
        componentArg = componentArg + generateCustomComponentArgs(argValue, argName)
    }
    return quote($baseExpr($thisView $componentArg))
}
