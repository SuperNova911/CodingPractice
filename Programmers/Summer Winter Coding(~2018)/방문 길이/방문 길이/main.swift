//
//  main.swift
//  방문 길이
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ dirs:String) -> Int {
    // 캐릭터는 좌표평면의 (0, 0) 위치에서 시작
    var characterPos = Point(x: 0, y: 0)
    var visitedPaths = Set<Path>()
    
    for direction in Array(dirs) {
        let moveDirection = Point(from: direction)
        let nextPos = characterPos + moveDirection
        
        // 좌표평면의 경계를 넘어가는 명령어는 무시
        guard (-5...5).contains(nextPos.x) && (-5...5).contains(nextPos.y) else {
            continue
        }
        
        // 캐릭터 이동
        visitedPaths.insert(Path(a: characterPos, b: nextPos))
        characterPos = nextPos
    }
    
    return visitedPaths.count
}

struct Point: Hashable {
    var x: Int
    var y: Int
    
    static func +(lhs: Point, rhs: Point) -> Point {
        Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

extension Point {
    init(from direction: Character) {
        switch direction {
            case "U":
                x = 0
                y = 1
            case "D":
                x = 0
                y = -1
            case "R":
                x = 1
                y = 0
            default:    // L
                x = -1
                y = 0
        }
    }
}

struct Path: Hashable {
    var from: Point
    var to: Point
    
    init(a: Point, b: Point) {
        // a, b가 뒤집혀도 동일한 객체로 취급하기 위해 정렬한 값을 사용
        let path = [a, b].sorted { $0.x != $1.x
            ? $0.x < $1.x
            : $0.y < $1.y
        }
        from = path[0]
        to = path[1]
    }
}

let dirs1 = "ULURRDLLU"
let dirs2 = "LULLLLLLU"
let dirs3 = "LRLRL"

print(solution(dirs1))  // 7
print(solution(dirs2))  // 7
print(solution(dirs3))  // 1
