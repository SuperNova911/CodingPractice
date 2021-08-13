//
//  main.swift
//  약수의 개수와 덧셈
//
//  Created by 김수환 on 2021/08/13.
//

import Foundation

func solution(_ left: Int, _ right: Int) -> Int {
    var answer = 0
    
    for number in left...right {
        if getDivisors(for: number).count % 2 == 0 {
            // 짝수
            answer += number
        } else {
            // 홀수
            answer -= number
        }
    }
    
    return answer
}

func getDivisors(for number: Int) -> [Int] {
    guard number > 1 else { return [1] }
    
    var divisors: [Int] = [number]
    for n in 1...(number / 2) {
        if number % n == 0 {
            divisors.append(n)
        }
    }
    
    return divisors
}

let left1 = 13
let left2 = 24

let right1 = 17
let right2 = 27

assert(solution(left1, right1) == 43)
assert(solution(left2, right2) == 52)
