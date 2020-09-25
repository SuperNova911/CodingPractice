//
//  main.swift
//  방금그곡
//
//  Created by 김수환 on 2020/09/25.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let melody = parseMelody(m).reduce("", +)
    var matchedMusicInfos = [MusicInfo]()
    
    for musicInfo in parseMusicInfos(of: musicinfos) {
        let totalMelodies = (0..<musicInfo.playedTime)
            .map({ musicInfo.melodies[$0 % musicInfo.melodies.count] })
            .reduce("", +)
        if totalMelodies.contains(melody) {
            matchedMusicInfos.append(musicInfo)
        }
    }
    
    // 재생 시간으로 정렬, 재생 시간이 같으면 먼저 입력된 순서로 정렬
    // 조건이 일치하는 음악이 없을 때에는 (None)을 반환
    return matchedMusicInfos.sorted(by: {
        $0.playedTime == $1.playedTime ? $0.id < $1.id : $0.playedTime > $1.playedTime
    }).first?.title ?? "(None)"
}

func parseMusicInfos(of musicInfos: [String]) -> [MusicInfo] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    return musicInfos.enumerated().map { (index, infoString) in
        let splitedInfo = infoString.components(separatedBy: ",")
        let startDate = dateFormatter.date(from: splitedInfo[0])!
        let endDate = dateFormatter.date(from: splitedInfo[1])!
        let playedTime = Int(endDate.timeIntervalSince(startDate) / 60)
        let title = splitedInfo[2]
        let melodies = parseMelody(splitedInfo[3])
        return MusicInfo(id: index, title: title, playedTime: playedTime, melodies: melodies)
    }
}

func parseMelody(_ melodyString: String) -> [String] {
    return melodyString.matches(regex: "[A-G]#?")
        .map { $0.count == 1 ? $0.lowercased() : $0 }   // #이 안붙은 음은 소문자, #이 붙은 음은 대문자로 표현
}

struct MusicInfo {
    let id: Int
    let title: String
    let playedTime: Int
    let melodies: [String]
}

extension String {
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

let m1 = "ABCDEFG"
let m2 = "CC#BCC#BCC#BCC#B"
let m3 = "ABC"

let musicinfos1 = ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]
let musicinfos2 = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]
let musicinfos3 = ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]

print(solution(m1, musicinfos1))    // "HELLO"
print(solution(m2, musicinfos2))    // "FOO"
print(solution(m3, musicinfos3))    // "WORLD"
