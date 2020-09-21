//
//  main.swift
//  소수 만들기
//
//  Created by 김수환 on 2020/09/20.
//

import Foundation

// TODO: combination 함수 만들어서 시도
func solution(_ nums:[Int]) -> Int {
    var numberOfPrimes = 0
    for i in 0...(nums.count - 3) {
        for j in (i + 1)...(nums.count - 2) {
            for k in (j + 1)...(nums.count - 1) {
                if isPrime(nums[i] + nums[j] + nums[k]) {
                    numberOfPrimes += 1
                }
            }
        }
    }
    return numberOfPrimes
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
