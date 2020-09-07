//
//  main.swift
//  약수의 합
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int {
    if n < 2 {
        return n
    } else {
        return (1...(n / 2)).filter { n % $0 == 0 }.reduce(n, +)
    }
}

let n1 = 12
let result1 = solution(n1)  // 28
print(result1)

let n2 = 5
let result2 = solution(n2)  // 6
print(result2)
