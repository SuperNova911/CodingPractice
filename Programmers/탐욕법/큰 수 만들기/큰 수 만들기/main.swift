//
//  main.swift
//  큰 수 만들기
//
//  Created by 김수환 on 2020/09/12.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var answer = ""
    var removeCount = k     // k번 숫자를 지움
    for n in number {
        // 이전에 넣은 숫자가 지금 숫자보다 작으면 지움
        // 지워야 하는 횟수를 다 채웠으면 지우지 않음
        while !answer.isEmpty && n > answer.last! && removeCount > 0 {
            answer.removeLast()
            removeCount -= 1
        }
        answer.append(n)
    }
    
    return String(answer.prefix(number.count - k))
}

let numbers1 = "11111"
let numbers2 = "1231234"
let numbers3 = "4177252841"
let numbers4 = "543111"

let k1 = 2
let k2 = 3
let k3 = 4
let k4 = 2

print(solution(numbers1, k1))   // "94"
print(solution(numbers2, k2))   // "3234"
print(solution(numbers3, k3))   // "775841"
print(solution(numbers4, k4))
