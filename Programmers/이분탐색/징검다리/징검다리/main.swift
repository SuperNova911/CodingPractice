//
//  main.swift
//  징검다리
//
//  Created by 김수환 on 2021/03/16.
//

import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let rocks = rocks.sorted(by: <)
    
    var maxMinDistance = 0
    var left = 0
    var right = distance
    while left <= right {
        let targetDistance = (left + right) / 2     // 원하는 바위 사이 거리의 최솟값
        var removedRocks = 0
        
        var minDistance = Int.max   // 바위 사이 거리의 최솟값
        var previousRock = 0
        for rock in rocks {
            let distance = rock - previousRock
            
            // 바위 사이의 거리가 목표 거리보다 작으면, 바위를 더 지움
            if distance < targetDistance {
                removedRocks += 1
            }
            else {
                minDistance = min(minDistance, distance)
                previousRock = rock
            }
        }
        
        // 제거한 바위가 너무 많으면, 찾으려는 바위 사이 거리의 최솟값을 줄임
        if removedRocks > n {
            right = targetDistance - 1
        }
        // 바위를 더 지워도 되면, 찾으려는 바위 사이 거리의 최솟값을 늘임
        else {
            maxMinDistance = max(maxMinDistance, minDistance)
            left = targetDistance + 1
        }
    }
    
    return maxMinDistance
}

let distance1 = 25
let rocks1 = [2, 14, 11, 21, 17]
let n1 = 2

print(solution(distance1, rocks1, n1))  // 4
