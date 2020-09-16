//
//  main.swift
//  위장
//
//  Created by 김수환 on 2020/09/16.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    // 해당 부위의 옷을 안 입는 경우도 추가
    let clotheTable = clothes.reduce(into: [String: [String]](), { dict, clothe in
        if dict[clothe[1]] == nil {
            dict[clothe[1]] = ["none"]
        }
        dict[clothe[1]]?.append(clothe[0])
    })
    
    // 아무종류의 옷도 안 입는 경우를 뺌
    return clotheTable.map { $0.value.count }.reduce(1, *) - 1
}

let clothes1 = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
let clothes2 = [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]

print(solution(clothes1))   // 5
print(solution(clothes2))   // 3
