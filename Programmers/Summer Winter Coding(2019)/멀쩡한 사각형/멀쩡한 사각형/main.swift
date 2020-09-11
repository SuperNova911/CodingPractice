//
//  main.swift
//  멀쩡한 사각형
//
//  Created by 김수환 on 2020/09/10.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    let totalSquare = Int64(Int64(w) * Int64(h))
    let numberOfPattern = greatestCommonDivisor(w, h)
    let unavailableSquares = ((w / numberOfPattern) + (h / numberOfPattern) - 1) * numberOfPattern
    
    return totalSquare - Int64(unavailableSquares)
}

func greatestCommonDivisor(_ n: Int, _ m: Int) -> Int {
    var a = n
    var b = m
    var temp: Int
    while b != 0 {
        temp = a % b
        a = b
        b = temp
    }
    return a
}

let w1 = 8
let h1 = 12
print(solution(w1, h1)) // 80

