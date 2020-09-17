//
//  main.swift
//  다음 큰 숫자
//
//  Created by 김수환 on 2020/09/17.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int
{
    let numberOf1 = String(n, radix: 2).filter { $0 == "1" }.count
    for number in (n + 1)... {
        if numberOf1 == String(number, radix: 2).filter({ $0 == "1" }).count {
            return number
        }
    }
    return 0
}

let n1 = 78
let n2 = 15

print(solution(n1)) // 83
print(solution(n2)) // 23
