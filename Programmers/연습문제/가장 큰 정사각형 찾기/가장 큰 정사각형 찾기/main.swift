//
//  main.swift
//  가장 큰 정사각형 찾기
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    let width = board[0].count
    let height = board.count
    
    // 동적 계획법으로 만들 수 있는 정사각형의 크기를 구함
    var dp = Array(repeating: Array(repeating: 0, count: width), count: height)
    for y in 0..<height {
        for x in 0..<width {
            if board[y][x] == 1 {
                // [왼쪽, 위, 왼쪽 위]에서 만들 수 있었던 정사각형 크기의 최솟값에 1을 더함
                let left = x - 1 >= 0 ? dp[y][x - 1] : 0
                let top = y - 1 >= 0 ? dp[y - 1][x] : 0
                let topLeft = (x - 1 >= 0 && y - 1 >= 0) ? dp[y - 1][x - 1] : 0
                dp[y][x] = min(left, top, topLeft) + 1
            } else {
                dp[y][x] = 0
            }
        }
    }
    
    let maxSize = dp.map { $0.max()! }.max()!
    return maxSize * maxSize
}



let board1 = [[0, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 1, 0]]
let board2 = [[0, 0, 1, 1], [1 ,1 ,1 ,1]]

print(solution(board1)) // 9
print(solution(board2)) // 4
