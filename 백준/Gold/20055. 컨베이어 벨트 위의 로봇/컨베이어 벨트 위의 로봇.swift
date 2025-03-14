 import Foundation

struct Belt {
    var robot: Bool // 로봇이 있는지
    var duration: Int // 내구도
}

let input = readLine()!.components(separatedBy:" ").map{Int($0)!}
let N = input[0], K = input[1] // 벨트 칸 수, 내구도 0의 수용치
let arr = readLine()!.components(separatedBy: " ").map{Int($0)!}
var belts = [Belt]()
for (i, x) in arr.enumerated() {
    belts.append(Belt(robot: false, duration: x))
}
var result = 0

while true {
    result += 1
    // 1
    belts.insert(belts.removeLast(), at: 0) // 맨 마지막 벨트를 앞으로
    if belts[N-1].robot == true { belts[N-1].robot = false }
    // 2
    for i in stride(from: N-2, to: -1, by: -1) { // 로봇의 이동
        if belts[i].robot == true, belts[i+1].robot == false, belts[i+1].duration > 0 {
            belts[i].robot = false
            belts[i+1].robot = true
            belts[i+1].duration -= 1
            if i+1 == N-1 { belts[i+1].robot = false } // N인덱스에 로봇이 위치하면 바로 내려준다.
        }
    }
    // 3
    if belts[0].robot == false && belts[0].duration > 0 {
        belts[0].duration -= 1
        belts[0].robot = true
    }
    // 4
    let zeroCount = belts.filter{$0.duration == 0}.count
    if zeroCount >= K {
        break
    }
}
print(result)