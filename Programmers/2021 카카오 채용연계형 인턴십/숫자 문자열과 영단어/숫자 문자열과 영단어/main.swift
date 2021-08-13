//
//  main.swift
//  숫자 문자열과 영단어
//
//  Created by 김수환 on 2021/08/13.
//

import Foundation

let stringNumbers: [String: String] = [
    "0": "zero", "1": "one", "2": "two", "3": "three", "4": "four",
    "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"
]

func solution(_ s: String) -> Int {
    var answer = s
    for (number, string) in stringNumbers {
        answer = answer.replacingOccurrences(of: string, with: number)
    }
    return Int(answer)!
}

let s1 = "one4seveneight"
let s2 = "23four5six7"
let s3 = "2three45sixseven"
let s4 = "123"

assert(solution(s1) == 1478)
assert(solution(s2) == 234567)
assert(solution(s3) == 234567)
assert(solution(s4) == 123)
