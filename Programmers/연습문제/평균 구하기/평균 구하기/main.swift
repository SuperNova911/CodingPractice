//
//  main.swift
//  평균 구하기
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}

let arr1 = [1, 2, 3, 4]
let resutl1 = solution(arr1)    // 2.5
print(resutl1)

let arr2 = [5, 5]
let result2 = solution(arr2)    // 5
print(result2)
