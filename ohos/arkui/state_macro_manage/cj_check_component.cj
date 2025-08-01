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

func checkComponentSyntax(input: Tokens) {
    let decl = parseDecl(input)
    let classDecl = match (decl as ClassDecl) {
        case Some(v) => v
        case None => throw IllegalArgumentException("Only class is supported in @Component.")
    }
    checkInitFunc(classDecl)
    if (classDecl.superTypes.size > 0) {
        diag.error(input, "Component class should not inherit other class or interface.")
    }
}

/**
 * check if it is only one or zero component in build and @Builder function
 * example: return true
 * @Builder
 * func myText() {
 *     Text("hello")
 * }
 * example: return false
 * @Builder
 * func myText() {
 *     Text("hello")
 *     Text("hello")
 * }
 */
func isComponentSingle(funcBody: ArrayList<Node>): Bool {
    if (funcBody.size > 1) {
        return false
    }
    if (funcBody.size == 0) {
        return true
    }
    let comp = match (funcBody[0] as Expr) {
        case Some(v) => v
        case None => throw IllegalArgumentException("element from body is not an Expr")
    }
    match (getComponentType(comp)) {
        case CustomComponent | BuilderComponent => false
        case _ => true
    }
}

/**
 * check If there is only one root component in build function.
 */
func checkBuildFunc(funcBody: ArrayList<Node>, funcDecl: FuncDecl) {
    if (isComponentSingle(funcBody)) {
        return
    }
    diag.error(
        quote($funcDecl),
        "The build method can only have one root node and can only be a container component and cannot be a custom component."
    )
}

func checkMonadicContainer(input: Expr, name: String): Unit {
    let childComps = getChild(input)
    var index = 0
    for (childComp in childComps) {
        let childCompExpr = match (childComp as Expr) {
            case Some(v) => v
            case _ => continue
        }
        match (getComponentType(childCompExpr)) {
            case BuiltInComponent | CustomComponent =>
                if (!ifForEach(childCompExpr, name)) {
                    index += 1
                }
            case IfComponent =>
                let ifExpr = (childCompExpr as IfExpr).getOrThrow()
                checkMonadicIfBody((childCompExpr as IfExpr).getOrThrow().ifBlock.nodes, name)
                try {
                    checkMonadicIfBody((ifExpr.elseExpr as Block).getOrThrow().nodes, name)
                } catch (e: Exception) {
                    continue
                }
            case _ => 0
        }
    }
    if (index > 1) {
        diag.error(quote($input), "${quote($input)}, The component ${name} can only have a single child component.")
    }
}

func checkArgsAndChildLimit(input: Expr, name: String) {
    let childCount = getChild(input).size
    let tce = match (input as TrailingClosureExpr) {
        case Some(v) => v.expr
        case _ => throw IllegalArgumentException("input must be TrailingClosureExpr")
    }
    if (childCount > 0 && tce is CallExpr && (tce as CallExpr).getOrThrow().arguments.size > 0) {
        diag.error(quote($input),
            "${quote($input)}, The component ${name} cannot create with both parameters and child component.")
    }
}

func checkChildInComp(input: Expr, name: String): Unit {
    let compNames = getTrailingClosureExprValues(input)
    let contain = {
        left: HashSet<String> =>
        var isContain = false
        for (name in compNames) {
            if (left.contains(name)) {
                isContain = true
            }
        }
        return isContain
    }
    if (contain(COMPONENT_TYPE_FOREACH_LIST) && input is CallExpr) {
        checkChildInForEach(input, name)
        return
    }
    if (contain(HashSet<String>(["if"])) && input is IfExpr) {
        checkChildInIf(input, name)
        return
    }
    if (!CONTAINER_TO_SPECIFIC_PARENT_MAP.contains(name)) {
        return
    }
    let childNameArr = CONTAINER_TO_SPECIFIC_PARENT_MAP[name]

    let isBuilderAndContain = {
        left: HashSet<String> =>
        for (name in compNames) {
            if (!left.contains(name) && !stateManageHandler.builderSingleInfo.contains(name) &&
                MACRO_EXPAND_COMPONENTS.contains(name)) {
                return false
            }
        }
        return true
    }

    if (!isBuilderAndContain(HashSet<String>(childNameArr))) {
        diag.error(quote($input),
            "${quote($input)}, The component ${name} can only have the child component ${childNameArr.toString()}.")
    }
}

func checkParentInComp(input: Expr, name: String): Unit {
    let compName = getTrailingClosureExprValue(input)
    if (let Some(parentArr) <- CONTAINER_TO_SPECIFIC_CHILD_MAP.get(compName)) {
        if (!parentArr.contains(name)) {
            diag.fatal(quote($input), "The component ${compName} can not be inside of parent component ${name}.")
        }
        return
    }
    if (COMPONENT_TYPE_FOREACH_LIST.contains(compName) && input is CallExpr) {
        checkParentInForEach(input, name)
        return
    }
    if (compName == "if" && input is IfExpr) {
        checkParentInIf(input, name)
        return
    }
}

func checkChildInBody(input: ArrayList<Node>, name: String) {
    for (body in input) {
        match (body as Expr) {
            case Some(v) => checkChildInComp(v, name)
            case _ => continue
        }
    }
}

func checkParentInBody(input: ArrayList<Node>, name: String) {
    for (body in input) {
        match (body as Expr) {
            case Some(v) => checkParentInComp(v, name)
            case _ => continue
        }
    }
}

func checkChildInIf(input: Expr, name: String) {
    let ifExpr = match (input as IfExpr) {
        case Some(v) => v
        case _ => throw IllegalArgumentException("input should be IfExpr")
    }
    checkChildInBody(ifExpr.ifBlock.nodes, name)
    let elseExpr = try {
        ifExpr.elseExpr
    } catch (e: Exception) {
        return
    }

    if (elseExpr is IfExpr) {
        checkChildInComp((elseExpr as IfExpr).getOrThrow(), name)
    }

    if (elseExpr is Block) {
        var block = (elseExpr as Block).getOrThrow()
        checkChildInBody(block.nodes, name)
    }
}

func checkParentInIf(input: Expr, name: String) {
    let ifExpr = match (input as IfExpr) {
        case Some(v) => v
        case _ => throw IllegalArgumentException("input should be IfExpr")
    }
    checkParentInBody(ifExpr.ifBlock.nodes, name)
    let elseExpr = try {
        ifExpr.elseExpr
    } catch (e: Exception) {
        return
    }

    if (elseExpr is IfExpr) {
        checkParentInComp((elseExpr as IfExpr).getOrThrow(), name)
    }

    if (elseExpr is Block) {
        var block = (elseExpr as Block).getOrThrow()
        checkParentInBody(block.nodes, name)
    }
}

func checkChildInForEach(input: Expr, name: String) {
    let callExpr = match (input as CallExpr) {
        case Some(v) => v
        case _ => throw IllegalArgumentException("input should be CallExpr")
    }
    if (callExpr.arguments.size < 1) {
        return
    }
    let childExpr = callExpr.arguments[1].expr
    match (childExpr as LambdaExpr) {
        case Some(v) => checkChildInBody(v.nodes, name)
        case _ => return
    }
}

func checkParentInForEach(input: Expr, name: String) {
    let callExpr = match (input as CallExpr) {
        case Some(v) => v
        case _ => throw IllegalArgumentException("input should be CallExpr")
    }
    if (callExpr.arguments.size < 1) {
        return
    }
    let childExpr = callExpr.arguments[1].expr
    match (childExpr as LambdaExpr) {
        case Some(v) => checkParentInBody(v.nodes, name)
        case _ => return
    }
}

func checkChild(input: Expr, name: String) {
    let childComps = getChild(input)
    for (childComp in childComps) {
        match (childComp as Expr) {
            case Some(v) => checkChildInComp(v, name)
            case _ => continue
        }
    }
}

func checkParent(input: Expr, name: String) {
    let childComps = getChild(input)
    for (childComp in childComps) {
        match (childComp as Expr) {
            case Some(v) => checkParentInComp(v, name)
            case _ => continue
        }
    }
}

func checkMonadicIfBody(input: ArrayList<Node>, name: String): Unit {
    var index = 0
    for (childComp in input) {
        let childCompExpr = match (childComp as Expr) {
            case Some(v) => v
            case _ => throw IllegalArgumentException("if body element should be Expr")
        }
        match (getComponentType(childCompExpr)) {
            case BuiltInComponent | CustomComponent => index += 1
            case IfComponent =>
                let ifexpr = (childCompExpr as IfExpr).getOrThrow()
                checkMonadicIfBody(ifexpr.ifBlock.nodes, name)
                try {
                    checkMonadicIfBody((ifexpr.elseExpr as Block).getOrThrow().nodes, name)
                } catch (e: Exception) {
                    continue
                }
            case _ => 0
        }
    }
    if (index > 1) {
        diag.error(quote($input), "${quote($input)}, The component ${name} can only have a single child component.")
    }
}

func ifForEach(input: Expr, name: String): Bool {
    match (input as CallExpr) {
        case Some(callExpr) =>
            if (callExpr.callFunc is RefExpr) {
                let refExpr = (callExpr.callFunc as RefExpr).getOrThrow()
                let childName = refExpr.identifier.value
                if (COMPONENT_TYPE_FOREACH_LIST.contains(childName)) {
                    diag.error(quote($input), "${quote($input)}, The component ${name} can not contain ${childName}.")
                    return true
                }
            }
        case _ => return false
    }
    return false
}

func checkLazyForEachBody(input: Expr): Unit {
    let lamExpr = match (input as LambdaExpr) {
        case Some(v) => v
        case _ => throw IllegalArgumentException("input must be LambdaExpr")
    }
    let lamExprBody = lamExpr.nodes
    if (lamExprBody.size > 1) {
        diag.error(quote($input),
            "${quote($input)}, The lambda of LazyForeach component can only have a single component.")
    }
}

// Is allowed a variable to be transferred from parent component to child component
enum StateVariableTransferable {
    NotSupport | NotRecommended | Support
}

/*
 * whether a variable is allowed to be transferred from parent component to child component
 * left indicates variable type in parent component
 * right indicates variable type in child component
 *          | @State     | @Link      | @Prop      | common   | @Provide
 * -------- | ---------- | ---------- | ---------- | -------- | ---------
 * @State   | NotSupport | Support    | Support    | Support  | Support
 * @Link    | NotSupport | Support    | NotRecommended | Support  | Support
 * @Prop    | NotSupport | NotSupport | Support    | Support  | Support
 * common   | Support    | NotSupport | NotSupport | Support  | Support
 * @Provide | Support    | Support    | Support    | Support  | Support
 * @Consume | Support    | Support    | Support    | Support  | Support
 */
let varDeclTransfer = [
    [NotSupport, Support, Support, Support, Support, Support],
    [NotSupport, Support, NotRecommended, Support, Support, Support],
    [NotSupport, NotSupport, Support, Support, Support, Support],
    [Support, NotSupport, NotSupport, Support, Support, Support],
    [Support, Support, Support, Support, Support, Support],
    [Support, Support, Support, Support, Support, Support]
]

/**
 * @Observed class can not have constructors.
 */
class ObservedClassInitDeclVisitor <: Visitor {
    protected func visit(decl: Decl): Unit {
        if (decl is PrimaryCtorDecl) {
            diag.error(quote($decl), "primary constructor is not allowed in @Observed class.")
        }
        match (decl) {
            case funcDecl: FuncDecl where funcDecl.identifier.value == "init" => diag.error(quote($decl),
                "init constructor is not allowed in @Observed class.")
            case _ => breakTraverse()
        }
        breakTraverse()
    }
}

func checkInitFunc(classDecl: ClassDecl) {
    let visitor = ObservedClassInitDeclVisitor()
    classDecl.traverse(visitor)
}

class IfExprBodyVisitor <: Visitor {
    protected override func visit(expr: IfExpr): Unit {
        for (expr_ in expr.ifBlock.nodes) {
            if (expr_ is ForInExpr) {
                diagReport(DiagReportLevel.ERROR, expr_.toTokens(), "ForInExpr is not allowed in If Exception", "")
                breakTraverse()
            } else {
                expr_.traverse(this)
            }
        }

        try {
            let elseExpr_ = expr.elseExpr
            match (elseExpr_) {
                case ifExpr_: IfExpr => this.visit(ifExpr_)
                case elseBody: Block => for (expr_ in elseBody.nodes) {
                    if (expr_ is ForInExpr) {
                        diagReport(DiagReportLevel.ERROR, expr_.toTokens(), "ForInExpr is not allowed in If Exception",
                            "")
                        breakTraverse()
                    }
                }
                case _ => breakTraverse()
            }
        } catch (e: Exception) {
            breakTraverse()
        }
    }
}
