//
//  main.swift
//  쿼드압축 후 개수 세기
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let answer = quadCompress(arr, from: (0, 0), size: arr.count)
    return [answer.total0, answer.total1]
}

// DFS
func quadCompress(_ arr: [[Int]], from: (x: Int, y: Int), size: Int) -> (total0: Int, total1: Int) {
    // 영역을 대표 하는 값
    let representValue = arr[from.x][from.y]
    
    for xOffset in 0..<size {
        for yOffset in 0..<size {
            // 영역에 대푯값과 다른 값이 있으면 영역을 4조각으로 나눔
            if arr[from.x + xOffset][from.y + yOffset] != representValue {
                let newSize = size / 2
                
                // 영역을 분할시켜 얻은 결과값을 종합해서 반환
                return [quadCompress(arr, from: (from.x,           from.y          ), size: newSize),   // 왼쪽 위
                        quadCompress(arr, from: (from.x + newSize, from.y          ), size: newSize),   // 오른쪽 위
                        quadCompress(arr, from: (from.x,           from.y + newSize), size: newSize),   // 왼쪽 아래
                        quadCompress(arr, from: (from.x + newSize, from.y + newSize), size: newSize)]   // 오른쪽 아래
                    .reduce((total0: 0, total1: 0)) {
                        ($0.total0 + $1.total0, $0.total1 + $1.total1)
                    }
            }
        }
    }
    
    return representValue == 0 ? (1, 0) : (0, 1)
}

let arr1 = [[1, 1, 0, 0],
            [1, 0, 0, 0],
            [1, 0, 0, 1],
            [1, 1, 1, 1]]
let arr2 = [[1, 1, 1, 1, 1, 1, 1, 1],
            [0, 1, 1, 1, 1, 1, 1, 1],
            [0, 0, 0, 0, 1, 1, 1, 1],
            [0, 1, 0, 0, 1, 1, 1, 1],
            [0, 0, 0, 0, 0, 0, 1, 1],
            [0, 0, 0, 0, 0, 0, 0, 1],
            [0, 0, 0, 0, 1, 0, 0, 1],
            [0, 0, 0, 0, 1, 1, 1, 1]]

print(solution(arr1))   // [4,  9]
print(solution(arr2))   // [10,  15]
