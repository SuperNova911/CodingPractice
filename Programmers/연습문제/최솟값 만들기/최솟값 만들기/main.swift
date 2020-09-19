//
//  main.swift
//  최솟값 만들기
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    return zip(A.sorted(by: <), B.sorted(by: >)).map(*).reduce(0, +)
}

let A1 = [1, 4, 2]
let A2 = [1, 2]

let B1 = [5, 4, 4]
let B2 = [3, 4]

print(solution(A1, B1)) // 29
print(solution(A2, B2)) // 10
