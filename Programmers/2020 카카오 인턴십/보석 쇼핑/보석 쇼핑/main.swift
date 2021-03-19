//
//  main.swift
//  보석 쇼핑
//
//  Created by 김수환 on 2021/03/19.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    let totalGem = Set(gems).count
    var selectedGems = [String: Int]()
    
    var left = 0
    var right = -1
    var minSection: (from: Int, to: Int) = (0, gems.count - 1)
    
    while left < gems.count && right < gems.count {
        // 보석 종류가 부족하면 범위를 늘림
        if selectedGems.count < totalGem {
            right += 1
            if right < gems.count {
                if selectedGems[gems[right]] == nil {
                    selectedGems[gems[right]] = 0
                }
                selectedGems[gems[right]]! += 1
            }
        }
        // 모든 보석 종류를 포함하고 있으면 범위를 줄임
        else {
            selectedGems[gems[left]]! -= 1
            if selectedGems[gems[left]] == 0 {
                selectedGems[gems[left]] = nil
            }
            left += 1
        }
        
        // 모든 보석을 포함하고, 더 짧은 구간을 찾으면 업데이트
        if selectedGems.count == totalGem &&
            right - left < minSection.to - minSection.from {
            minSection = (left, right)
        }
    }
    
    return [minSection.from + 1, minSection.to + 1]
}

let gems1 = ["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]
let gems2 = ["AA", "AB", "AC", "AA", "AC"]
let gems3 = ["XYZ", "XYZ", "XYZ"]
let gems4 = ["ZZZ", "YYY", "NNNN", "YYY", "BBB"]

print(solution(gems1))  // [3, 7]
print(solution(gems2))  // [1, 3]
print(solution(gems3))  // [1, 1]
print(solution(gems4))  // [1, 5]
