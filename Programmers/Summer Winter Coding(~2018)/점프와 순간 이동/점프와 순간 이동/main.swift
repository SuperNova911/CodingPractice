//
//  main.swift
//  점프와 순간 이동
//
//  Created by 김수환 on 2020/09/22.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var totalJumps = 0
    var position = n
    
    // 목적지에서 처음 위치까지 거꾸로 탐색
    while position > 0 {
        // 짝수면 텔레포트로 올 수 있는 자리임
        if position % 2 == 0 {
            position /= 2
        } else {
            // 텔레포트로 올 수 없으면 점프를 사용
            position -= 1
            totalJumps += 1
        }
    }
    return totalJumps
}

let n1 = 5
let n2 = 6
let n3 = 5000

print(solution(n1)) // 2
print(solution(n2)) // 2
print(solution(n3)) // 5

// 1 2 4 8
// 2 4 8 16
// 3 6 9 12
// 5 10 20
