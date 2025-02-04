let n = Int(readLine()!)!
var answer = 0
for i in (1..<n) {
    let initializer = String(i).reduce(i) { $0 + Int(String($1))! }
    if initializer == n {
        answer = i
        break
    }
}
print(answer)