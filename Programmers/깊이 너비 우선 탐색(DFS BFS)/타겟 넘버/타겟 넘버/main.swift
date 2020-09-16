//
//  main.swift
//  타겟 넘버
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

var numberArray = [Int]()
var targetValue = 0
var answer = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    numberArray = numbers
    targetValue = target
    answer = 0
    
    dfs(index: 0, previousValue: 0)
    
    return answer
}

func dfs(index: Int, previousValue: Int) {
    if index + 1 == numberArray.count {
        if previousValue + numberArray[index]  == targetValue {
            answer += 1
        }
        if previousValue - numberArray[index] == targetValue {
            answer += 1
        }
    } else {
        // +
        dfs(index: index + 1, previousValue: previousValue + numberArray[index] )
        
        // -
        dfs(index: index + 1, previousValue: previousValue - numberArray[index] )
    }
}

let numbers1 = [1, 1, 1, 1, 1]

let target1 = 3

print(solution(numbers1, target1))  // 5
