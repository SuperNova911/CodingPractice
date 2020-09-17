//
//  main.swift
//  삼각 달팽이
//
//  Created by 김수환 on 2020/09/17.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var answer = Array(repeating: 0, count: (n + 1) * n / 2)    // 가우스 공식을 사용해서 최종 배열의 크기를 계산
    
    var number = 1      // 1부터 차례로 증가
    var cycle = 0       // 0: 왼쪽 아래로 이동 1: 오른쪽으로 이동, 2: 왼쪽 위로 이동
    var distance = 0    // 가장 바깥쪽 삼각형으로부터의 거리
    
    // 각 사이클마다 입력하는 숫자의 길이는 n, n - 1, n - 2, ..., 2, 1 순서로 줄어듦
    for length in (1...n).reversed() {
        for i in 0..<length {
            let row: Int
            let column: Int
            if cycle == 0 {
                row = (i + distance * 2 + 1) * (i + distance * 2) / 2
                column = distance
            } else if cycle == 1 {
                row = (n - 1 - distance + 1) * (n - 1 - distance) / 2
                column = i + distance + 1
            } else {
                row = (n - i - 1 - distance + 1) * (n - i - 1 - distance) / 2
                column = -1 - distance
            }
            answer[row + column] = number
            number += 1
        }
        
        cycle += 1
        if cycle == 3 {
            distance += 1
            cycle = 0
        }
    }
    
    // 디버그: 삼각형 모양으로 배열 출력
//    for i in 0..<n {
//        let rowIndex = (i + 1) * i / 2
//        print(answer[rowIndex..<(rowIndex + i + 1)])
//    }
    
    return answer
}

let n1 = 4
let n2 = 5
let n3 = 6

print(solution(n1)) // [1, 2, 9, 3, 10, 8, 4, 5, 6, 7]
print(solution(n2)) // [1, 2, 12, 3, 13, 11, 4, 14, 15, 10, 5, 6, 7, 8, 9]
print(solution(n3)) // [1, 2, 15, 3, 16, 14, 4, 17, 21, 13, 5, 18, 19, 20, 12, 6, 7, 8, 9, 10, 11]
