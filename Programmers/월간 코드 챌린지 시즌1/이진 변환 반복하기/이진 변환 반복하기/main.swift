//
//  main.swift
//  이진 변환 반복하기
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var convertCount = 0
    var removedZeros = 0
    while s != "1" {
        removedZeros += s.filter { $0 == "0" }.count
        
        s = String(s.filter { $0 != "0" }.count, radix: 2)
        convertCount += 1
    }
    
    return [convertCount, removedZeros]
}

let s1 = "110010101001"
let s2 = "01110"
let s3 = "1111111"

print(solution(s1)) // [3, 8]
print(solution(s2)) // [3, 3]
print(solution(s3)) // [4, 1]
