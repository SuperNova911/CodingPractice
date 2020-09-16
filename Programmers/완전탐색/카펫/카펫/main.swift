//
//  main.swift
//  카펫
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for possibleYellowHeight in 1...Int(ceil(Double(yellow) / 2)) {
        // possibleYellowHeight의 높이로 노란색 네모를 만들 수 있는지 검사
        if yellow % possibleYellowHeight != 0 {
            continue
        }
        
        let yellowWidth = yellow / possibleYellowHeight
        let yellowHeight = possibleYellowHeight
        
        // 주어진 갈색 격자로 노란색 네모를 딱 맞게 둘러 쌀 수 있는지 검사
        if brown == (yellowWidth * 2) + (yellowHeight * 2) + 4 {
            // 갈색을 포함한 카펫의 크기를 반환
            return [yellowWidth + 2, yellowHeight + 2]
        }
    }
    return []
}

let brown1 = 10
let brown2 = 8
let brown3 = 24

let yellow1 = 2
let yellow2 = 1
let yellow3 = 24

print(solution(brown1, yellow1))    // [4, 3]
print(solution(brown2, yellow2))    // [3, 3]
print(solution(brown3, yellow3))    // [8, 6]
