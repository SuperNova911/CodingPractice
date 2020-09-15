//
//  main.swift
//  조이스틱
//
//  Created by 김수환 on 2020/09/15.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

// TODO: 테스트케이스 통과 실패
func solution(_ name:String) -> Int {
    var inputFields = name.map { InputField(alphabet: String($0)) }
    var totalMoves = 0      // 조이스틱을 조작한 횟수
    var currentIndex = 0    // 현재 조이스틱 커서의 인덱스
    
    // 첫 번째 위치의 알파벳을 맞추고 시작
    totalMoves += distance(to: inputFields[currentIndex].alphabet)
    inputFields[currentIndex].isVisited = true
    
    // 모든 알파벳이 입력될때까지 반복
    while !inputFields.allSatisfy({ $0.isVisited }) {
        // A와 이미 입력한 알파벳을 제외하고, 나머지 알파벳들을 입력할 수 있는 가장 가까운 방향을 검색
        guard let closestDirection = findClosestPath(inputFields: inputFields, index: currentIndex) else {
            // A를 제외한 모든 알파벳이 입력되었으므로 종료
            break
        }
        
        // 커서의 위치를 이동
        currentIndex = closestDirection == Direction.Right ? currentIndex + 1 : currentIndex - 1
        currentIndex = (currentIndex + inputFields.count) % inputFields.count
        totalMoves += 1
        
        // 알파벳이 아직 입력되지 않았으면, 조이스틱을 가장 적게 움직이는 방법으로 알파벳을 입력
        if !inputFields[currentIndex].isVisited {
            totalMoves += distance(to: inputFields[currentIndex].alphabet)
            inputFields[currentIndex].isVisited = true
        }
    }
    
    return totalMoves
}

func distance(to alphabet: String) -> Int {
    let distanceA = UnicodeScalar(alphabet)!.value - UnicodeScalar("A").value       // ABCD... 순서로 측정한 거리
    let distanceB = UnicodeScalar("Z").value - UnicodeScalar(alphabet)!.value + 1   // AZYX... 순서로 측정한 거리
    
    return Int(min(distanceA, distanceB))
}

// A와 이미 입력한 알파벳을 제외하고, 나머지 알파벳들을 입력할 수 있는 가장 가까운 방향을 검색
func findClosestPath(inputFields: [InputField], index: Int) -> Direction? {
    if inputFields.count == 1 {
        return .Right
    }
    
    // 오른쪽과 왼쪽 방향으로 이동할때의 InputField들을 만듬
    let rightDirectionInputFields = inputFields[...(index - 1)] + inputFields[index...]
    let leftDirectionInputFields = rightDirectionInputFields[...index].reversed() + rightDirectionInputFields[(index + 1)...].reversed()
    
    // A가 아니고 아직 입력되지 않은, 가장 멀리있는 알파벳의 거리를 계산
    guard let rightDirectionDistance = rightDirectionInputFields.lastIndex(where: { $0.alphabet != "A" && !$0.isVisited }) else {
        return nil  // A를 제외한 모든 알파벳이 입력됨
    }
    let leftDirectionDistance = leftDirectionInputFields.lastIndex(where: { $0.alphabet != "A" && !$0.isVisited })!
    
    return rightDirectionDistance > leftDirectionDistance ? .Left : .Right
}

struct InputField {
    let alphabet: String    // 입력해야할 알파벳
    var isVisited = false
}

enum Direction {
    case Left, Right
}

let name1 = "JEROEN"
let name2 = "JAN"
let name3 = "BBBAAB"

print(solution(name1))  // 56
print(solution(name2))  // 23
print(solution(name3))  // 8
