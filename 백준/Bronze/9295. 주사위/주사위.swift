let n = Int(readLine()!)!

(1...n).forEach { i in
    let sum = readLine()!.split { $0 == " " }.map { Int(String($0))! }.reduce(0, +)
    print("Case \(i): \(sum)")
}