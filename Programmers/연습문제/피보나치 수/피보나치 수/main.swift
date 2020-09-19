//
//  main.swift
//  피보나치 수
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ n:Int) -> Int {
    var fibonacciNumbers = [0, 1] + Array(repeating: 0, count: n - 1)
    for i in 2...n {
        fibonacciNumbers[i] = (fibonacciNumbers[i - 1] + fibonacciNumbers[i - 2]) % 1234567
    }
    
    return fibonacciNumbers[n]
}

let n1 = 3
let n2 = 90000

print(solution(n1)) // 2
print(solution(n2)) // 5
