//
//  main.swift
//  올바른 괄호
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var bracketStack = [Character]()
    for bracket in s {
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

let s1 = "()()"
let s2 = "(())()"
let s3 = ")()("
let s4 = "(()("

print(solution(s1)) // true
print(solution(s2)) // true
print(solution(s3)) // false
print(solution(s4)) // false
