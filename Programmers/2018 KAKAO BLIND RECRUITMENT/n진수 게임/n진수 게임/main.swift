//
//  main.swift
//  n진수 게임
//
//  Created by 김수환 on 2020/09/26.
//

import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var number = 0
    var answers = [Character]()
    
    while answers.count <= t * m + p {
        answers.append(contentsOf: Array(String(number, radix: n)))
        number += 1
    }

    return stride(from: p - 1, to: t * m + p - 1, by: m).map { answers[$0].uppercased() }.reduce("", +)
}

let n1 = 2
let n2 = 16
let n3 = 16

let t1 = 4
let t2 = 16
let t3 = 16

let m1 = 2
let m2 = 2
let m3 = 2

let p1 = 1
let p2 = 1
let p3 = 2

print(solution(n1, t1, m1, p1)) // "0111"
print(solution(n2, t2, m2, p2)) // "02468ACE11111111"
print(solution(n3, t3, m3, p3)) // "13579BDF01234567"
