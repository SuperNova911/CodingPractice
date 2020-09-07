//
//  main.swift
//  체육복
//
//  Created by 김수환 on 2020/09/06.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 여벌 체육복을 가져왔지만 도난 당한 경우를 처리
    let lostStudents = lost.filter { reserve.contains($0) == false }
    let reservedStudents = reserve.filter { lost.contains($0) == false }
    
    var isLosts = Array(repeating: false, count: n)
    for student in lostStudents {
        let index = student - 1
        isLosts[index] = true
    }
    
    // 여벌의 체육복이 있으면 앞 뒤 학생들에게 체육복을 빌려줌
    for reservedStudent in reservedStudents {
        let studentIndex = reservedStudent - 1
        let previousStudentIndex = studentIndex - 1
        let nextStudentIndex = studentIndex + 1
       
        if previousStudentIndex >= 0 && isLosts[previousStudentIndex] {
            isLosts[previousStudentIndex] = false
        } else if nextStudentIndex < n && isLosts[nextStudentIndex] {
            isLosts[nextStudentIndex] = false
        }
    }
    
    return isLosts.filter { $0 == false }.count
}

print(solution(5, [2, 4], [1, 3, 5]))
print(solution(5, [2, 4], [3]))
print(solution(3, [3], [1]))
print(solution(5, [2], [1]))
