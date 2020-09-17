//
//  main.swift
//  튜플
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> [Int] {
    // 입력 문자열을 다루기 쉽게 [[Int]]로 변환, 배열 요소 개수별로 정렬
    let subTuples = s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.endIndex, offsetBy: -2)]
        .components(separatedBy: "},{")
        .map { $0.split(separator: ",").map { Int($0)! }}
        .sorted(by: { $0.count < $1.count })
    
    var tupleSet = Set<Int>()
    var tuple = Array<Int>()
    for subTuple in subTuples {
        let newElements = Set(subTuple).subtracting(tupleSet)
        tuple.append(contentsOf: newElements)
        tupleSet.formUnion(newElements)
    }
    
    return tuple
}

let s1 = "{{2},{2,1},{2,1,3},{2,1,3,4}}"
let s2 = "{{1,2,3},{2,1},{1,2,4,3},{2}}"
let s3 = "{{20,111},{111}}"
let s4 = "{{123}}"
let s5 = "{{4,2,3},{3},{2,3,4,1},{2,3}}"

print(solution(s1)) // [2, 1, 3, 4]
print(solution(s2)) // [2, 1, 3, 4]
print(solution(s3)) // [111, 20]
print(solution(s4)) // [123]
print(solution(s5)) // [3, 2, 4, 1]
