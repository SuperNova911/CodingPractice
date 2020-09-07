//
//  main.swift
//  문자열 다루기 기본
//
//  Created by 김수환 on 2020/09/07.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Bool {
    if s.count != 4 && s.count != 6 {
        return false
    }
    return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: s))
}
