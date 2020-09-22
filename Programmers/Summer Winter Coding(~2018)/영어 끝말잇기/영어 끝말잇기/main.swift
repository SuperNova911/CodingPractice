//
//  main.swift
//  영어 끝말잇기
//
//  Created by 김수환 on 2020/09/22.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordHistory = Set<String>() // 사람들이 사용한 단어 히스토리
    var lastLetter: Character?  // 마지막 사람이 말한 단어의 마지막 문자
    
    for (index, word) in words.enumerated() {
        let currentPlayer = index % n + 1
        let currentRound = index / n + 1
        
        // 앞사람이 말한 단어의 마지막 문자로 시작하는 단어를 말해야함
        if lastLetter != nil && word.first! != lastLetter! {
            return [currentPlayer, currentRound]
        }
        
        // 이전에 등장했던 단어는 사용할 수 없음
        guard wordHistory.insert(word).inserted else {
            return [currentPlayer, currentRound]
        }
        
        lastLetter = word.last
    }
    
    // 탈락자가 생기지 않음
    return [0, 0]
}

let n1 = 3
let n2 = 5
let n3 = 2

let words1 = ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]
let words2 = ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]
let words3 = ["hello", "one", "even", "never", "now", "world", "draw"]

print(solution(n1, words1)) // [3, 3]
print(solution(n2, words2)) // [0, 0]
print(solution(n3, words3)) // [1, 3]
