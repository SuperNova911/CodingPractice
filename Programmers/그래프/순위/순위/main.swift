//
//  main.swift
//  순위
//
//  Created by 김수환 on 2021/03/16.
//

import Foundation

enum MatchResult {
    case unknown, win, lose
}

func solution(_ n: Int, _ results: [[Int]]) -> Int {
    var matches = [[MatchResult]](repeating: [MatchResult](repeating: .unknown, count: n), count: n)
    
    for (winner, loser) in results.map({ ($0[0] - 1, $0[1] - 1) }) {
        matches[winner][loser] = .win
        matches[loser][winner] = .lose
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if i == j || matches[k][j] == .unknown {
                    continue
                }
                
                // i -> k, k -> j 의 매치 결과가 같으면, i -> j 의 매치 결과를 업데이트
                if matches[i][k] == matches[k][j] {
                    matches[i][j] = matches[i][k]
                }
            }
        }
    }
    
    var answer = 0
    for i in 0..<n {
        // i 번째 선수와 다른 모든 선수와의 경기 결과를 결정 지을 수 있는지 체크
        var determinable = true
        for j in 0..<n {
            if i == j { continue }
            if matches[i][j] == .unknown {
                determinable = false
                break
            }
        }
        answer += determinable ? 1 : 0
    }
    
    return answer
}

let n1 = 5

let results1 = [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]

print(solution(n1, results1))   // 2
