//
//  main.swift
//  3진법 뒤집기
//
//  Created by 김수환 on 2021/03/17.
//

import Foundation

func solution(_ n:Int) -> Int {
    let ternary = String(n, radix: 3)
    let reversedTernary = String(ternary.reversed())
    return Int(reversedTernary, radix: 3)!
}

let n1 = 45
let n2 = 125

print(solution(n1))     // 7
print(solution(n2))     // 229
