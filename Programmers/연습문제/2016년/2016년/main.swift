//
//  main.swift
//  2016년
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let daysPerMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];    // 2016년은 윤년이기 때문에 2월은 29일까지
    let dayStrings = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"];     // 1월 1일은 금요일
    
    let monthIndex = a - 1
    let totalDays = daysPerMonth[0..<monthIndex].reduce(0, +) + b
    
    return dayStrings[totalDays % dayStrings.count]
}

let a = 2
let b = 29
let result = solution(a, b) // "TUE"
print(result)
