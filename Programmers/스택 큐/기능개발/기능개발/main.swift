//
//  main.swift
//  기능개발
//
//  Created by 김수환 on 2020/09/18.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progressQueue = progresses
    var speedQueue = speeds
    var day = 0
    var answer = [Int]()
    
    while !progressQueue.isEmpty {
        // 큐의 첫 번째 기능이 준비될 때까지 날짜를 이동
        day = Int(ceil(Double(100 - progressQueue.first!) / Double(speedQueue.first!)))
        
        var releases = 0    // 오늘 배포되는 기능의 개수
        repeat {
            progressQueue.removeFirst()
            speedQueue.removeFirst()
            releases += 1
        } while !progressQueue.isEmpty && progressQueue.first! + speedQueue.first! * day >= 100     // 큐의 첫 번째 기능의 개발이 완료되었는지 검사
        
        answer.append(releases)
    }
    
    return answer
}

let progresses1 = [93, 30, 55]
let progresses2 = [95, 90, 99, 99, 80, 99]

let speeds1 = [1, 30, 5]
let speeds2 = [1, 1, 1, 1, 1, 1]

print(solution(progresses1, speeds1))   // [2, 1]
print(solution(progresses2, speeds2))   // [1, 3, 2]
