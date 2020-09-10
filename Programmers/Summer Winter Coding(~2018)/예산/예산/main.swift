//
//  main.swift
//  예산
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var supportableDepartments = 0
    var remainBudget = budget
    for requestBudget in d.sorted(by: <) {
        if requestBudget <= remainBudget {
            remainBudget -= requestBudget
            supportableDepartments += 1
        } else {
            break
        }
    }
    
    return supportableDepartments
}

let d1 = [1, 3, 2, 5, 4]
let budget1 = 9
print(solution(d1, budget1))    // 3

let d2 = [2, 2, 3, 3]
let budget2 = 10
print(solution(d2, budget2))    // 4
