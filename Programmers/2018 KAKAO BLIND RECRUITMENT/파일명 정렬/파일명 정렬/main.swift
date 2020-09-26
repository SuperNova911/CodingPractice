//
//  main.swift
//  파일명 정렬
//
//  Created by 김수환 on 2020/09/26.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    return files.enumerated()
        // 파일 이름을 head, number, tail로 나누고 원래 순서와 이름을 저장
        .map { (index, name) -> FileName in
            let splitedName = name.matches(regex: "\\D+|\\d+")
            return FileName(id: index,
                            originName: name,
                            head: splitedName[0].lowercased(),
                            number: Int(splitedName[1])!,
                            tail: splitedName.count == 3 ? splitedName[2] : nil)
        }
        // 파일 이름을 정렬
        .sorted(by: {
            // HEAD를 기준으로 사전 순서로 정렬
            if $0.head != $1.head {
                return $0.head < $1.head
            } else {
                // HEAD가 같을 경우 NUMBER의 숫자 순으로 정렬
                if $0.number != $1.number {
                    return $0.number < $1.number
                } else {
                    // HEAD 부분과, NUMBER의 숫자도 같을 경우, 원래 입력에 주어진 순서를 유지
                    return $0.id < $1.id
                }
            }
        })
        // 원래 파일 이름을 반환
        .map { $0.originName }
}

struct FileName
{
    let id: Int
    let originName: String
    let head: String
    let number: Int
    let tail: String?
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

let files1 = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
let files2 = ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]

print(solution(files1)) // ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
print(solution(files2)) // ["A-10 Thunderbolt II"," B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]
