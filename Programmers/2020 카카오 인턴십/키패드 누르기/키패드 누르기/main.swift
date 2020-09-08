//
//  main.swift
//  키패드 누르기
//
//  Created by 김수환 on 2020/09/08.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    // 버튼의 위치 테이블
    let buttonPoses = [1: Position(x: 0, y: 0), 2: Position(x: 1, y: 0), 3: Position(x: 2, y: 0),
                       4: Position(x: 0, y: 1), 5: Position(x: 1, y: 1), 6: Position(x: 2, y: 1),
                       7: Position(x: 0, y: 2), 8: Position(x: 1, y: 2), 9: Position(x: 2, y: 2),
                       0: Position(x: 1, y: 3)]
    var leftThumbPos = Position(x: 0, y: 3)     // 왼손 엄지는 *에서 시작
    var rightThumbPos = Position(x: 2, y: 3)    // 오른손 엄지는 #에서 시작
    var answer = ""
    
    for number in numbers {
        // 키를 누르는데 사용할 엄지 손가락 결정
        let selectedHand: String
        switch number {
            case 1, 4, 7:
                selectedHand = "L"
            case 3, 6, 9:
                selectedHand = "R"
            default:
                let targetButtonPos = buttonPoses[number]!
                let leftThumbDistance = targetButtonPos.manhattanDistance(to: leftThumbPos)
                let rightThumbDistance = targetButtonPos.manhattanDistance(to: rightThumbPos)
                if leftThumbDistance < rightThumbDistance {
                    selectedHand = "L"
                } else if rightThumbDistance < leftThumbDistance {
                    selectedHand = "R"
                } else {
                    selectedHand = hand == "left" ? "L" : "R"
                }
        }
        
        // 버튼을 누른 손가락을 이동시키고 사용한 손가락을 기록
        let buttonPos = buttonPoses[number]!
        if selectedHand == "L" {
            leftThumbPos = buttonPos
        } else {
            rightThumbPos = buttonPos
        }
        answer += selectedHand
    }
    
    return answer
}

struct Position {
    var x: Int
    var y: Int
    
    func manhattanDistance(to: Position) -> Int {
        return abs(x - to.x) + abs(y - to.y)
    }
}

let numbers1 = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
let hands1 = "right"
let result1 = solution(numbers1, hands1)    // "LRLLLRLLRRL"
print(result1)

let numbers2 = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hands2 = "left"
let result2 = solution(numbers2, hands2)    // "LRLLRRLLLRR"
print(result2)

let numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
let hands3 = "right"
let result3 = solution(numbers3, hands3)    // "LLRLLRLLRL"
print(result3)
