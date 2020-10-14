//
//  main.swift
//  입국심사
//
//  Created by 김수환 on 2020/10/15.
//

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var maxTakesTime = Int64(times.max()!) * Int64(n)
    var minTakesTime = Int64(1)
    
    var shortestTakesTime = maxTakesTime
    
    // n명을 검사하는데 필요한 가장 짧은 시간을 찾을때가지 반복
    while maxTakesTime - minTakesTime >= 0 {
        let givenTime = (maxTakesTime + minTakesTime) / 2
        let throughputPerExaminer = times.map { givenTime / Int64($0) }   // 심사관별 주어진 시간동안 심사할 수 있는 사람 수
        let totalPeople = throughputPerExaminer.reduce(0, +)    // 주어진 시간동안 심사를 받은 사람의 수
        
        if totalPeople >= n {
            shortestTakesTime = givenTime
            maxTakesTime = givenTime - 1
        } else {
            minTakesTime = givenTime + 1
        }
    }
    
    return shortestTakesTime
}

let n1 = 6
let n2 = 1
let n3 = 3

let times1 = [7, 10]
let times2 = [5, 10]
let times3 = [1, 2]

print(solution(n1, times1)) // 28
print(solution(n2, times2)) // 5
print(solution(n3, times3)) // 2
