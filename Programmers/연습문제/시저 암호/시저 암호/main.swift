//
//  main.swift
//  시저 암호
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    return String(String.UnicodeScalarView(s.unicodeScalars.map { shiftLetter($0, shift: n) }))
}

func shiftLetter(_ letter: UnicodeScalar, shift: Int) -> UnicodeScalar {
    switch letter {
        case UnicodeScalar("a")...UnicodeScalar("z"):
            let firstValue = Int(UnicodeScalar("a").value)
            let lastValue = Int(UnicodeScalar("z").value)
            let offset = (Int(letter.value) - firstValue + shift) % (lastValue - firstValue + 1)
            return UnicodeScalar(firstValue + offset)!
        case UnicodeScalar("A")...UnicodeScalar("Z"):
            let firstValue = Int(UnicodeScalar("A").value)
            let lastValue = Int(UnicodeScalar("Z").value)
            let offset = (Int(letter.value) - firstValue + shift) % (lastValue - firstValue + 1)
            return UnicodeScalar(firstValue + offset)!
        default:
            return letter
    }
}

let s1 = "AB"
let n1 = 1
let result1 = solution(s1, n1)  // "BC"
print(result1)

let s2 = "z"
let n2 = 1
let result2 = solution(s2, n2)  // "a"
print(result2)

let s3 = "a B z"
let n3 = 4
let result3 = solution(s3, n3)  // "e F d"
print(result3)
