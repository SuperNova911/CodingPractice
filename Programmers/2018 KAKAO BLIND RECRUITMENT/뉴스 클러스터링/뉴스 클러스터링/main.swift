//
//  main.swift
//  뉴스 클러스터링
//
//  Created by 김수환 on 2020/09/22.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let multiset1 = multiset(of: str1)
    let multiset2 = multiset(of: str2)
    
    let numberOfIntersection = multiset1.intersection(multiset2).count
    let numberOfUnions = multiset1.union(multiset2).count
    
    let jaccardSimilarity: Double
    if numberOfUnions == 0 {
        jaccardSimilarity = 1
    } else if numberOfIntersection == 0 {
        jaccardSimilarity = 0
    } else {
        jaccardSimilarity = Double(numberOfIntersection) / Double(numberOfUnions)
    }
    
    return Int(jaccardSimilarity * 65536)
}

func multiset(of string: String) -> Set<String> {
    let elements = (0..<(string.count - 1))
        .map { index in     // 문자열을 두 글자씩 끊어서 다중집합의 원소로 만듬
            string[string.index(string.startIndex, offsetBy: index)...string.index(string.startIndex, offsetBy: index + 1)].lowercased()
        }
        .filter { $0.allSatisfy { $0.isLetter }}    // 기타 공백이나 숫자, 특수 문자가 있는 쌍은 버림
        .reduce(into: [String: Int](), { (dict, element) in     // 중복되는 요소의 개수를 셈
            if dict[element] != nil {
                dict[element]! += 1
            } else {
                dict[element] = 1
            }
        })
        .flatMap { (element, count) in      // 요소의 개수만큼 뒤에 숫자를 붙여서 만듬
            (1...count).map { "\(element)\($0)" }
        }
    
    return Set(elements)
}

let str1_1 = "FRANCE"
let str1_2 = "handshake"
let str1_3 = "aa1+aa2"
let str1_4 = "E=M*C^2"

let str2_1 = "french"
let str2_2 = "shake hands"
let str2_3 = "AAAA12"
let str2_4 = "e=m*c^2"

print(solution(str1_1, str2_1)) // 16384
print(solution(str1_2, str2_2)) // 65536
print(solution(str1_3, str2_3)) // 43690
print(solution(str1_4, str2_4)) // 65536
