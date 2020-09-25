//
//  main.swift
//  오픈채팅방
//
//  Created by 김수환 on 2020/09/25.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    let users = record.filter { !$0.starts(with: "Leave") }
        .reduce(into: [String: String](), { (dict, record) in
            let subStrings = record.components(separatedBy: " ")
            let uid = subStrings[1]
            let name = subStrings[2]
            dict[uid] = name
        })
    
    var messages = [String]()
    for recordString in record {
        let splitedString = recordString.components(separatedBy: " ")
        let command = splitedString[0]
        let uid = splitedString[1]
        
        switch command {
            case "Enter":
                messages.append("\(users[uid]!)님이 들어왔습니다.")
            case "Leave":
                messages.append("\(users[uid]!)님이 나갔습니다.")
            default:
                break
        }
    }
    
    return messages
}

let record1 = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

print(solution(record1))    // ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
