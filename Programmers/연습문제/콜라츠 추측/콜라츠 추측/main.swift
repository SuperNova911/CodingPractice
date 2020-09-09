//
//  main.swift
//  콜라츠 추측
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ num:Int) -> Int {
    var number = num
    var iteration = 0
    
    repeat {
        if number == 1 {
            return iteration
        }
        
        // 짝수와 홀수의 경우를 나눔
        if number % 2 == 0 {
            number /= 2
        } else {
            number = number * 3 + 1
        }
        iteration += 1
    } while iteration <= 500
    
    // 500번을 시도해도 안될 경우
    return -1
}

let n1 = 6
let result1 = solution(n1)  // 8
print(result1)

let n2 = 16
let result2 = solution(n2)  // 4
print(result2)

let n3 = 626331
let result3 = solution(n3)  // -1
print(result3)
