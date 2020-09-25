//
//  main.swift
//  후보키
//
//  Created by 김수환 on 2020/09/25.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    var candidateKeys = [[Int]]()
    let keys = (0..<relation[0].count).map { $0 }
    
    for cantidateKeySize in 1...keys.count {
        for possibleCandidateKey in keys.combination(r: cantidateKeySize) {
            // 더 작은 candidate key가 포함되어있는지 검사
            guard candidateKeys.first(where: { Set($0).isSubset(of: possibleCandidateKey) }) == nil else {
                continue
            }
            
            // 모든 튜플을 유일하게 식별할 수 있는지 검사
            var uniqueTuples = Set<[String]>()
            for tuple in relation.map({ record in possibleCandidateKey.map { record[$0] }}) {
                guard uniqueTuples.insert(tuple).inserted else {
                    break
                }
            }
            if uniqueTuples.count == relation.count {
                candidateKeys.append(possibleCandidateKey)
            }
        }
    }
    
    return candidateKeys.count
}

extension Array {
    // 서로 다른 n개의 원소에서 r개를 중복없이, 순서에 상관없이 뽑음 (nCr)
    func combination(r: Int) -> [[Element]] {
        guard !isEmpty && r > 0 else {
            return [[]]
        }
        
        return (0...(self.count - r)).flatMap { index -> [[Element]] in
            Array(self[(index + 1)...]).combination(r: r - 1).map { [self[index]] + $0 }
        }
    }
}

let relation1 = [["100", "ryan", "music", "2"], ["200", "apeach", "math", "2"], ["300", "tube", "computer", "3"], ["400", "con", "computer", "4"], ["500", "muzi", "music", "3"], ["600", "apeach", "music", "2"]]

print(solution(relation1))  // 2
