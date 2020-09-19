//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by 김수환 on 2020/09/18.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 1
    
    var totalWeight = 0         // 다리에 올라가 있는 트럭들 무게의 합
    var weightQueue = [Int]()   // 다리에 올라가 있는 트럭들의 무게 큐
    var timeQueue = [Int]()     // 다리에 오른 트럭이 다리를 건너는데 걸리는 시간 큐
    
    for truckWeight in truck_weights {
        // 다리가 트럭의 무게를 견딜 수 있는지 검사
        while totalWeight + truckWeight > weight {
            // 다리 맨 앞에 있는 트럭이 나갈때까지 기다림
            totalWeight -= weightQueue.removeFirst()
            time = timeQueue.removeFirst()
        }
        
        // 맨 앞 트럭이 다리를 지나갔으면 큐에서 제거
        if let eta = timeQueue.first, eta == time {
            totalWeight -= weightQueue.removeFirst()
            timeQueue.removeFirst()
        }
        
        // 다음 트럭을 다리에 오르게 함
        totalWeight += truckWeight
        weightQueue.append(truckWeight)
        timeQueue.append(time + bridge_length)
        time += 1
    }
    
    // 다리에 올라간 마지막 트럭이 건널때까지 기다림
    time = timeQueue.last!
    
    return time
}

let bridge_length1 = 2
let bridge_length2 = 100
let bridge_length3 = 100
let bridge_length4 = 1

let weight1 = 10
let weight2 = 100
let weight3 = 100
let weight4 = 2

let truck_weights1 = [7, 4, 5, 6]
let truck_weights2 = [10]
let truck_weights3 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
let truck_weights4 = [1, 1, 1]

print(solution(bridge_length1, weight1, truck_weights1))    // 8
print(solution(bridge_length2, weight2, truck_weights2))    // 101
print(solution(bridge_length3, weight3, truck_weights3))    // 110
print(solution(bridge_length4, weight4, truck_weights4))
