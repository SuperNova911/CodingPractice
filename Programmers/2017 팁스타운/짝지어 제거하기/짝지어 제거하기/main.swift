//
//  main.swift
//  짝지어 제거하기
//
//  Created by 김수환 on 2020/09/20.
//

import Foundation

func solution(_ s:String) -> Int{
    var stack = [Character]()
    for character in s {
        // 스택 맨 위에 있는 문자와 현재 문자가 짝지어지면 제거
        if let topElement = stack.last, topElement == character {
            stack.removeLast()
        } else {
            stack.append(character)
        }
    }

    // 문자열을 모두 제거할 수 있으면 1을 반환
    return stack.isEmpty ? 1 : 0
}

let s1 = "baabaa"
let s2 = "cdcd"

print(solution(s1)) // 1
print(solution(s2)) // 0
