//
//  main.swift
//  소수 찾기 Level2
//
//  Created by 김수환 on 2020/09/11.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ numbers:String) -> Int {
    // 만들어질 수 있는 숫자들
    let possibleNumbers = Set(combination(of: numbers.map { String($0) }).compactMap { Int($0) })
    return possibleNumbers.filter { isPrime($0) }.count
}

func combination(of array: [String]) -> [String] {
    guard !array.isEmpty else {
        return []
    }
    
    return array.indices.flatMap { index -> [String] in
        var subArray = array
        let element = subArray.remove(at: index)
        return [element] + combination(of: subArray).map { element + $0 }
    }
}

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    }
    
    for divisor in 2..<number {
        if number % divisor == 0 {
            return false
        }
    }
    return true
}

let numbers1 = "17"
let numbers2 = "011"

print(solution(numbers1))   // 3
print(solution(numbers2))   // 2
