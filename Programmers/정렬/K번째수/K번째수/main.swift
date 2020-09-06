//
//  main.swift
//  K번째수
//
//  Created by 김수환 on 2020/09/06.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    let answers = commands.map { command -> Int in
        let startIndex = command[0] - 1
        let endIndex = command[1] - 1
        let k = command[2] - 1
        
        let sortedSubArray = array[startIndex...endIndex].sorted()
        return sortedSubArray[k]
    }
    
    return answers
}

let array = [1, 5, 2, 6, 3, 7, 4]
let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]
let answer = solution(array, commands)
print(answer)
