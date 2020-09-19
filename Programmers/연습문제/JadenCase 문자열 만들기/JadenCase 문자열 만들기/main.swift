//
//  main.swift
//  JadenCase 문자열 만들기
//
//  Created by 김수환 on 2020/09/19.
//

import Foundation

func solution(_ s:String) -> String {
    var isFirstLetter = true
    var convertedString = ""
    for character in s {
        if character == " " {
            convertedString.append(character)
            isFirstLetter = true
        } else {
            convertedString += isFirstLetter ? character.uppercased() : character.lowercased()
            isFirstLetter = false
        }
    }
    return convertedString
}

let s1 = "3people unFollowed me"
let s2 = "for the last week"

print(solution(s1)) // "3people Unfollowed Me"
print(solution(s2)) // "For The Last Week"
