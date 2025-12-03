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

import std.ast.{Argument, Expr, CallExpr, TrailingClosureExpr, MemberAccess, RefExpr, Token, TokenKind}
import std.collection.ArrayList

var currentAnimationParmas: ArrayList<Argument> = ArrayList<Argument>([])

func isContainAnimation(input: Expr): Bool {
    match (input) {
        case v: CallExpr => return isContainAnimation(v.callFunc)
        case v: TrailingClosureExpr => return isContainAnimation(v.expr)
        case v: MemberAccess =>
            if (isAnimation(v.field.value)) {
                return true
            }
            return isContainAnimation(v.baseExpr)
        case v: RefExpr => return isAnimation(v.identifier.value)
        case _ => return false
    }
}

func parseAnimation(input: Expr, hasPriorityAnimation: Bool, depth: Int64): Unit {
    match (input) {
        case v: CallExpr =>
            if (isAnimationCallExpr(v)) {
                currentAnimationParmas = ArrayList<Argument>(v.arguments)
                v.arguments = ArrayList<Argument>([])
                return parseAnimation(v.callFunc, true, depth)
            }
            if (depth == 1) {
                parseAnimationBeforeCallFunc(v.callFunc)
                return
            }
            if (depth == 2) {
                parseAnimationBeforeTrailingClosure(v.callFunc)
                return
            }
            return parseAnimation(v.callFunc, true, depth)
        case v: TrailingClosureExpr =>
            if (depth == 2) {
                parseAnimationBeforeTrailingClosure(v.expr)
                return
            }
            return parseAnimation(v.expr, hasPriorityAnimation, depth - 1)
        case v: MemberAccess => return parseAnimation(v.baseExpr, hasPriorityAnimation, depth - 1)
        case _ => return
    }
}

func getMemberAccessDepth(input: Expr, depth: Int64): Int64 {
    match (input) {
        case v: CallExpr => return getMemberAccessDepth(v.callFunc, depth)
        case v: TrailingClosureExpr => return getMemberAccessDepth(v.expr, depth + 1)
        case v: MemberAccess => return getMemberAccessDepth(v.baseExpr, depth + 1)
        case v: RefExpr => return depth
        case _ => return depth
    }
}

/**
 * generate animation methods
 * example:
 * Button("text").width(..).height(..).animation(..)
 * =>
 * Button("text").animationStart(..).width(..).height(..).animationEnd()
 */
func parseAnimationEntry(input: Expr): Unit {
    let deepth = getMemberAccessDepth(input, 0)
    parseAnimation(input, false, deepth)
    currentAnimationParmas = ArrayList<Argument>([])
}

func isAnimationCallExpr(input: CallExpr): Bool {
    let callFunc = input.callFunc
    let memberAccess = callFunc as MemberAccess
    match (memberAccess) {
        case Some(v) =>
            if (isAnimation(v.field.value)) {
                v.field = Token(TokenKind.IDENTIFIER, "animationEnd")
                return true
            }
            return false
        case None => return false
    }
}

func parseAnimationBeforeCallFunc(input: Expr) {
    match (input as MemberAccess) {
        case Some(v) =>
            var baseExprTokens = v.baseExpr.toTokens()
            let animationStartCall = CallExpr(quote(animationStart()))
            animationStartCall.arguments = currentAnimationParmas
            baseExprTokens = baseExprTokens + quote(.) + animationStartCall.toTokens()
            v.baseExpr = CallExpr(baseExprTokens)
        case None => ()
    }
}

func parseAnimationBeforeTrailingClosure(input: Expr) {
    match (input as MemberAccess) {
        case Some(v) =>
            var baseExprTokens = v.baseExpr.toTokens()
            let animationStartCall = CallExpr(quote(animationStart()))
            animationStartCall.arguments = currentAnimationParmas
            baseExprTokens = baseExprTokens + quote(.) + animationStartCall.toTokens()
            v.baseExpr = CallExpr(baseExprTokens)
        case None => ()
    }
}

func isAnimation(funcName: String): Bool {
    return funcName == "animation"
}
