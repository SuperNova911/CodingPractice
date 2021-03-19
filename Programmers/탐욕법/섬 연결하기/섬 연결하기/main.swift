//
//  main.swift
//  섬 연결하기
//
//  Created by 김수환 on 2021/03/19.
//

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var roots = [Int](0..<n)
    var ranks = [Int](repeating: 0, count: n)
    
    var totalCost = 0
    for (from, to, cost) in costs.sorted(by: { $0[2] < $1[2] }).map({ ($0[0], $0[1], $0[2]) }) {
        if findRoot(from, in: &roots) != findRoot(to, in: &roots) {
            union(from, to, in: &roots, ranks: &ranks)
            totalCost += cost
        }
    }
    
    return totalCost
}

func findRoot(_ x: Int, in roots: inout [Int]) -> Int {
    if roots[x] == x {
        return x
    } else {
        // 경로 압축
        // find 하면서 만난 모든 값의 부모 노드를 root로 만든다
        roots[x] = findRoot(roots[x], in: &roots)
        return roots[x]
    }
}

func union(_ x: Int, _ y: Int, in roots: inout [Int], ranks: inout [Int]) {
    let x = findRoot(x, in: &roots)
    let y = findRoot(y, in: &roots)
    
    // 두 값의 root가 같으면(이미 같은 트리) 합치지 않는다
    if x == y {
        return
    }
    
    // union-by-rank 최적화
    // 항상 높이가 더 낮은 트리를 높이가 높은 트리 밑에 넣는다
    if ranks[x] < ranks[y] {
        roots[x] = y    // x의 root를 y로 변경
    } else {
        roots[y] = x    // y의 root를 x로 변경
    }
    
    // 높이가 같다면 합친 후 x의 높이 증가 (x의 자식으로 y를 추가했음)
    if ranks[x] == ranks[y] {
        ranks[x] += 1
    }
}


let n = 4
let costs = [[0, 1, 1], [0, 2, 2], [1, 2, 5], [1, 3, 1], [2, 3, 8]]

print(solution(n, costs))   // 4
