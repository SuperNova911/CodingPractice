//
//  main.swift
//  나누어 떨어지는 숫자 배열
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let answers = arr.filter { $0 % divisor == 0 }.sorted()
    return answers.count > 0 ? answers : [-1]
}

let arr1 = [5, 9, 7, 10]
let divisor1 = 5
let result1 = solution(arr1, divisor1)  // [5, 10]
print(result1)

let arr2 = [2, 36, 1, 3]
let divisor2 = 1
let result2 = solution(arr2, divisor2)  // [1, 2, 3, 36]
print(result2)

let arr3 = [3, 2, 6]
let divisor3 = 10
let result3 = solution(arr3, divisor3)  // [-1]
print(result3)
