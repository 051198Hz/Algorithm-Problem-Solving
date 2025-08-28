let n = Int(readLine()!)!
let a = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted { $0 < $1 }
let b = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted { $0 > $1 }
var answer = 0
for i in 0..<n {
    answer += a[i] * b[i]
}
print(answer)