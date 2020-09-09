//
//  main.swift
//  핸드폰 번호 가리기
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ phone_number:String) -> String {
    return String(repeating: "*", count: phone_number.count - 4) + phone_number.suffix(4)
}

let phoneNumber1 = "01033334444"
print(solution(phoneNumber1))   // "*******4444"

let phoneNumber2 = "027778888"
print(solution(phoneNumber2))   // "*****8888"
