//
//  main.swift
//  프렌즈4블록
//
//  Created by 김수환 on 2020/09/23.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    // board를 column별로 묶어서 나눔
    var columns = (0..<n).map { columnIndex -> [Character?] in
        board.map { $0[$0.index($0.startIndex, offsetBy: columnIndex)] }
    }
    
    var totalRemovedBlock = 0
    var matchedPositions = Set<Position>()
    var isBlockRemoved: Bool
    
    repeat {
        // 같은 모양의 블록이 2x2형태로 붙어있는지 검사
        for row in 0..<m - 1 {
            for column in 0..<n - 1 {
                guard let block = columns[column][row] else { continue }
                guard columns[column + 1][row] == block else { continue }       // 오른쪽
                guard columns[column][row + 1] == block else { continue }       // 아래
                guard columns[column + 1][row + 1] == block else { continue }   // 오른쪽 아래
                
                // 매칭되는 위치 정보를 저장
                matchedPositions.formUnion([Position(row: row, column: column),
                                            Position(row: row, column: column + 1),
                                            Position(row: row + 1, column: column),
                                            Position(row: row + 1, column: column + 1)])
            }
        }
        
        // 매칭된 블록들을 지움
        for position in matchedPositions {
            columns[position.column][position.row] = nil
        }
        totalRemovedBlock += matchedPositions.count
        isBlockRemoved = matchedPositions.count > 0
        matchedPositions.removeAll()
        
        // 블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채움
        columns = columns.map {
            let remainBlocks = $0.filter { $0 != nil }
            return Array(repeating: nil, count: m - remainBlocks.count) + remainBlocks  // 남은 블록 위쪽을 nil로 채움
        }
    } while isBlockRemoved
    
    return totalRemovedBlock
}

struct Position: Hashable {
    let row: Int
    let column: Int
}

let m1 = 4
let m2 = 6

let n1 = 5
let n2 = 6

let board1 = ["CCBDE", "AAADE", "AAABF", "CCBBF"]
let board2 = ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]

print(solution(m1, n1, board1)) // 14
print(solution(m2, n2, board2)) // 15
