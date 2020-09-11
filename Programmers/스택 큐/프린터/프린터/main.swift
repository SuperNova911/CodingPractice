//
//  main.swift
//  프린터
//
//  Created by 김수환 on 2020/09/10.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var sortedPriorities = priorities.sorted(by: >)
    var printerQueue = Array(priorities.enumerated().map { Document(id: $0, priority: $1) })
    
    var printedDocumentCount = 0    // 현재까지 인쇄된 문서의 수
    while printerQueue.count > 0 {
        let documentToPrint = printerQueue.removeFirst()
        
        // 인쇄할 문서의 중요도가 가장 높으면 인쇄
        if sortedPriorities.first! == documentToPrint.priority {
            sortedPriorities.removeFirst()
            printedDocumentCount += 1
            
            // 인쇄된 문서가 내가 요청한 문서이면 종료
            if documentToPrint.id == location {
                break
            }
        }
        // 중요도가 가장 높지 않으면 프린터 큐의 맨 뒤로 보냄
        else {
            printerQueue.append(documentToPrint)
        }
    }
    
    return printedDocumentCount
}

struct Document {
    let id: Int
    let priority: Int
}

let priorities1 = [2, 1, 3, 2]
let location1 = 2
print(solution(priorities1, location1)) // 1

let priorities2 = [1, 1, 9, 1, 1, 1]
let location2 = 0
print(solution(priorities2, location2)) // 5
