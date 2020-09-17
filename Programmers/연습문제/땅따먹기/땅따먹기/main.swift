//
//  main.swift
//  땅따먹기
//
//  Created by 김수환 on 2020/09/17.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ land:[[Int]]) -> Int{
    // 동적 계획법으로 얻을 수 있는 최대 점수를 누적해서 계산
    var possibleMaxScore = [land[0]] + Array(repeating: Array(repeating: 0, count: land[0].count), count: land.count - 1)
    for row in 1..<land.count {
        // 효율성 테스트 때문에 첫 번째와 두 번째로 큰 수를 미리 구함
        var temp = possibleMaxScore[row - 1]
        let firstMax = temp.enumerated().max(by: { $0.element < $1.element })!
        temp.remove(at: firstMax.offset)
        let secondMaxScore = temp.max(by: <)!
        
        for column in 0..<land[row].count {
            // 이전의 최고 점수를 얻을 수 있던 칸과 같은 열이면 두 번쨰로 큰 점수를 선택
            // 열이 다르면 첫 번째로 큰 점수를 선택
            possibleMaxScore[row][column] = column != firstMax.offset
                ? land[row][column] + firstMax.element
                : land[row][column] + secondMaxScore
        }
    }
    
    // 마지막칸에서 나올 수 있는 최대 점수를 반환
    return possibleMaxScore.last!.max()!
}

let land1 = [[1, 2, 3, 5], [5, 6, 7, 8], [4, 3, 2, 1]]

print(solution(land1))  // 16
