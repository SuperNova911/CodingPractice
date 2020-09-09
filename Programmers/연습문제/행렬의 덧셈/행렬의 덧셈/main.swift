//
//  main.swift
//  행렬의 덧셈
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return Array(zip(arr1, arr2).map {
        zip($0, $1).map(+)
    })
}

let arr1 = [[1, 2], [2, 3]]
let arr2 = [[3, 4], [5, 6]]
print(solution(arr1, arr2)) // [[4, 6], [7, 9]]
