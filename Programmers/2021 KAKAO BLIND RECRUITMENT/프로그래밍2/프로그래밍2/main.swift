//
//  main.swift
//  프로그래밍2
//
//  Created by 김수환 on 2020/09/12.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 메뉴 조합별로 주문된 횟수를 셈
    var menuCounts = [String: Int]()
    for order in orders {
        // 가능한 모든 메뉴 조합을 계산
        let possibleMenuCombinations = Array(order)
            .sorted(by: <)
            .combinationsWithoutRepetition
            .filter { $0.count >= 2 }
            .map { String($0) }
        for menuCombination in possibleMenuCombinations {
            if menuCounts[menuCombination] != nil {
                menuCounts[menuCombination]! += 1
            } else {
                menuCounts[menuCombination] = 1
            }
        }
    }
    
    // 두번 이상 주문된 메뉴만 후보에 올림
    menuCounts = menuCounts.filter { $0.value >= 2 }
    
    var answer = [String]()
    for numberOfMenu in course {
        let candidateManus = menuCounts.filter { $0.key.count == numberOfMenu }
        
        // 가장 많이 주문된 메뉴 조합들을 선택
        if let mostMenu = candidateManus.sorted(by: { $0.value > $1.value }).first {
            let mostOrderCount = mostMenu.value
            answer.append(contentsOf: candidateManus.filter { $0.value == mostOrderCount }.map { $0.key })
        }
    }
    
    return answer.sorted(by: <)
}

extension Array {
    var combinationsWithoutRepetition: [[Element]] {
        guard !isEmpty else { return [[]] }
        return Array(self[1...]).combinationsWithoutRepetition.flatMap { [$0, [self[0]] + $0] }
    }
}

let orders1 = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
let orders2 = ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
let orders3 = ["XYZ", "XWY", "WXA"]

let course1 = [2, 3, 4]
let course2 = [2, 3, 5]
let course3 = [2, 3, 4]

print(solution(orders1, course1))  // ["AC", "ACDE", "BCFG", "CDE"]
print(solution(orders2, course2))  // ["ACD", "AD", "ADE", "CD", "XYZ"]
print(solution(orders3, course3))  // ["WX", "XY"]
