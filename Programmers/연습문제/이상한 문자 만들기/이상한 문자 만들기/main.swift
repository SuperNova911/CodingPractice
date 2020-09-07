//
//  main.swift
//  이상한 문자 만들기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> String {
    let answer = s.components(separatedBy: " ").map {
        String($0.enumerated().map { index, letter in
            // 단어의 인덱스가 짝수면 대문자, 홀수면 소문자
            index % 2 == 0 ? Character(letter.uppercased()) : Character(letter.lowercased()) })
    }.joined(separator: " ")
    return answer
}

let s1 = "try hello world"
let return1 = solution(s1)  // "TrY HeLlO WoRlD"
print(return1)

let s2 = "abc  ef g"
let return2 = solution(s2)  // AbC DeF G"
print(return2)

print(s2.components(separatedBy: " "))
