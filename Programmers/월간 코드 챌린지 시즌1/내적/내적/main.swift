//
//  main.swift
//  내적
//
//  Created by 김수환 on 2021/03/17.
//

import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {
    return zip(a, b)
        .map(*)
        .reduce(0, +)
}

let a1 = [1, 2, 3, 4]
let a2 = [-1, 0, 1]

let b1 = [-3, -1, 0, 2]
let b2 = [1, 0, -1]

print(solution(a1, b1))     // 3
print(solution(a2, b2))     // -2
