//
//  main.swift
//  정수 제곱근 판별
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let squareRoot = sqrt(Double(n))
    
    // 제곱근이 정수인지 검사
    if squareRoot == floor(squareRoot) {
        return (Int64(squareRoot) + 1) * (Int64(squareRoot) + 1)
    } else {
        return -1
    }
}

let n1: Int64 = 121
let result1 = solution(n1)   // 144
print(result1)

let n2: Int64 = 3
let result2 = solution(n2)   // -1
print(result2)
