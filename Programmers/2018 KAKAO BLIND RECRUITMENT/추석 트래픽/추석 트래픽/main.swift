//
//  main.swift
//  추석 트래픽
//
//  Created by 김수환 on 2020/09/27.
//

import Foundation

func solution(_ lines:[String]) -> Int {
    var requestQueue = [(id: Int, time: Int64)]()   // (요청id, 요청 시간)
    var respondQueue = [(id: Int, time: Int64)]()   // (응답id, 응답 시간)
    parseLog(of: lines).forEach { (id, requestTime, respondTime) in
        requestQueue.append((id: id, time: requestTime))
        respondQueue.append((id: id, time: respondTime))
    }
    requestQueue.sort { $0.time < $1.time }
    respondQueue.sort { $0.time < $1.time }
    
    var requestsInLastOneSecond = Set<Int>()    // 마지막 1초간 처리했던 요청들의 id
    var maxThroughputPerSecond = 0  // 초당 최대 처리량
    
    while !requestQueue.isEmpty {
        let nextEventTime = min(requestQueue.first!.time, respondQueue.first!.time + 1000)
        
        // 새 요청이 들어옴
        if requestQueue.first!.time == nextEventTime {
            let startEvent = requestQueue.removeFirst()
            requestsInLastOneSecond.insert(startEvent.id)
        }
        
        // 응답을 완료한지 1초가 지남
        if respondQueue.first!.time + 1000 == nextEventTime {
            let respondEvent = respondQueue.removeFirst()
            requestsInLastOneSecond.remove(respondEvent.id)
        }
        
        maxThroughputPerSecond = max(requestsInLastOneSecond.count, maxThroughputPerSecond)
    }
    
    return maxThroughputPerSecond
}

// 로그 문자열을 파싱, (로그id, 요청 시간, 응답 시간) 밀리초 형식
func parseLog(of logs: [String]) -> [(id: Int, requestTime: Int64, respondTime: Int64)] {
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    
    return logs.enumerated().map { (index, logString) -> (id: Int, startTime: Int64, respondTime: Int64) in
        let respondTimeString = logString[..<logString.index(logString.startIndex, offsetBy: 23)]
        let processTimeString = logString[logString.index(logString.startIndex, offsetBy: 24)..<logString.index(logString.endIndex, offsetBy: -1)]
        
        // 밀리초 단위
        let respondTime = Int64(dateFormatter.date(from: String(respondTimeString))!.timeIntervalSince1970 * 1000)
        let processDuration = Int64(Double(String(processTimeString))! * 1000)
        let requestTime = respondTime - processDuration + 1
        
        return (id: index, startTime: requestTime, respondTime: respondTime)
    }
}

let lines1 = ["2016-09-15 01:00:04.001 2.0s", "2016-09-15 01:00:07.000 2s"]
let lines2 = ["2016-09-15 01:00:04.002 2.0s", "2016-09-15 01:00:07.000 2s"]
let lines3 = ["2016-09-15 20:59:57.421 0.351s", "2016-09-15 20:59:58.233 1.181s", "2016-09-15 20:59:58.299 0.8s", "2016-09-15 20:59:58.688 1.041s", "2016-09-15 20:59:59.591 1.412s", "2016-09-15 21:00:00.464 1.466s", "2016-09-15 21:00:00.741 1.581s", "2016-09-15 21:00:00.748 2.31s", "2016-09-15 21:00:00.966 0.381s", "2016-09-15 21:00:02.066 2.62s"]

print(solution(lines1)) // 1
print(solution(lines2)) // 2
print(solution(lines3)) // 7
