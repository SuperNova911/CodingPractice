//
//  main.swift
//  비밀지도
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    let decodedMap: [String] = zip(arr1, arr2).map {
        let overlappedMap = $0 | $1
        var mapString = ""
        for i in 0..<n {
            let symbol = overlappedMap & (0x1 << i) == 0 ? " " : "#"
            mapString.insert(contentsOf: symbol, at: mapString.startIndex)
        }
        return mapString
    }
    
    return decodedMap
}

let n1 = 5
let arr1_1 = [9, 20, 28, 18, 11]
let arr2_1 = [30, 1, 21, 17, 28]
let result1 = solution(n1, arr1_1, arr2_1)  // ["#####","# # #", "### #", "# ##", "#####"]
print(result1)

let n2 = 6
let arr1_2 = [46, 33, 33 ,22, 31, 50]
let arr2_2 = [27 ,56, 19, 14, 14, 10]
let result2 = solution(n2, arr1_2, arr2_2)  // ["######", "### #", "## ##", " #### ", " #####", "### # "]
print(result2)
