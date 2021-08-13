//
//  main.swift
//  2주차
//
//  Created by 김수환 on 2021/08/13.
//

import Foundation

func solution(_ scores: [[Int]]) -> String {
    scores.indices
        .map { n -> [Int] in
            // n번째 학생의 유효한 점수 구하기
            let receivedScores = scores.map(\.[n])
            return filterValidScores(receivedScores, selfGivenScoreIndex: n)
        }
        .map { Double($0.reduce(0, +)) / Double($0.count) } // 평균 계산
        .map(getGrade)  // 학점으로 변환
        .joined()
}

// 자기 자신에게 준 점수가 유일한 최고 또는 최저점이면 받은 점수에서 제외
func filterValidScores(_ scores: [Int], selfGivenScoreIndex: Int) -> [Int] {
    var scores: [Int] = scores
    
    let selfGivenScore = scores[selfGivenScoreIndex]
    guard checkUnique(for: selfGivenScore, in: scores) else { return scores }
    
    if selfGivenScore == scores.min() || selfGivenScore == scores.max() {
        scores.remove(at: selfGivenScoreIndex)
    }
    return scores
}

func checkUnique(for element: Int, in items: [Int]) -> Bool {
    var equalCount = 0
    for item in items {
        guard equalCount <= 1 else { return false }
        if element == item {
            equalCount += 1
        }
    }
    return equalCount == 1
}

func getGrade(for average: Double) -> String {
    switch average {
    case 90...:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 50..<70:
        return "D"
    case ..<50:
        return "F"
    default:
        fatalError()
    }
}

// MARK: - Test case

let scores1 = [[100, 90, 98, 88, 65], [50, 45, 99, 85, 77], [47, 88, 95, 80, 67], [61, 57, 100, 80, 65], [24, 90, 94, 75, 65]]
let scores2 = [[50, 90], [50, 87]]
let scores3 = [[70, 49, 90], [68, 50, 38], [73, 31, 100]]

assert(solution(scores1) == "FBABD")
assert(solution(scores2) == "DA")
assert(solution(scores3) == "CFD")
