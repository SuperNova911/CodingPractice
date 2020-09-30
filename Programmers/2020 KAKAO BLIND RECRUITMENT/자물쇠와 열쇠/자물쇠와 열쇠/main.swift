//
//  main.swift
//  자물쇠와 열쇠
//
//  Created by 김수환 on 2020/09/30.
//

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    // 자물쇠의 홈 위치를 저장
    var keyways = Set<Position>()
    for row in lock.indices {
        for column in lock.indices {
            if lock[row][column] == 0 {
                keyways.insert(Position(row: row, column: column))
            }
        }
    }
    
    // 자물쇠에 홈이 하나도 없으면, 자물쇠를 열 수 있음
    if keyways.isEmpty {
        return true
    }
    
    // 열쇠를 360도 돌려보면서 맞춰봄
    var key = key
    for _ in 0..<4 {
        // 열쇠의 돌기 위치들만 저장
        var keyPositions = Set<Position>()
        for row in key.indices {
            for column in key.indices {
                if key[row][column] == 1 {
                    keyPositions.insert(Position(row: row, column: column))
                }
            }
        }
        
        // 열쇠를 상하좌우로 이동시키면서 자물쇠에 딱 맞는지 검사
        for rowOffset in -(key.count - 1)...(key.count - 1) {
            for columnOffset in -(key.count - 1)...(key.count - 1) {
                // 열쇠를 offset만큼 이동시키고 자물쇠의 범위와 겹치는 부분만 선택
                let movedKeyPositions = keyPositions.map { Position(row: $0.row + rowOffset, column: $0.column + columnOffset) }
                    .filter { $0.row >= 0 && $0.row < lock.count && $0.column >= 0 && $0.column < lock.count }
                
                // 자물쇠와 열쇠가 일치하는지 검사
                if keyways == Set(movedKeyPositions) {
                    return true
                }
            }
        }
        
        // 열쇠를 회전시킴
        key = rotateClockwise(key: key)
    }
    
    return false
}

// 키를 시계방향으로 90도만큼 회전
func rotateClockwise(key: [[Int]]) -> [[Int]] {
    key.indices.map { row in
        key.indices.reversed().map { column in
            key[column][row]
        }
    }
}

struct Position: Hashable {
    let row: Int
    let column: Int
}

let key1 = [[0, 0, 0], [1, 0, 0], [0, 1, 1]]

let lock1 = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]

print(solution(key1, lock1))    // true
print(solution([[1, 1], [0, 1]], [[1, 0], [0, 0]]))
