//
//  main.swift
//  음양 더하기
//
//  Created by 김수환 on 2021/04/22.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs)
        .map { number, sign in sign ? number : -number }
        .reduce(0, +)
}

let absolutes1 = [4, 7, 12]
let absolutes2 = [1, 2, 3]

let signs1 = [true, false, true]
let signs2 = [false, false, true]

print(solution(absolutes1, signs1)) // 9
print(solution(absolutes2, signs2)) // 0
