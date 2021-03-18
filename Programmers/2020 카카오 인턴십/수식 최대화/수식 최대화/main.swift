//
//  main.swift
//  수식 최대화
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    let elements = expression.matches(regex: #"\d+|[\+\-\*]"#)
    let possiblePriorities = ["+", "-", "*"].permutation(r: 3)
    
    var maxValue = Int64.min
    for priorityTable in possiblePriorities {
        let postfixExpression = convertToPostfixNotation(elements, in: priorityTable)
        maxValue = max(abs(calculateExpression(postfixExpression)), maxValue)
    }
    
    return maxValue
}

func convertToPostfixNotation(_ infixNotation: [String], in priorityTable: [String]) -> [String] {
    var infixNotation = infixNotation
    var postfixExpression = [String]()
    var operators = [String]()
    
    while !infixNotation.isEmpty {
        let element = infixNotation.removeFirst()
        if "+-*".contains(element) {
            while !operators.isEmpty && priorityTable.firstIndex(of: operators.last!)! <= priorityTable.firstIndex(of: element)! {
                postfixExpression.append(operators.removeLast())
            }
            operators.append(element)
        } else {
            postfixExpression.append(element)
        }
    }
    postfixExpression.append(contentsOf: operators.reversed())
    
    return postfixExpression
}

func calculateExpression(_ postfixNotation: [String]) -> Int64 {
    var expression = postfixNotation
    var operands = [Int64]()
    
    while !expression.isEmpty {
        let element = expression.removeFirst()
        if "+-*".contains(element) {
            let rhs = operands.removeLast()
            let lhs = operands.removeLast()
            switch element {
                case "+":
                    operands.append(lhs + rhs)
                case "-":
                    operands.append(lhs - rhs)
                default:
                    operands.append(lhs * rhs)
            }
        } else {
            operands.append(Int64(element)!)
        }
    }
    
    return operands.last!
}

extension String {
    // 정규식으로 매칭된 문자열들을 배열로 반환
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

extension Array {
    // 서로 다른 n개의 원소에서 r개를 중복없이 골라 순서에 상관있게 나열 (nPr)
    func permutation(r: Int) -> [[Element]] {
        guard !isEmpty && r > 0 else {
            return [[]]
        }
        
        return self.indices.flatMap { index -> [[Element]] in
            var subArray = self
            subArray.remove(at: index)
            return subArray.permutation(r: r - 1).map { [self[index]] + $0 }
        }
    }
}

let expression1 = "100-200*300-500+20"
let expression2 = "50*6-3*2"

print(solution(expression1))    // 60420
print(solution(expression2))    // 300
