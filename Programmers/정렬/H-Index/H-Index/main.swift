//
//  main.swift
//  H-Index
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    var hIndex = 0
    for (index, citation) in citations.sorted(by: >).enumerated() {
        if citation >= index + 1 {
            hIndex = index + 1
        }
    }
    return hIndex
}

let citations1 = [3, 0, 6, 1, 5]

print(solution(citations1)) // 3
