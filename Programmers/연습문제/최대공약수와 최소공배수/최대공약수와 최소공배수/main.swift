//
//  main.swift
//  최대공약수와 최소공배수
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    let nDivisors = divisors(for: n)
    let mDivisors = divisors(for: m)
    let greatestCommonDivisor = Set(nDivisors).intersection(mDivisors).max()!
    let leastCommonMultiple = n * m / greatestCommonDivisor
    return [greatestCommonDivisor, leastCommonMultiple]
}

func divisors(for number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}

let n1 = 3
let m1 = 12
let result1 = solution(n1, m1)  // [3, 12]
print(result1)

let n2 = 2
let m2 = 5
let result2 = solution(n2, m2)  // [1, 10]
print(result2)
