func solution1018(_ x: Int, _ y: Int, _ firstShouldWhite: Bool) -> Int{
    var shouldChagePlaceCount = 0
    var flag = board[y][x] == "W" ? true : false
    flag = flag == firstShouldWhite
    for i in y..<(y+8) {
        for j in x..<(x+8) {
            let curPlace = board[i][j] == "W" ? true : false
            if curPlace != flag  {
                shouldChagePlaceCount += 1
            }
            flag.toggle()
        }
        flag.toggle()
    }
    return shouldChagePlaceCount
}
let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let board = (0..<nm[0]).map { _ in readLine()!.map { String($0) }}
var answer = Int.max
for i in 0...(nm[0]-8) {
    for j in 0...(nm[1]-8) {
        answer = min(solution1018(j, i, true), answer)
        answer = min(solution1018(j, i, false), answer)
    }
}
print(answer)