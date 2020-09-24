//
//  main.swift
//  캐시
//
//  Created by 김수환 on 2020/09/24.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    // 캐시가 없으면 항상 miss
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    var cache = Array<String?>(repeating: nil, count: cacheSize)
    var accessTimes = Array(repeating: 0, count: cacheSize)     // 캐시에 접근한 시간
    var time = 0
    
    for city in cities.map({ $0.lowercased() }) {
        if let hitIndex = cache.firstIndex(of: city) {
            // hit
            accessTimes[hitIndex] = time
            time += 1
        } else {
            // miss
            var selectedIndex = cache.firstIndex(of: nil)
            if selectedIndex == nil {
                // 가장 오래전에 사용된 캐시 인덱스를 찾음
                var oldestTime = time
                for (index, accessTime) in accessTimes.enumerated() {
                    if accessTime < oldestTime {
                        oldestTime = accessTime
                        selectedIndex = index
                    }
                }
            }
            
            cache[selectedIndex!] = city
            accessTimes[selectedIndex!] = time
            time += 5
        }
    }
    
    return time
}

let cacheSize1 = 3
let cacheSize2 = 3
let cacheSize3 = 2
let cacheSize4 = 5
let cacheSize5 = 2
let cacheSize6 = 0

let cities1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
let cities2 = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
let cities3 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
let cities4 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
let cities5 = ["Jeju", "Pangyo", "NewYork", "newyork"]
let cities6 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]

print(solution(cacheSize1, cities1))    // 50
print(solution(cacheSize2, cities2))    // 21
print(solution(cacheSize3, cities3))    // 60
print(solution(cacheSize4, cities4))    // 52
print(solution(cacheSize5, cities5))    // 16
print(solution(cacheSize6, cities6))    // 25
