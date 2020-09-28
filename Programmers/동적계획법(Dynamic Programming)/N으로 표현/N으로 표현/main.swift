//
//  main.swift
//  N으로 표현
//
//  Created by 김수환 on 2020/09/28.
//

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {
        return 1
    }
    
    // 1~8번 인덱스만 사용
    var possibleNumbers = Array(repeating: Set<Int>(), count: 8 + 1)
    possibleNumbers[1].insert(N)
    
    for numberOfN in 2...8 {
        // N을 numberOfN개만큼 반복한 숫자
        let numberOnlyN = Int(String(repeating: String(N), count: numberOfN))!
        possibleNumbers[numberOfN].insert(numberOnlyN)
        
        for i in 1..<numberOfN {
            possibleNumbers[i].forEach { leftNumber in
                possibleNumbers[numberOfN - i].forEach { rightNumber  in
                    var newNumbers = [leftNumber + rightNumber, leftNumber - rightNumber, leftNumber * rightNumber]
                    if rightNumber != 0 {
                        newNumbers.append(leftNumber / rightNumber)
                    }
                    possibleNumbers[numberOfN].formUnion(newNumbers)
                }
            }
            
            // 원하는 숫자를 표현할 수 있는지 확인
            if possibleNumbers[numberOfN].contains(number) {
                return numberOfN
            }
        }
    }
    
    return -1
}

let N1 = 5
let N2 = 2

let number1 = 12
let number2 = 11

print(solution(N1, number1))    // 4
print(solution(N2, number2))    // 3
print(solution(1, 1121))    // 7
1111 + 11 - 1
