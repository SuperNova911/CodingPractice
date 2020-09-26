//
//  main.swift
//  압축
//
//  Created by 김수환 on 2020/09/26.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    // 길이가 1인 모든 단어를 포함하도록 사전을 초기화
    var dict = (UnicodeScalar("A").value...UnicodeScalar("Z").value).map { String(UnicodeScalar($0)!) }
    // 사전 색인 번호로 압축된 메시지
    var indexedMessage = [Int]()
    
    var startOffset = 0
    while startOffset < msg.count {
        let startStringIndex = msg.index(msg.startIndex, offsetBy: startOffset)
        var dictIndex = dict.firstIndex(of: String(msg[startStringIndex]))!
        
        // 사전에서 일치하는 가장 긴 문자열의 인덱스를 찾음
        var endOffset = startOffset + 1
        while endOffset < msg.count {
            let endStringIndex = msg.index(msg.startIndex, offsetBy: endOffset)
            let longestMatchString = String(msg[startStringIndex...endStringIndex])
            
            if let possibleDictIndex = dict.firstIndex(of: longestMatchString) {
                dictIndex = possibleDictIndex
                endOffset += 1
            } else {
                // 사전에 없는 단어를 사전에 등록
                dict.append(longestMatchString)
                break
            }
        }
        
        indexedMessage.append(dictIndex + 1)    // dict는 index가 0부터 시작하므로 1을 더해줌
        startOffset = endOffset
    }
    
    return indexedMessage
}

let msg1 = "KAKAO"
let msg2 = "TOBEORNOTTOBEORTOBEORNOT"
let msg3 = "ABABABABABABABAB"

print(solution(msg1))   // [11, 1, 27, 15]
print(solution(msg2))   // [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
print(solution(msg3))   // [1, 2, 27, 29, 28, 31, 30]
