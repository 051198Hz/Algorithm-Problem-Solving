let scoreMap: [Character: Double] = ["A": 4.0, "B": 3.0, "C": 2.0, "D": 1.0, "F": 0.0, "+": 0.5, "0": 0.0]
func toScore(_ alphaScore: String) -> Double {
    alphaScore.reduce(0.0) { $0 + scoreMap[$1]! }
}
var totalCredit = 0.0
var totalScore = 0.0
(0..<20).forEach { _ in
    let input = readLine()!.split { $0 == " " }.suffix(2)
    guard input.last! != "P" else { return }
    totalScore += toScore(String(input.last!)) * Double(input.first!)!
    totalCredit += Double(input.first!)!
}
print(totalScore / totalCredit)