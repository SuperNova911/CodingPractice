//
//  main.swift
//  문자열 내림차순으로 배치하기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> String {
    let sortedCharacters = s.sorted {
        $0.isLowercase == $1.isLowercase ? $0 > $1 : $0.isLowercase
    }
    return String(sortedCharacters)
}

let s1 = "Zbcdefg"
let result1 = solution(s1)  // "gfedcbZ"
print(result1)

let s2 = "qfZKfaaAZ"
let result2 = solution(s2)
print(result2)
