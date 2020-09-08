//
//  main.swift
//  제일 작은 수 제거하기
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    let minValue = arr.min()!
    let answer = arr.filter { $0 != minValue }
    return answer.count > 0 ? answer : [-1]
}

let arr1 = [4, 3, 2, 1]
let result1 = solution(arr1)    // [4, 3, 2]
print(result1)
