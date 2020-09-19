//
//  main.swift
//  N개의 최소공배수
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(arr[0], { $0 * $1 / greatestCommonDivisor($0, $1)})
}

func greatestCommonDivisor(_ n: Int, _ m: Int) -> Int {
    var a = n
    var b = m
    var temp: Int
    while b != 0 {
        temp = a % b
        a = b
        b = temp
    }
    return a
}

let arr1 = [2, 6, 8, 14]
let arr2 = [1, 2, 3]

print(solution(arr1))   // 168
print(solution(arr2))   // 6
