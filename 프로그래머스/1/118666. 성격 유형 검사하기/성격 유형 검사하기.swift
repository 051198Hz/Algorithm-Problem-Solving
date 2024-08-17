import Foundation
// 질문마다 판단하는 지표를 담은 1차원 문자열 배열 survey
// 검사자가 각 질문마다 선택한 선택지를 담은 1차원 정수 배열 choices가 매개변수로 주어집니다.
// 이때, 검사자의 성격 유형 검사 결과를 지표 번호 순서대로 return 하도록 solution 함수를 완성해주세요.
func solution(_ survey:[String], _ choices:[Int]) -> String {
    let indexByType = ["R":0, "T":1, "C":2, "F":3, "J":4, "M":5, "A":6, "N":7]
    let typeByIndex = [0:"R", 1:"T", 2:"C", 3:"F", 4:"J", 5:"M", 6:"A", 7:"N"]

    var scores = Array(repeating: 0, count: 8)

    zip(choices, survey).forEach{ (preScore,types) in
        var score = abs(4-preScore)
        var type:String = {
            if (1...3).contains(preScore) {
                return String(types.first!)
            }
            if (5...7).contains(preScore){
                return String(types.last!)
            }
            return ""
        }()
        guard let index = indexByType[type] else { return }
        scores[index] += score       
    }
    let answer = stride(from: 0, to: scores.count, by:2).map{
        let index = scores[$0+1] > scores[$0] ? $0+1 : $0
        guard let type = typeByIndex[index] else { return "?" }
        return type
    }.joined()
// survey[i]의 첫 번째 캐릭터는 i+1번 질문의 비동의 관련 선택지를 선택하면 받는 성격 유형을 의미합니다.
// survey[i]의 두 번째 캐릭터는 i+1번 질문의 동의 관련 선택지를 선택하면 받는 성격 유형을 의미합니다.
//     choices	뜻
// 1	매우 비동의
// 2	비동의
// 3	약간 비동의
// 4	모르겠음
// 5	약간 동의
// 6	동의
// 7	매우 동의
    
    //1~3번은 앞글자만, 4번은 두글자 모두, 5~7은 뒷글자.
    // RT,CF,JM,AN 순으로 성격유형 표시
    
    return answer
}