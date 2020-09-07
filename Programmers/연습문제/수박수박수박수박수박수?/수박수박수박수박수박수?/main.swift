//
//  main.swift
//  수박수박수박수박수박수?
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> String {
    let strings = String(repeating: "수박", count: n / 2)
    return n % 2 == 0 ? strings : strings + "수"
}

let n1 = 3
let result1 = solution(n1)  // "수박수"
print(result1)

let n2 = 4
let result2 = solution(n2)  // "수박수박"
print(result2)
