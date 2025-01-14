let str = readLine()!.map { String($0) }
let q = Int(readLine()!)!
var sumTable = [String:[Int]]()
var sum = [0] + [Int](repeating: 0, count: str.count)
var answer = ""
(0..<q).forEach { _ in
    let alr = readLine()!.split { $0 == " " }.map { String($0) }
    if let charSum = sumTable[alr[0]] {
        let sum = charSum[Int(alr[2])!+1] - charSum[Int(alr[1])!]
        answer.write("\(sum)\n")
    } else {
        let c = alr[0]
        var i = 1
        for subStr in str {
            sum[i] = sum[i-1]
            if subStr == c {
                sum[i] += 1
            }
            i += 1
        }
        sumTable.updateValue(sum, forKey: c)
        let result = sum[Int(alr[2])!+1] - sum[Int(alr[1])!]
        answer.write("\(result)\n")
    }
}
print(answer)