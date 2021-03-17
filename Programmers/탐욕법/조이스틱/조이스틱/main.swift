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
    var inputFields = name.map {
        InputField(targetLetter: String($0), hasSet: $0 == "A")
    }
    var totalMoves = 0      // 조이스틱을 조작한 횟수
    var cursorIndex = 0     // 현재 조이스틱 커서의 인덱스
    
    // 모든 알파벳이 입력될때까지 반복
    while !inputFields.allSatisfy({ $0.hasSet }) {
        // 이미 입력한 알파벳을 제외하고, 나머지 알파벳들을 입력할 수 있는 가장 가까운 위치를 찾음
        let (targetIndex, distance) = findClosestInputField(inputFields, cursorIndex: cursorIndex)
        
        // 커서를 이동
        totalMoves += distance
        cursorIndex = targetIndex
        
        // 조이스틱을 가장 적게 움직이는 방법으로 알파벳을 입력
        totalMoves += distanceFromA(to: inputFields[cursorIndex].targetLetter)
        inputFields[cursorIndex].hasSet = true
    }
    
    return totalMoves
}

func distanceFromA(to alphabet: String) -> Int {
    let distanceA = UnicodeScalar(alphabet)!.value - UnicodeScalar("A").value       // ABCD... 순서로 측정한 거리
    let distanceB = UnicodeScalar("Z").value - UnicodeScalar(alphabet)!.value + 1   // AZYX... 순서로 측정한 거리
    
    return Int(min(distanceA, distanceB))
}

func findClosestInputField(_ inputFields: [InputField], cursorIndex: Int) -> (index: Int, distance: Int) {
    var closest = (index: cursorIndex, distance: inputFields.count)
    
    // 오른쪽으로 이동하면서 찾기
    for offset in 0..<inputFields.count {
        let index = mod(cursorIndex + offset, inputFields.count)
        if !inputFields[index].hasSet {
            closest = (index, offset)
            break
        }
    }
    
    // 왼쪽으로 이동하면서 찾기
    for offset in 0..<min(inputFields.count, closest.distance + 1) {
        let index = mod(cursorIndex - offset, inputFields.count)
        if !inputFields[index].hasSet {
            if closest.distance > offset {
                closest = (index, offset)
            }
            break
        }
    }
    
    return closest
}

func mod(_ x: Int, _ m: Int) -> Int {
    return (x % m + m) % m
}

struct InputField {
    let targetLetter: String    // 입력해야할 알파벳
    var hasSet: Bool
}

let name1 = "JEROEN"
let name2 = "JAN"
let name3 = "BBBAAB"
let name4 = "JAZ"

print(solution(name1))  // 56
print(solution(name2))  // 23
print(solution(name3))  // 8
print(solution(name4))  // 11

