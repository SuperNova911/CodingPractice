//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Bool
{
    let numberOfP = s.lowercased().filter { $0 == "p" }.count
    let numberOfY = s.lowercased().filter { $0 == "y" }.count
    
    return numberOfP == numberOfY
}

let s1 = "pPoooyY"
let result1 = solution(s1)  // true
print(result1)

let s2 = "Pyy"
let result2 = solution(s2)  // false
print(result2)
