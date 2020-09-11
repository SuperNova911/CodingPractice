//
//  main.swift
//  스킬트리
//
//  Created by 김수환 on 2020/09/10.
//  Copyright © 2020 Suwhan Kim. All rights reserved.
//

import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let availableSkillTrees = skill_trees.filter {
        // 순서에 맞춰 배워야 하는 스킬들을 필터링
        let filteredSkillTree = $0.filter { skill.contains($0) }
        // 스킬 배우는 순서가 일치하는지 검사
        return skill.starts(with: filteredSkillTree)
    }
    return availableSkillTrees.count
}

let skill1 = "CBD"
let skill_trees1 = ["BACDE", "CBADF", "AECB", "BDA"]
print(solution(skill1, skill_trees1))   // 2
