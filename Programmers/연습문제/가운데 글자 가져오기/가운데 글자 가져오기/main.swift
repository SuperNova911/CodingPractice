//
//  main.swift
//  가운데 글자 가져오기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> String {
    let midOffset = Int(floor(Double(s.count) / 2))
    let startIndex = s.index(s.startIndex, offsetBy: midOffset - (s.count % 2 > 0 ? 0 : 1))
    let endIndex = s.index(s.startIndex, offsetBy: midOffset)
    
    return String(s[startIndex...endIndex])
}

let s1 = "abcde"
let result1 = solution(s1)  // "c"
print(result1)

let s2 = "qwer"
let result2 = solution(s2)  // "we"
print(result2)
