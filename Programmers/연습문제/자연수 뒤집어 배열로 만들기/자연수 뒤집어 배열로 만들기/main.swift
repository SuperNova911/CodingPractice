//
//  main.swift
//  자연수 뒤집어 배열로 만들기
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    return String(n).reversed().map { Int(String($0))! }
}

let n: Int64 = 12345
let result = solution(n)    // [5, 4, 3, 2, 1]
print(result)
