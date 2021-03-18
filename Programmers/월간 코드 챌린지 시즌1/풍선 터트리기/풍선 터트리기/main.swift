//
//  main.swift
//  풍선 터트리기
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ a:[Int]) -> Int {
    var answer = 2
    
    var leftMin = a.first!
    var rightMin = a.last!
    
    for i in 1..<(a.count - 1) {
        if a[i] < leftMin {
            leftMin = a[i]
            answer += 1
        }
        if a[a.count - i - 1] < rightMin {
            rightMin = a[a.count - i - 1]
            answer += 1
        }
    }
    if leftMin == rightMin {
        answer -= 1
    }
    
    return answer
}

let a1 = [9, -1, -5]
let a2 = [-16, 27, 65, -2, 58, -92, -71, -68, -61, -33]
let a3 = [1, 2, 3, 4, 5]

print(solution(a1)) // 3
print(solution(a2)) // 6
print(solution(a3)) // 5
