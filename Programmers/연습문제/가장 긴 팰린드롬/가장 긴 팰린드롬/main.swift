//
//  main.swift
//  가장 긴 팰린드롬
//
//  Created by 김수환 on 2021/03/19.
//

import Foundation

func solution(_ s: String) -> Int {
    let letters = [Character](s)
    
    var maxLength = 0
    for i in 0..<letters.count {
        // 홀수 길이 팰린드롬 검사
        for j in 0...min(i, letters.count - i) {
            var length = 0
            if i + j < letters.count && letters[i - j] == letters[i + j] {
                length = 1 + j * 2
            } else {
                break
            }
            maxLength = max(length, maxLength)
        }
        
        // 짝수 길이 팰린드롬 검사
        for j in 0...i {
            var length = 0
            if i + j + 1 < letters.count && letters[i - j] == letters[i + j + 1] {
                length = (j + 1) * 2
            } else {
                break
            }
            maxLength = max(length, maxLength)
        }
    }
    
    return maxLength
}

let s1 = "abcdcba"
let s2 = "abacde"
let s3 = "abba"
let s4 = "a"

print(solution(s1)) // 7
print(solution(s2)) // 3
print(solution(s3)) // 4
print(solution(s4)) // 1
