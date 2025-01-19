let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var basketList = Array(1...nm[0])
(0..<nm[1]).forEach { _ in
    let ij = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    basketList.swapAt(ij[0]-1, ij[1]-1)
}
let answer = basketList.map { String($0) }.joined(separator: " " )
print(answer)