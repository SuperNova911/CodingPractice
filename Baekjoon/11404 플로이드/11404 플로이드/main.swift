//
//  main.swift
//  11404 플로이드
//
//  Created by 김수환 on 2021/03/16.
//

import Foundation

func solution(_ n: Int, _ m: Int, _ busInfos: [[Int]]) {
    let infinity = 99999999
    var grid = Array(repeating: Array(repeating: infinity, count: n), count: n)
    
    for (start, end, cost) in busInfos.map({ ($0[0] - 1, $0[1] - 1, $0[2]) }) {
        grid[start][end] = min(grid[start][end], cost)
    }
    
    for k in 0..<n {
        for i in grid.indices {
            for j in grid.indices {
                if i == j {
                    continue
                }
                grid[i][j] = min(grid[i][j], grid[i][k] + grid[k][j])
            }
        }
    }
    
    for i in grid.indices {
        print(grid[i].map { String($0 == infinity ? 0 : $0) }
                .joined(separator: " "))
    }
}

let input =
"""
1 2 2
1 3 3
1 4 1
1 5 10
2 4 2
3 4 1
3 5 1
4 5 3
3 5 10
3 1 8
1 4 2
5 1 7
3 4 2
5 2 4
"""

let n = 5
let m = 14
let busInfos = input
    .components(separatedBy: .newlines)
    .map { $0.components(separatedBy: .whitespaces)
        .map { Int($0)! }
    }

solution(n, m, busInfos)
