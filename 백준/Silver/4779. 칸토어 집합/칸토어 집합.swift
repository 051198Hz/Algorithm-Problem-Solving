import Foundation

func pow(_ x: Int, _ y: Int) -> Int {
    return [Int](repeating: x, count: y).reduce(1, *)
}

func triSectionize(n: Int) -> String{
    if n == 0 { return "-" }
    let line = triSectionize(n: n-1)
    return line + String(repeating: " ", count: pow(3, n-1)) + line
}
var dp = [Int:String]()
var totalAnswer = ""
while let input = readLine(), let n = Int(input) {
    if let answer =  dp[n] {
        totalAnswer.write(answer)
        continue
    }
    let answer = triSectionize(n: n)+"\n"
    dp[n] = answer
    totalAnswer.write(answer)
}
print(totalAnswer)
