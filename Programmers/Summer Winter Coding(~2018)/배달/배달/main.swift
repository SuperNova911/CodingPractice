//
//  main.swift
//  배달
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    // 마을 간의 거리를 저장, 연결되어 있지 않으면 nil
    var costMap = [[Int?]](repeating: [Int?](repeating: nil, count: N), count: N)
    for (from, to, cost) in road.map({ ($0[0] - 1, $0[1] - 1, $0[2]) }) {
        let cost = min(cost, costMap[from][to] ?? Int.max)
        costMap[from][to] = cost
        costMap[to][from] = cost
    }
    
    var distanceMap = [Int](repeating: Int.max, count: N)
    var unvisitedTowns = Set<Int>(0..<N)
    
    // 1번 마을에서 시작 (인덱스 0)
    let startTown = 0
    distanceMap[startTown] = 0
    unvisitedTowns.remove(startTown)
    
    // 시작 마을과 연결된 마을의 거리를 업데이트
    for (neighbor, cost) in costMap[startTown].enumerated() {
        if let cost = cost {
            distanceMap[neighbor] = cost
        }
    }
    
    while !unvisitedTowns.isEmpty {
        // 방문하지 않은 마을 중 가장 가까운 마을을 선택, 방문
        let closestTown = distanceMap
            .enumerated()
            .filter { id, distance in unvisitedTowns.contains(id) && distanceMap[id] != Int.max }
            .sorted { $0.element < $1.element }
            .first!.offset
        unvisitedTowns.remove(closestTown)
        
        // 선택한 마을과 연결된 마을들의 거리를 업데이트
        costMap[closestTown]
            .enumerated()
            .filter { neighbor, cost in unvisitedTowns.contains(neighbor) && cost != nil }
            .forEach { neighbor, cost in
                if distanceMap[neighbor] > distanceMap[closestTown] + costMap[closestTown][neighbor]! {
                    distanceMap[neighbor] = distanceMap[closestTown] + costMap[closestTown][neighbor]!
                }
            }
    }
    
    // 거리가 k보다 작은 마을의 수 반환
    return distanceMap.filter { $0 <= k }.count
}

let N1 = 5
let N2 = 6

let road1 = [[1, 2, 1], [2, 3, 3], [5, 2, 2], [1, 4, 2], [5, 3, 1], [5, 4, 2]]
let road2 = [[1, 2, 1], [1, 3, 2], [2, 3, 2], [3, 4, 3], [3, 5, 2], [3, 5, 3], [5, 6, 1]]

let K1 = 3
let K2 = 4

print(solution(N1, road1, K1))  // 4
print(solution(N2, road2, K2))  // 4
