//
//  main.swift
//  예상 대진표
//
//  Created by 김수환 on 2020/09/22.
//

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var nextANumber = a // a참가자의 다음 번호
    var nextBNumber = b // b참가자의 다음 번호
    
    let totalRounds = Int(log2(Double(n)))
    for round in 1...totalRounds {
        // a와 b참가자의 다음 라운드 번호를 계산
        nextANumber = Int(ceil(Double(nextANumber) / 2))
        nextBNumber = Int(ceil(Double(nextBNumber) / 2))
        
        if nextANumber == nextBNumber {
            return round
        }
    }
    return totalRounds
}

let n1 = 8
let n2 = 4
let n3 = 8

let a1 = 4
let a2 = 2
let a3 = 1

let b1 = 7
let b2 = 3
let b3 = 8

print(solution(n1, a1, b1)) // 3
print(solution(n2, a2, b2)) // 2
print(solution(n3, a3, b3)) // 3
