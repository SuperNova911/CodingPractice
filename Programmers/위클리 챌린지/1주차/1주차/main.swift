//
//  main.swift
//  1주차
//
//  Created by 김수환 on 2021/08/13.
//

import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let sum = (count + 1) * count / 2
    let totalPrice = Int64(price) * Int64(sum)
    return max(totalPrice - Int64(money), 0)
}
