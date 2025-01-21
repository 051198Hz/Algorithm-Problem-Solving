let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var numbers = Array(1...nm[0])
(0..<nm[1]).forEach { _ in
    let ij = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    for i in 0...ij[1]-ij[0] {
        if ij[0]-1 + i >= ij[1]-1-i { break }
        numbers.swapAt(ij[0]-1+i, ij[1]-1-i)
    }
}
let answer = numbers.map { String($0) }.joined(separator: " ")
print(answer)
