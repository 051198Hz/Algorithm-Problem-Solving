let n = Int(readLine()!)!
var answer = ""
(0..<n).forEach { _ in
    let ts = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var line: [Int] = []
    var stepBack = 0
    outer: for last in ts.suffix(from: 1) {
        inner: for index in line.indices {
            guard line[index] > last else { continue }
            stepBack += line.count - index
            line.insert(last, at: index)
            continue outer
        }
        line.append(last)
    }
    answer += "\(ts[0]) \(stepBack)\n"
}
print(answer)