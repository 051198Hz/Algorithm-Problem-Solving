import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    //1번 스킬을 배우지 않고, 2번 스킬부터 시작한 스킬트리가 있을 수 있음
    //스킬트리 안에 모든 스킬이 들어있지 않을 수 있음
    //이전 스킬보다 인덱스가 앞이면, 불가능한 스킬트리임
    var posssibleTreeCount = 0
    
outer: for skill_tree in skill_trees{
    
    var prevSkillIdx: String.Index?
    //첫번째 스킬을 배웠는지 기록
    //    var isLearnedFirstSkill = false
    //스킬이 스킵되었는지 기록
    var isExitngSkipedSkill = false
    //ABC
    //1번 스킬을 만나기 전에 스킬을 만나고,
    for idx in skill.indices{ // 1단계 스킬부터 모든 스킬에 대해 검사
        if let treeIdx = skill_tree.firstIndex(of: skill[idx]){ //스킬트리 안 스킬의 인덱스를 검사
            //스킵된 스킬이 있는데, 그 다음 단계의 스킬이 존대한다면 불가능한 스킬트리
            if isExitngSkipedSkill{ continue outer }
            //1번 스킬이 있다면, 해당 인덱스를 저장 후 다음 반복으로 넘어감
            if idx == skill.indices.first!{
                prevSkillIdx = treeIdx
                continue
            }
            if let prevSkillIdx = prevSkillIdx{
                //현재 스킬트리가 이전 스킬트리보다 앞에 위치한 경우 불가능한 스킬트리
                if treeIdx < prevSkillIdx{ continue outer }
            }
            prevSkillIdx = treeIdx
        }else{ //스킬트리 안에 스킬이 없다면, 스킵된 스킬이 있음을 기록
            isExitngSkipedSkill = true
        }
    }
    //반복문을 빠져나왔거나
    //모든 스킬을 배우지 않았다면, 가능한 스킬트리
    posssibleTreeCount += 1
    
}
    return posssibleTreeCount
}