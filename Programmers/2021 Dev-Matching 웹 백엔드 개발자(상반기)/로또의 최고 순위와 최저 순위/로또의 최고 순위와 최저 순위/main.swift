//
//  main.swift
//  로또의 최고 순위와 최저 순위
//
//  Created by 김수환 on 2021/08/13.
//

import Foundation

func solution(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    let unknownNumberCount = lottos.filter { $0 == 0 }.count
    
    let matchNumbers = Set(win_nums).intersection(lottos)
    let lowest = min(6, 7 - matchNumbers.count)
    let highest = max(lowest - unknownNumberCount, 1)
    
    return [highest, lowest]
}

let lottos1 = [44, 1, 0, 0, 31, 25]
let lottos2 = [0, 0, 0, 0, 0, 0]
let lottos3 = [45, 4, 35, 20, 3, 9]

let win_nums1 = [31, 10, 45, 1, 6, 19]
let win_nums2 = [38, 19, 20, 40, 15, 25]
let win_nums3 = [20, 9, 3, 45, 4, 35]

assert(solution(lottos1, win_nums1) == [3, 5])
assert(solution(lottos2, win_nums2) == [1, 6])
assert(solution(lottos3, win_nums3) == [1, 1])
