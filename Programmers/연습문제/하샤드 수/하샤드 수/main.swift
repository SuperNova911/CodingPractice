//
//  main.swift
//  하샤드 수
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ x:Int) -> Bool {
    let sumOfDigits = String(x).compactMap { Int(String($0))! }.reduce(0, +)
    return x % sumOfDigits == 0
}

let n1 = 10
print(solution(n1)) // true

let n2 = 12
print(solution(n2)) // true

let n3 = 11
print(solution(n3)) // false

let n4 = 13
print(solution(n4)) // false
