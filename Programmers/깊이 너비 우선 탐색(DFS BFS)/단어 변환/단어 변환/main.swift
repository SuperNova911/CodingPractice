//
//  main.swift
//  단어 변환
//
//  Created by 김수환 on 2020/10/01.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var bfsQueue = [[begin]]
    while !bfsQueue.isEmpty {
        // 다음 단계로 변환할 수 있는 단어들을 선택
        let currentConversion = bfsQueue.removeFirst()
        let convertibleWords = words.filter { !currentConversion.contains($0) && canConvert(from: currentConversion.last!, to: $0) }
        
        // 다음 단어에 target이 포함되어 있는지 검사
        if convertibleWords.contains(target) {
            return currentConversion.count
        }
        
        bfsQueue.append(contentsOf: convertibleWords.map { currentConversion + [$0] })
    }
    
    return 0
}

func canConvert(from: String, to: String) -> Bool {
    var difference = 0
    for (a, b) in zip(from, to) {
        if a == b {
            continue
        }
        difference += 1
        if difference > 1 {
            return false
        }
    }
    return true
}

let begin1 = "hit"
let begin2 = "hit"

let target1 = "cog"
let target2 = "cog"

let words1 = ["hot", "dot", "dog", "lot", "log", "cog"]
let words2 = ["hot", "dot", "dog", "lot", "log"]

print(solution(begin1, target1, words1))    // 4
print(solution(begin2, target2, words2))    // 0
