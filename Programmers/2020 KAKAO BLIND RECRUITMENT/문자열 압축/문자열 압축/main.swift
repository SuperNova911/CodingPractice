//
//  main.swift
//  문자열 압축
//
//  Created by 김수환 on 2020/09/10.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ s:String) -> Int {
    var shortestCompressionLength = s.count
    for sliceLength in 1..<s.count {
        let slicedString = s.split(by: sliceLength)     // 일정한 길이로 문자열을 자름
        var compressedString = ""
        
        var previousPattern = slicedString.first!
        var numberOfPatterns = 0    // 같은 패턴 반복 횟수
        
        for slicedString in slicedString {
            // 지금까지 압축된 문자열이 다른 압축방법보다 길이가 길면 중단
            if compressedString.count + slicedString.count >= shortestCompressionLength {
                break
            }
            
            // 바로 이전의 패턴과 문자열이 같으면 압축
            if slicedString == previousPattern {
                numberOfPatterns += 1
            }
            else {
                // 이전 패턴을 압축시켜서 기록
                compressedString += (numberOfPatterns > 1 ? "\(numberOfPatterns)" : "") + previousPattern
                
                previousPattern = slicedString
                numberOfPatterns = 1
            }
        }
        // 마지막으로 등장한 패턴을 압축해서 기록
        compressedString += (numberOfPatterns > 1 ? "\(numberOfPatterns)" : "") + previousPattern
        
        shortestCompressionLength = min(compressedString.count, shortestCompressionLength)
    }
    
    return shortestCompressionLength
    
}

extension String {
    // 문자열을 정해진 길이만큼 자른후 배열으로 반환
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
}

let s1 = "aabbaccc"
let s2 = "ababcdcdababcdcd"
let s3 = "abcabcdede"
let s4 = "abcabcabcabcdededededede"
let s5 = "xababcdcdababcdcd"

print(solution(s1)) // 7
print(solution(s2)) // 9
print(solution(s3)) // 8
print(solution(s4)) // 14
print(solution(s5)) // 17

