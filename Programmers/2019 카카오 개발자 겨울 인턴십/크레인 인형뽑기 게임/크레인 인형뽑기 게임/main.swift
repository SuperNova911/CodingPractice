//
//  main.swift
//  크레인 인형뽑기 게임
//
//  Created by 김수환 on 2020/09/06.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ board: [[Int]], _ moves: [Int]) -> Int {
    
    var itemStack = buildStack(board: board)
    var basket = [Int]()
    var popCount = 0
    
    for cranePos in moves {
        let stackIndex = cranePos - 1
        if let pickedItem = itemStack[stackIndex].popLast() {
            if canPop(basket: basket, item: pickedItem) {
                basket.popLast()
                popCount += 2
            } else {
                basket.append(pickedItem)
            }
        } else {
            continue
        }
    }
    
    return popCount
}

func buildStack(board: [[Int]]) -> [[Int]] {
    var itemStack = Array(repeating: [Int](), count: board.count)
    for items in board.reversed() {
        for (rowIndex, item) in items.enumerated() {
            if (item == 0) {
                continue
            }
            itemStack[rowIndex].append(item)
        }
    }
    return itemStack
}

func canPop(basket: [Int], item: Int) -> Bool {
    if let topItem = basket.last {
        if topItem == item {
            return true
        }
    }
    return false
}
