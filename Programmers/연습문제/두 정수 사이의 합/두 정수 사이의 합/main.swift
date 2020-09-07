//
//  main.swift
//  두 정수 사이의 합
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    let midNumber = Double(a + b) / 2
    let difference = abs(a - b)
    
    return Int64(midNumber * Double(difference + 1))
}

let a1 = 3
let b1 = 5
let result1 = solution(a1, b1)  // 12
print(result1)

let a2 = 3
let b2 = 3
let result2 = solution(a2, b2)  // 3
print(result2)

let a3 = 5
let b3 = 3
let result3 = solution(a3, b3)  // 12
print(result3)
