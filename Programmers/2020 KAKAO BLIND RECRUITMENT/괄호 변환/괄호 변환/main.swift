//
//  main.swift
//  괄호 변환
//
//  Created by 김수환 on 2020/09/15.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ p:String) -> String {
    // 입력이 빈 문자열인 경우, 빈 문자열을 반환
    if p.isEmpty {
        return ""
    }
    
    // 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리
    // u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있음
    var splitIndex = 0
    var leftBracketCount = 0
    var rightBracketCount = 0
    for (index, bracket) in p.enumerated() {
        if bracket == "(" {
            leftBracketCount += 1
        } else {
            rightBracketCount += 1
        }
        
        // 왼쪽괄호와 오른쪽괄호의 개수 균형이 맞으면 루프 탈출
        if leftBracketCount == rightBracketCount {
            splitIndex = index
            break
        }
    }
    var u = String(p.prefix(splitIndex + 1))
    var v = String(p.suffix(p.count - splitIndex - 1))
    
    // 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행
    if isValidString(u) {
        v = solution(v)
        // 수행한 결과 문자열을 u에 이어 붙인 후 반환
        return u + solution(v)
    }
    // 문자열 u가 "올바른 괄호 문자열"이 아니라면
    else {
        // 빈 문자열에 첫 번째 문자로 '('를 붙임
        var validString = "("
        
        // 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙임
        validString += solution(v)
        
        // ')'를 다시 붙임
        validString += ")"
        
        // u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙임
        u.removeFirst()
        u.removeLast()
        validString += u.map { $0 == "(" ? ")" : "(" }
        
        // 생성된 문자열을 반환
        return validString
    }
}

func isValidString(_ string: String) -> Bool {
    var bracketStack = [Character]()
    for bracket in string {
        if bracket == "(" {
            bracketStack.append(bracket)
        } else {
            guard bracketStack.popLast() != nil else {
                return false
            }
        }
    }
    
    return bracketStack.isEmpty
}

let p1 = "(()())()"
let p2 = ")("
let p3 = "()))((()"

print(solution(p1)) // "(()())()"
print(solution(p2)) // "()"
print(solution(p3)) // "()(())()"
