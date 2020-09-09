//
//  main.swift
//  소수 찾기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int {
    var isPrimes = Array(repeating: true, count: n + 1)     // 인덱스 번호와 숫자가 일치하도록 배열을 생성 (인덱스 0과 1은 사용되지 않음)
    var numberOfPrimes = 0
    
    // 에라토스테네스의 체를 사용하여 소수가 아닌 수를 걸러냄
    for number in 2...n {
        if isPrimes[number] {
            numberOfPrimes += 1
            for nonPrimeNumber in stride(from: number * number, to: n + 1, by: number) {
                isPrimes[nonPrimeNumber] = false
            }
        }
    }
    
    return numberOfPrimes
}

let n1 = 10
let result1 = solution(n1)  // 4
print(result1)

let n2 = 5
let result2 = solution(n2)  // 3
print(result2)

let n3 = 10000
let result3 = solution(n3)  // 1229
print(result3)
