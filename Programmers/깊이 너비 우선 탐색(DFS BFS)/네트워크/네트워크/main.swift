//
//  main.swift
//  네트워크
//
//  Created by 김수환 on 2020/09/29.
//

import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var unvisitedComputers = Set(0..<n)
    var numberOfNetwork = 0
    
    // 모든 컴퓨터를 방문할 때까지
    while !unvisitedComputers.isEmpty {
        let root = unvisitedComputers.removeFirst()
        var visitStack = [root]
        
        // root 컴퓨터와 같은 네트워크에 있는 모든 컴퓨터를 방문할 때까지
        while !visitStack.isEmpty {
            // currentComputer와 연결된 컴퓨터중 방문하지 않은 컴퓨터를 선택
            let currentComputer = visitStack.last!
            let possibleNextComputer = computers[currentComputer].enumerated()
                .filter { (computerIndex, isConnected) in
                    isConnected == 1 && unvisitedComputers.contains(computerIndex)
                }.first?.offset
            
            if let nextComputer = possibleNextComputer {
                unvisitedComputers.remove(nextComputer)
                visitStack.append(nextComputer)
            } else {
                visitStack.removeLast()
            }
        }
        numberOfNetwork += 1
    }
    
    return numberOfNetwork
}

let n1 = 3
let n2 = 3

let computers1 = [[1, 1, 0], [1, 1, 0], [0, 0, 1]]
let computers2 = [[1, 1, 0], [1, 1, 1], [0, 1, 1]]

print(solution(n1, computers1)) // 2
print(solution(n2, computers2)) // 1
