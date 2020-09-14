//
//  main.swift
//  가장 큰 수
//
//  Created by 김수환 on 2020/09/11.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    // 모든 숫자가 0인경우를 처리
    if numbers.allSatisfy({ $0 == 0 }) {
        return "0"
    }
    
    // 두 숫자를 이어 붙였을때 가장 큰 수가 되는 경우로 정렬
    let sortedNumbers = numbers.map { String($0) }
        .sorted(by: { Int($0 + $1)! > Int($1 + $0)! })
    
    return sortedNumbers.reduce("", +)
}

let numbers1 = [6, 10, 2]
let numbers2 = [3, 30, 34, 5, 9]
let numbers3 = [40, 403, 405]
let numbers4 = [0, 0, 0]

print(solution(numbers1))   // "6210"
print(solution(numbers2))   // "9534330"
print(solution(numbers3))   // "44"
print(solution(numbers4))   // "0"
