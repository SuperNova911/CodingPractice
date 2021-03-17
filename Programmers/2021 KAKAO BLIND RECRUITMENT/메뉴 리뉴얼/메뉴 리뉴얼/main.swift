//
//  main.swift
//  메뉴 리뉴얼
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 세트메뉴별 주문 횟수
    var orderCountBySetMenu = [String: Int]()
    
    for order in orders {
        // 손님이 주문한 메뉴들로 주문 가능한 세트메뉴의 조합을 만듦
        // "스카피"가 추가하고 싶어하는 메뉴의 개수만 선택
        let possibleSetMenu = Array(order)
            .allCombinations()
            .filter { course.contains($0.count) }
            .map { String($0.sorted(by: <)) }
        
        // 세트메뉴의 주문 횟수를 카운트
        for setMenu in possibleSetMenu {
            if orderCountBySetMenu[setMenu] == nil {
                orderCountBySetMenu[setMenu] = 0
            }
            orderCountBySetMenu[setMenu]! += 1
        }
    }
    
    var renewedSetMenus = [String]()
    for numberOfMenu in course {
        // "스카피"가 추가하고 싶어하는 메뉴의 개수에 해당하는 세트 메뉴들을 선택
        // 최소 2번 이상 주문된 세트메뉴만 선택
        let setMenus = orderCountBySetMenu
            .filter { $0.value >= 2 && $0.key.count == numberOfMenu }
            
        // 세트메뉴들 중 가장 많이 주문된 횟수를 선택
        if let bestSellingSetMenuCount = setMenus.sorted(by: { $0.value > $1.value}).first?.value {
            // 리뉴얼 메뉴 목록에 추가
            let newSetMenus = setMenus
                .filter { $0.value == bestSellingSetMenuCount }
                .map { $0.key }
            renewedSetMenus.append(contentsOf: newSetMenus)
        }
    }
        
    return renewedSetMenus.sorted(by: <)
}

extension Array {
    // 서로 다른 n개의 원소에서 0~n개를 중복없이, 순서에 상관없이 뽑음
    func allCombinations() -> [[Element]] {
        guard !isEmpty else {
            return [[]]
        }
        
        return Array(self[1...]).allCombinations().flatMap { [$0, [self[0]] + $0] }
    }
}
