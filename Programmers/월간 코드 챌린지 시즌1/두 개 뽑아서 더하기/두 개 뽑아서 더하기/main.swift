//
//  main.swift
//  두 개 뽑아서 더하기
//
//  Created by 김수환 on 2021/03/17.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var generatedNumbers = Set<Int>()
    
    for i in numbers.indices {
        for j in (i + 1)..<numbers.count {
            generatedNumbers.insert(numbers[i] + numbers[j])
        }
    }
    
    return generatedNumbers.sorted(by: <)
}

let numbers1 = [2, 1, 3, 4, 1]
let numbers2 = [5, 0, 2, 7]

print(solution(numbers1))   // [2, 3, 4, 5, 6, 7]
print(solution(numbers2))   // [2, 5, 7, 9, 12]
