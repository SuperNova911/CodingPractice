//
//  main.swift
//  실패율
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    // 스테이지에 유저가 몇명 있는지 계산
    var userCountByStages = Array(repeating: 0, count: N + 1)
    for stage in stages {
        let stageIndex = stage - 1
        userCountByStages[stageIndex] += 1
    }
    
    // 스테이지에 도달한 유저 수 카운트
    var reachedUsersByStages = Array(repeating: 0, count: N + 1)
    reachedUsersByStages[N] = userCountByStages[N]
    for stage in (1...N).reversed() {
        let stageIndex = stage - 1
        reachedUsersByStages[stageIndex] = userCountByStages[stageIndex] + reachedUsersByStages[stageIndex + 1]
    }
    
    // 스테이지별로 실패율을 계산
    let failureRates = Array<Double>((0..<N).map {
        let passedUsers = reachedUsersByStages[$0]
        let failedUsers = passedUsers - reachedUsersByStages[$0 + 1]
        return Double(failedUsers) / Double(passedUsers)
    })
    
    // 실패율이 높은 스테이지부터 내림차순, 실패율이 같으면 스테이지 순서로 정렬
    return failureRates.enumerated().sorted {
        $0.element == $1.element ? $0.offset < $1.offset : $0.element > $1.element
    }.map { stageIndex, failureRate in
        stageIndex + 1
    }
}

let n1 = 5
let stages1 = [2, 1, 2, 6, 2, 4, 3, 3]
print(solution(n1, stages1))    // [3, 4, 2, 1, 5]

let n2 = 4
let stages2 = [4, 4, 4, 4]
print(solution(n2, stages2))    // [4, 1, 2, 3]
