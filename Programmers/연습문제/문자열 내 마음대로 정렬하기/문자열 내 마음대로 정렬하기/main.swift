//
//  main.swift
//  문자열 내 마음대로 정렬하기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    let sortedStrings = strings.sorted {
        let nthLetterLeft = $0[$0.index($0.startIndex, offsetBy: n)]
        let nthLetterRight = $1[$1.index($1.startIndex, offsetBy: n)]
        
        // n번째 문자를 비교
        // n번째 문자가 같으면 사전 순서로 비교
        if nthLetterLeft == nthLetterRight {
            return $0 < $1
        } else {
            return nthLetterLeft < nthLetterRight
        }
    }
    return sortedStrings
}

let strings1 = ["sun", "bed", "car"]
let n1 = 1
let return1 = solution(strings1, n1)    // ["car", "bed", "sun"]
print(return1)

let strings2 = ["abce", "abcd", "cdx"]
let n2 = 2
let return2 = solution(strings2, n2)    // ["abcd", "abcd", "cdx"]
print(return2)

let strings3 = ["zfq", "afca", "afc", "bfc", "kfc", "zfqq", "xaa", "aaa", "xxx"]
let n3 = 1
let return3 = solution(strings3, n3)
print(return3)
