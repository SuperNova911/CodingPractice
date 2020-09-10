//
//  main.swift
//  x만큼 간격이 있는 n개의 숫자
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map { Int64($0 * x) }
}

let x1 = 2
let n1 = 5
print(solution(x1, n1)) // [2, 4, 6, 8, 10]

let x2 = 4
let n2 = 3
print(solution(x2, n2)) // [4, 8, 12]

let x3 = -4
let n3 = 2
print(solution(x3, n3)) // [-4, -8]
