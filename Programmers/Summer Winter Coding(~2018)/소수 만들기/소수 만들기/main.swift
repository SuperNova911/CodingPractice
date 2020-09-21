//
//  main.swift
//  소수 만들기
//
//  Created by 김수환 on 2020/09/20.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    return nums.combination(r: 3)
        .filter { isPrime($0.reduce(0, +)) }
        .count
}

extension Array {
    // 서로 다른 n개의 원소에서 r개를 중복없이, 순서에 상관없이 뽑음 (nCr)
    func combination(r: Int) -> [[Element]] {
        guard !isEmpty && r > 0 else {
            return [[]]
        }
        
        return (0...(self.count - r)).flatMap { index -> [[Element]] in
            Array(self[(index + 1)...]).combination(r: r - 1).map { [self[index]] + $0 }
        }
    }
}

func isPrime(_ number: Int) -> Bool {
    guard number > 2 else {
        return false
    }
    for divisor in 2...Int(ceil(Double(number) / 2)) {
        if number % divisor == 0 {
            return false
        }
    }
    return true
}

let nums1 = [1, 2, 3, 4]
let nums2 = [1, 2, 7, 6, 4]

print(solution(nums1))  // 1
print(solution(nums2))  // 4
