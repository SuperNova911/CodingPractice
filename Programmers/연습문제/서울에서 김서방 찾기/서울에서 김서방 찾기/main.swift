//
//  main.swift
//  서울에서 김서방 찾기
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    let indexOfKim = seoul.firstIndex(of: "Kim")!
    return "김서방은 \(indexOfKim)에 있다"
}

