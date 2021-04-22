//
//  main.swift
//  괄호 회전하기
//
//  Created by 김수환 on 2021/04/22.
//

import Foundation

func solution(_ s:String) -> Int {
    let input = Array(s)
    var answer = 0
    
    for shift in 0..<input.count {
        var brackets = input[shift...] + input[...(shift - 1)]
        var stack = [Character]()
        while !brackets.isEmpty {
            let bracket = brackets.removeFirst()
            if let leftBracket = stack.last, match(leftBracket, bracket) {
                stack.removeLast()
            } else {
                stack.append(bracket)
            }
        }
        
        if stack.isEmpty {
            answer += 1
        }
    }
    
    return answer
}

func match(_ bracket1: Character, _ bracket2: Character) -> Bool {
    switch bracket1 {
    case "(":
        return bracket2 == ")"
    case "[":
        return bracket2 == "]"
    case "{":
        return bracket2 == "}"
    default:
        return false
    }
}

let s1 = "[](){}"
let s2 = "}]()[{"
let s3 = "[)(]"
let s4 = "}}}"

print(solution(s1)) // 3
print(solution(s2)) // 2
print(solution(s3)) // 0
print(solution(s4)) // 0
