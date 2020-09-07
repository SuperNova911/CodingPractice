//
//  main.swift
//  자릿수 더하기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int) -> Int
{
    return String(n).map { Int(String($0))! }.reduce(0, +)
}
