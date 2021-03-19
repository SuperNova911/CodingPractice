//
//  main.swift
//  기둥과 보 설치
//
//  Created by 김수환 on 2021/03/19.
//

import Foundation

func solution(_ n: Int, _ buildFrame: [[Int]]) -> [[Int]] {
    var grid = [[Structure]](repeating: [Structure](repeating: Structure(rawValue: 0), count: n + 1), count: n + 1)

    for (x, y, structure, isDestroy) in buildFrame.map({ ($0[0], $0[1], $0[2] == 0 ? Structure.pillar : Structure.beam, $0[3] == 0) }) {
        if isDestroy {
            // 삭제
            destroy(x, y, structure: structure, in: &grid)
        } else {
            // 건설
            if structure == .pillar {
                buildPillar(x, y, in: &grid)
            } else {
                buildBeam(x, y, in: &grid)
            }
        }
    }
    
    // 결과 출력
    var answer = [[Int]]()
    for x in grid.indices {
        for y in grid.indices {
            if grid[x][y].contains(.pillar) {
                answer.append([x, y, 0])
            }
            if grid[x][y].contains(.beam) {
                answer.append([x, y, 1])
            }
        }
    }
    return answer
}

func isPillarStable(_ x: Int, _ y: Int, in grid: inout [[Structure]]) -> Bool {
    // 바닥에는 지을 수 있음
    if y == 0 {
        return true
    }
    
    // 아래에 기둥이 있어야 함
    if grid[x][y - 1].contains(.pillar) {
        return true
    }
    
    // 또는 보가 있어야 함
    for i in max(x - 1, 0)...x {
        if grid[i][y].contains(.beam) {
            return true
        }
    }
    return false
}

func isBeamStable(_ x: Int, _ y: Int, in grid: inout [[Structure]]) -> Bool {
    // 바닥에는 지을 수 없음
    guard y >= 1 else {
        return false
    }
    
    // 한쪽 끝 부분이 기둥 위에 있거나
    if grid[x][y - 1].contains(.pillar) || grid[x + 1][y - 1].contains(.pillar) {
        return true
    }
    
    // 양쪽 끝 부분이 다른 보와 연결되어야 함
    if 0 <= x - 1 && x + 1 < grid.count && grid[x - 1][y].contains(.beam) && grid[x + 1][y].contains(.beam) {
        return true
    }
    
    return false
}

func isNeighborsStable(_ x: Int, _ y: Int, in grid: inout [[Structure]]) -> Bool {
    // 3x3 범위 내에 있는 구조물들의 상태가 안정적인지 검사
    for i in max(x - 1, 0)...min(x + 1, grid.count - 1) {
        for j in max(y - 1, 0)...min(y + 1, grid[i].count - 1) {
            if grid[i][j].contains(.pillar) && !isPillarStable(i, j, in: &grid) {
                return false
            }
            if grid[i][j].contains(.beam) && !isBeamStable(i, j, in: &grid) {
                return false
            }
        }
    }

    return true
}

func buildPillar(_ x: Int, _ y: Int, in grid: inout [[Structure]]) {
    grid[x][y].formUnion(.pillar)
    
    // 건설 조건을 만족시킬수 없으면 취소
    if !isPillarStable(x, y, in: &grid) {
        grid[x][y].formSymmetricDifference(.pillar)
    }
}

func buildBeam(_ x: Int, _ y: Int, in grid: inout [[Structure]]) {
    grid[x][y].formUnion(.beam)
    
    // 건설 조건을 만족시킬수 없으면 취소
    if !isBeamStable(x, y, in: &grid) {
        grid[x][y].formSymmetricDifference(.beam)
    }
}

func destroy(_ x: Int, _ y: Int, structure: Structure, in grid: inout [[Structure]]) {
    grid[x][y].formSymmetricDifference(structure)
    
    // 주변 구조물이 불안정해지면 취소
    if !isNeighborsStable(x, y, in: &grid) {
        grid[x][y].formUnion(structure)
    }
}

struct Structure: OptionSet {
    let rawValue: Int

    static let pillar = Structure(rawValue: 1 << 0)
    static let beam = Structure(rawValue: 1 << 1)
}

let n1 = 5
let n2 = 5

let buildFrame1 = [[1, 0, 0, 1], [1, 1, 1, 1], [2, 1, 0, 1], [2, 2, 1, 1], [5, 0, 0, 1], [5, 1, 0, 1], [4, 2, 1, 1], [3, 2, 1, 1]]
let buildFrame2 = [[0, 0, 0, 1], [2, 0, 0, 1], [4, 0, 0, 1], [0, 1, 1, 1], [1, 1, 1, 1], [2, 1, 1, 1], [3, 1, 1, 1], [2, 0, 0, 0], [1, 1, 1, 0], [2, 2, 0, 1]]

print(solution(n1,  buildFrame1))    // [[1, 0, 0], [1, 1, 1], [2, 1, 0], [2, 2, 1], [3, 2, 1], [4, 2, 1], [5, 0, 0], [5, 1, 0]]
print(solution(n2,  buildFrame2))    // [[0, 0, 0], [0, 1, 1], [1, 1, 1], [2, 1, 1], [3, 1, 1], [4, 0, 0]]
