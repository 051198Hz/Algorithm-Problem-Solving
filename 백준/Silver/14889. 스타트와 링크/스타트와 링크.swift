import Foundation

let n = Int(readLine()!)!
let playerPower = (0..<n).map { _ in
    readLine()!.split { $0 == " "}.map{ Int(String($0))! }
}
var pickedPlayer = [Bool](repeating: true, count: playerPower.count)
var differ = Int.max

func pick(_ idx: Int, _ count: Int) {
    if count == pickedPlayer.count/2 {
        var currentPower = [0,0]
        for i in 0..<pickedPlayer.count {
            for j in 0..<pickedPlayer.count {
                if pickedPlayer[i] && pickedPlayer[j] {
                    currentPower[0] += playerPower[i][j]
                } else if !pickedPlayer[i] && !pickedPlayer[j] {
                    currentPower[1] += playerPower[i][j]
                }
            }
        }
        let curDiff = abs(currentPower[0] - currentPower[1])
        if curDiff == 0 {
            print("0")
            exit(0)
        }
        if differ > curDiff {
            differ = curDiff
        }
        return
    }
    for i in idx..<pickedPlayer.count {
        if pickedPlayer[i] {
            pickedPlayer[i] = false
            pick(i+1, count+1)
            pickedPlayer[i] = true
        }
    }
}
// 플레이어가 서로 속한 걸 어떻게 알지?
// 이걸 굳이 구분하지 않고 점수에 넣는 방법은 없을까?
// n/2명만 뽑으면 나머지는 알아서 넣어지니,, 그렇게 가보자
pick(0, 0)
print(differ)