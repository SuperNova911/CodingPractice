//
//  main.swift
//  합승 택시 요금
//
//  Created by 김수환 on 2021/03/19.
//

import Foundation

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    let infinity = 100000000
    
    // 그래프 초기화
    var graph = [[Int]](repeating: [Int](repeating: infinity, count: n), count: n)
    for (from, to, cost) in fares.map({ ($0[0] - 1, $0[1] - 1, $0[2]) }) {
        graph[from][to] = cost
        graph[to][from] = cost
    }
    for i in 0..<n {
        graph[i][i] = 0
    }
    
    // k: 거쳐가는 지점
    for k in 0..<n {
        for from in 0..<n {
            for to in 0..<n {
                if from == to {
                    continue
                }
                // i에서 j로 갈 때, k를 거쳐가는 비용이 더 적은지 체크
                graph[from][to] = min(graph[from][k] + graph[k][to], graph[from][to])
            }
        }
    }
    
    var minCost = Int.max
    for k in 0..<n {
        minCost = min(graph[s - 1][k] + graph[k][a - 1] + graph[k][b - 1], minCost)
    }
    
    return minCost
}

let n1 = 6
let s1 = 4
let a1 = 6
let b1 = 2
let fares1 = [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]

let n2 = 7
let s2 = 3
let a2 = 4
let b2 = 1
let fares2 = [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]]

let n3 = 6
let s3 = 4
let a3 = 5
let b3 = 6
let fares3 = [[2, 6, 6], [6, 3, 7], [4, 6, 7], [6, 5, 11], [2, 5, 12], [5, 3, 20], [2, 4, 8], [4, 3, 9]]

print(solution(n1, s1, a1, b1, fares1)) // 82
print(solution(n2, s2, a2, b2, fares2)) // 14
print(solution(n3, s3, a3, b3, fares3)) // 18
