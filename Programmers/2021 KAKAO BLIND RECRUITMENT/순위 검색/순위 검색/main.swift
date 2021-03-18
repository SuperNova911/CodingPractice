//
//  main.swift
//  순위 검색
//
//  Created by 김수환 on 2021/03/18.
//

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var devsByQuery: [String: [Developer]] = [:]
    
    for infoString in info {
        let dev = Developer(infoString)
        
        for languageQuery in [dev.language.rawValue, "-"] {
            for jobQuery in [dev.job.rawValue, "-"] {
                for careerQuery in [dev.career.rawValue, "-"] {
                    for soulFoodQuery in [dev.soulFood.rawValue, "-"] {
                        let query = [languageQuery, jobQuery, careerQuery, soulFoodQuery].joined(separator: " ")
                        if devsByQuery[query] == nil {
                            devsByQuery[query] = []
                        }
                        devsByQuery[query]!.append(dev)
                    }
                }
            }
        }
    }
    
    // 점수를 기준으로 내림차순으로 정렬
    devsByQuery.forEach { (query, dev) in
        devsByQuery[query] = dev.sorted { $0.score > $1.score }
    }
    
    var answers = [Int]()
    for queryString in query {
        let q = Query(queryString)
        
        let devGroupQuery = [q.language?.rawValue ?? "-", q.job?.rawValue ?? "-", q.career?.rawValue ?? "-", q.soulFood?.rawValue ?? "-"]
            .joined(separator: " ")
        let devs = devsByQuery[devGroupQuery] ?? []
        
        // 이진 탐색으로 쿼리의 점수 조건을 만족하지 못하는 첫 번째 개발자의 인덱스를 검색
        var left = 0
        var right = devs.count - 1
        while left <= right {
            let mid = (left + right) / 2
            
            if devs[mid].score >= q.score {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        answers.append(left)
    }
    
    return answers
}

class Developer {
    let language: Language
    let job: Job
    let career: Career
    let soulFood: SoulFood
    let score: Int
    
    init(_ info: String) {
        let components = info.components(separatedBy: .whitespaces)
        
        language = Language(rawValue: components[0])!
        job = Job(rawValue: components[1])!
        career = Career(rawValue: components[2])!
        soulFood = SoulFood(rawValue: components[3])!
        score = Int(components[4])!
    }
}

struct Query {
    let language: Language?
    let job: Job?
    let career: Career?
    let soulFood: SoulFood?
    let score: Int
    
    init(_ query: String) {
        let components = query
            .components(separatedBy: .whitespaces)
            .filter { $0 != "and" }
        
        language = Language(rawValue: components[0])
        job = Job(rawValue: components[1])
        career = Career(rawValue: components[2])
        soulFood = SoulFood(rawValue: components[3])
        score = Int(components[4])!
    }
}

enum Language: String { case cpp, java, python }
enum Job: String { case backend, frontend }
enum Career: String { case junior, senior }
enum SoulFood: String { case chicken, pizza }

let info = ["java backend junior pizza 150", "python frontend senior chicken 210", "python frontend senior chicken 150",
            "cpp backend senior pizza 260", "java backend junior chicken 80", "python backend senior chicken 50"]
let query = ["java and backend and junior and pizza 100",
             "python and frontend and senior and chicken 200",
             "cpp and - and senior and pizza 250",
             "- and backend and senior and - 150",
             "- and - and - and chicken 100",
             "- and - and - and - 150"]

print(solution(info, query))    // [1, 1, 1, 1, 2, 4]
