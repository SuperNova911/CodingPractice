//
//  main.swift
//  모의고사
//
//  Created by 김수환 on 2020/09/06.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var students = [student(id: 1, guessTable: [1, 2, 3, 4, 5]),
                    student(id: 2, guessTable: [2, 1, 2, 3, 2, 4, 2, 5]),
                    student(id: 3, guessTable: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5])]
    
    for (questionIndex, answer) in answers.enumerated() {
        for studentIndex in 0..<students.count {
            // 학생이 예상한 답이 맞으면 점수 추가
            let guessedAnswer = students[studentIndex].guessAnswer(for: questionIndex)
            if (guessedAnswer == answer) {
                students[studentIndex].score += 1
            }
        }
    }
    
    // .sorted 메서드는 안정 정렬(stable sort)를 보장하지 않기 떄문에 이렇게 구현
    let topScore = students.map { student in student.score }.max()!
    let mostAnsweredStudents = students
        .filter { student in student.score == topScore }
    
    return mostAnsweredStudents.map { student in student.id }
}

struct student {
    let id: Int
    let guessTable: [Int]
    var score = 0
    
    func guessAnswer(for questionIndex: Int) -> Int {
        guessTable[questionIndex % guessTable.count]
    }
}

let answers1 = [1, 2, 3, 4 ,5]
let return1 = solution(answers1)
print(return1)

let answers2 = [1, 3, 2, 4, 2]
let return2 = solution(answers2)
print(return2)
