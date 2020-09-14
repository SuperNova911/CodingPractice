//
//  main.swift
//  프로그래밍1
//
//  Created by 김수환 on 2020/09/12.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ new_id:String) -> String {
    var recommendId = new_id
    
    // 대문자를 소문자로 치환
    recommendId = recommendId.lowercased()
    
    // 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거
    recommendId = recommendId.filter { $0.isLowercase || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "." }
    
    // 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환
    var previousLetter = ""
    for index in (0..<recommendId.count).reversed() {
        let stringIndex = recommendId.index(recommendId.startIndex, offsetBy: index)
        if recommendId[stringIndex] == "." && previousLetter == "." {
            let removeIndex = recommendId.index(recommendId.startIndex, offsetBy: index)
            recommendId.remove(at: removeIndex)
        }
        
        previousLetter = String(recommendId[stringIndex])
    }
    
    // 마침표(.)가 처음이나 끝에 위치한다면 제거
    if let firstLetter = recommendId.first, firstLetter == "." {
        recommendId.removeFirst()
    }
    if let lastLetter = recommendId.last, lastLetter == "." {
        recommendId.removeLast()
    }
    
    // 빈 문자열이라면, "a"를 대입
    if recommendId.isEmpty {
        recommendId = "a"
    }
    
    // 길이가 16자 이상이면, 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거
    let endIndex = recommendId.index(recommendId.startIndex, offsetBy: min(recommendId.count - 1, 15 - 1))
    recommendId = String(recommendId[...endIndex])
    // 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거
    if let lastLetter = recommendId.last, lastLetter == "." {
        recommendId.removeLast()
    }
    
    // 길이가 2자 이하라면, 마지막 문자를 길이가 3이 될 때까지 반복해서 끝에 붙임
    if recommendId.count <= 2 {
        recommendId += String(repeating: recommendId.last!, count: 3 - recommendId.count)
    }
    
    return recommendId
}

let new_id1 = "...!@BaT#*..y.abcdefghijklm"
let new_id2 = "z-+.^."
let new_id3 = "=.="
let new_id4 = "123_.def"
let new_id5 = "abcdefghijklmn.p"

print(solution(new_id1))    // "bat.y.abcdefghi"
print(solution(new_id2))    // "z--"
print(solution(new_id3))    // "aaa"
print(solution(new_id4))    // "123_.def"
print(solution(new_id5))    // "abcdefghijklmn"
