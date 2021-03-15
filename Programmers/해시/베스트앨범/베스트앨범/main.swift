//
//  main.swift
//  베스트앨범
//
//  Created by 김수환 on 2021/03/15.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var playByGenre = [String: Int]()   // 장르별 플레이 횟수
    var songByGenre = [String: [(id: Int, play: Int)]]()    // 장르별 플레이된 노래
    
    for (id, (genre, play)) in zip(genres, plays).enumerated() {
        if playByGenre[genre] == nil {
            playByGenre[genre] = 0
        }
        playByGenre[genre]! += play
        
        if songByGenre[genre] == nil {
            songByGenre[genre] = []
        }
        songByGenre[genre]!.append((id: id, play: play))
    }
    
    let albums = playByGenre
        .sorted { $0.value > $1.value }     // 가장 많이 재생된 장르를 먼저 선택
        .flatMap { genre, _ in
            songByGenre[genre]!
                .sorted { $0.play != $1.play    // 가장 많이 재생된 2개의 노래 번호를 선택, 재생 횟수가 같으면 id가 작은 노래 선택
                    ? $0.play > $1.play
                    : $0.id < $1.id }
                .prefix(2)
                .map { $0.id }
        }
    return albums
}

let genres1 = ["classic", "pop", "classic", "classic", "pop"]
let plays1 = [500, 600, 150, 800, 2500]

print(solution(genres1, plays1))    // [4, 1, 3, 0]
