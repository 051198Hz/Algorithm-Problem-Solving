let word = readLine()!.map { String($0) }
let alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
var alphaMap = alphabets.reduce(into: [:]) {
    $0[$1] = 0
}
for i in stride(from: 0, to: alphabets.count-4-3-4, by: 3) {
    alphaMap[alphabets[i]] = 3 + i/3
    alphaMap[alphabets[i+1]] = 3 + i/3
    alphaMap[alphabets[i+2]] = 3 + i/3
}
for i in stride(from: alphabets.count-4-3-4, to: alphabets.count-4-3, by: 1) {
    alphaMap[alphabets[i]] = 8
}
for i in stride(from: alphabets.count-4-3, to: alphabets.count-4, by: 1) {
    alphaMap[alphabets[i]] = 9
}
for i in stride(from: alphabets.count-4, to: alphabets.count, by: 1) {
    alphaMap[alphabets[i]] = 10
}
let answer = word.compactMap { alphaMap[$0] }.reduce(0, +)
print(answer)