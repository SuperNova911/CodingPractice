//
//  main.swift
//  가장 먼 노드
//
//  Created by 김수환 on 2020/10/03.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 노드를 생성하고 연결
    var nodes = [Int: Node]()
    for edgeInfo in edge {
        let nodeAId = edgeInfo[0]
        let nodeBId = edgeInfo[1]
        if nodes[nodeAId] == nil {
            nodes[nodeAId] = Node(id: nodeAId)
        }
        if nodes[nodeBId] == nil {
            nodes[nodeBId] = Node(id: nodeBId)
        }
        
        // 양방향 연결
        nodes[nodeAId]!.connectedNodes.append(nodes[nodeBId]!)
        nodes[nodeBId]!.connectedNodes.append(nodes[nodeAId]!)
    }
    
    // 1번 노드부터 시작
    let rootNode = nodes[1]!
    
    // bfs로 그래프를 탐색
    var currentNodes = [rootNode]
    while true {
        currentNodes.forEach { $0.isVisited = true }
        // 연결된 노드 중, 방문하지 않은 노드를 선택
        let nextNodes = Set(currentNodes.flatMap { $0.connectedNodes.filter { !$0.isVisited }})
        
        // 더 이상 방문할 노드가 없으면, 현재 노드들이 1번으로부터 가장 멀리 떨어진 노드들
        if nextNodes.isEmpty {
            return currentNodes.count
        } else {
            currentNodes = Array(nextNodes)
        }
    }
}

class Node : Hashable {
    let id: Int
    var isVisited = false
    var connectedNodes = [Node]()
    
    init(id: Int) {
        self.id = id
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

let n1 = 6

let vertex1 = [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]

print(solution(n1, vertex1))    // 3
