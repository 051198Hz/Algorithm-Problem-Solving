let n = Int(readLine()!)!
var idx = 0
var towers = readLine()!.split(separator: " ").map{ Int(String($0))!}

var lazers = [Int]()
var answer = [Int](repeating: 0, count: towers.count)

for i in stride(from: n-1, to: -1, by: -1){
    while !lazers.isEmpty && towers[i] > towers[lazers.last!]{ //현재 인덱스의 타워 높이와 스택 안의 인덱스의 타워와 높이 비교
        let idx = lazers.popLast()!
        answer[idx] = i+1
    }
    lazers.append(i) // i는 탑의 끝에서부터 인덱스임. 인덱스를 lazer에 저장,
}

answer.forEach{ print($0,terminator: " ") }