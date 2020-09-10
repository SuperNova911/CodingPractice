//
//  main.swift
//  직사각형 별찍기
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

let input = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (n, m) = (input[0], input[1])

let stars = String(repeating: "*", count: n)
for _ in 0..<m {
    print(stars)
}
