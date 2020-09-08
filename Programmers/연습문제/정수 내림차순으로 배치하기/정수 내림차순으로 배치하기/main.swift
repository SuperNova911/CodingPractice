//
//  main.swift
//  정수 내림차순으로 배치하기
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}

let n1: Int64 = 118372
let result1 = solution(n1)  // 873211
print(result1)
