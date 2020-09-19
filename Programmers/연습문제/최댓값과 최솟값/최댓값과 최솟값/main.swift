//
//  main.swift
//  최댓값과 최솟값
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ s:String) -> String {
    let numbers = s.split(separator: " ").map { Int($0)! }
    return "\(numbers.min()!) \(numbers.max()!)"
}

let s1 = "1 2 3 4"
let s2 = "-1 -2 -3 -4"
let s3 = "-1 -1"

print(solution(s1)) // "1 4"
print(solution(s2)) // "-4 -1"
print(solution(s3)) // "-1 -1"
