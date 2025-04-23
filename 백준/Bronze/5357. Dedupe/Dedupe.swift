(0..<Int(readLine()!)!).forEach { _ in
    let input = readLine()!.map { String($0) }
    var last = ""
    for c in input {
        guard c != last else { continue }
        print(c, terminator: "")
        last = c
    }
    print()
}