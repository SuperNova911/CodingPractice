//
//  main.swift
//  행렬의 곱셈
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    for row in 0..<result.count {
        for column in 0..<result[row].count {
            result[row][column] = zip(arr1[row], arr2.map { $0[column] })
                .map(*).reduce(0, +)    // 각 요소별로 곱한 후 더하기
        }
    }
    return result
}

let arr1_1 = [[1, 4], [3, 2], [4, 1]]
let arr1_2 = [[2, 3, 2], [4, 2, 4], [3, 1, 4]]
let arr1_3 = [[1, 2], [3, 4], [5, 6]]

let arr2_1 = [[3, 3], [3, 3]]
let arr2_2 = [[5, 4, 3], [2, 4, 1], [3, 1, 1]]
let arr2_3 = [[1, 2, 3], [4, 5, 6]]

print(solution(arr1_1, arr2_1)) // [[15, 15], [15, 15], [15, 15]]
print(solution(arr1_2, arr2_2)) // [[22, 22, 11], [36, 28, 18], [29, 20, 14]]
print(solution(arr1_3, arr2_3))
