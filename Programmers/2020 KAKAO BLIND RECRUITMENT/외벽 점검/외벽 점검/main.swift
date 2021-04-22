//
//  main.swift
//  외벽 점검
//
//  Created by 김수환 on 2021/04/22.
//

import Foundation

func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let dist = dist.sorted(by: >)
    
    for i in dist.indices {
        for j in weak.indices {
            for friends in permutation(Array(dist[...i]), n: i + 1) {
                var flatWeak = weak[j...] + weak[...(j - 1)].map { $0 + n }
                for friend in friends {
                    let startPos = flatWeak.first!
                    flatWeak = flatWeak.drop { friend >= $0 - startPos }
                    if flatWeak.isEmpty {
                        return i + 1
                    }
                }
            }
        }
    }
    
    return -1
}

func permutation(_ arr: [Int], n: Int) -> [[Int]] {
    guard !arr.isEmpty && n > 0 else {
        return [[]]
    }
    
    return arr.indices.flatMap { index -> [[Int]] in
        var subArr = arr
        subArr.remove(at: index)
        return permutation(subArr, n: n - 1).map {
            [arr[index]] + $0
        }
    }
}

let n1 = 12
let n2 = 12
let n3 = 200

let weak1 = [1, 5, 6, 10]
let weak2 = [1, 3, 4, 9, 10]
let weak3 = [0, 10, 50, 80, 120, 160]

let dist1 = [1, 2, 3, 4]
let dist2 = [3, 5, 7]
let dist3 = [1, 10, 5, 40, 30]

print(solution(n1, weak1, dist1))   // 2
print(solution(n2, weak2, dist2))   // 1
print(solution(n3, weak3, dist3))   // 3
