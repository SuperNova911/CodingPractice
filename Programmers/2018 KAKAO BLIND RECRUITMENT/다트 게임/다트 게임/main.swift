//
//  main.swift
//  다트 게임
//
//  Created by 김수환 on 2020/09/09.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    // 다트 결과를 점수|보너스|[옵션]의 구성으로 파싱
    let dartInfos = parseDartInfos(dartResult: dartResult)
    
    var scoreStack = [Int]()
    for dartInfo in dartInfos {
        // 점수를 보너스만큼 제곱
        var score = Int(pow(Double(dartInfo.score), Double(dartInfo.bonus)))
        
        // 옵션이 있으면 처리
        if let option = dartInfo.option {
            switch option {
                case "*":
                    if let previousScore = scoreStack.popLast() {
                        scoreStack.append(previousScore * 2)
                    }
                    score *= 2
                case "#":
                    score *= -1
                default:
                    break
            }
        }
        
        // 최종적으로 계산된 점수를 스택에 넣음
        scoreStack.append(score)
    }
    
    return scoreStack.reduce(0, +)
}

func parseDartInfos(dartResult: String) -> [DartInfo] {
    // "점수|보너스|[옵션]"으로 이루어진 세트로 나눔
    let splitedDartResults = dartResult.matches(regex: "[0-9]+[SDT][*#]?")
    return splitedDartResults.map {
        // 점수, 보너스, 옵션으로 문자열을 나눔
        let dartInfoStrings = $0.matches(regex: "[0-9]+|[SDT]|[*#]")
        let score = Int(dartInfoStrings[0])!
        let bonus: Int
        switch dartInfoStrings[1] {
            case "S":
                bonus = 1
            case "D":
                bonus = 2
            case "T":
                bonus = 3
            default:
                print("Invalid bonus \(dartInfoStrings[1])")
                bonus = 0
                break
        }
        let option = dartInfoStrings.count == 3 ? dartInfoStrings[2] : nil
        
        return DartInfo(score: score, bonus: bonus, option: option)
    }
}

struct DartInfo {
    let score: Int
    let bonus: Int      // S, D, T
    let option: String? // *, #
}

extension String {
    func matches(regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("Invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

let dartResult1 = "1S2D*3T"
print(solution(dartResult1))    // 37

let dartResult2 = "1D2S#10S"
print(solution(dartResult2))    // 9

let dartResult3 = "1D2S0T"
print(solution(dartResult3))    // 3

let dartResult4 = "1S*2T*3S"
print(solution(dartResult4))    // 23

let dartResult5 = "1D#2S*3S"
print(solution(dartResult5))    // 5

let dartResult6 = "1T2D3D#"
print(solution(dartResult6))    // -4

let dartResult7 = "1D2S3T*"
print(solution(dartResult7))    // 59
