let map = [1: "A", 2: "B", 3: "C", 4: "D", 0: "E"]
(0..<3).forEach { _ in
    let n = readLine()!.split { $0 == " " }.map { String($0) }.filter { $0 == "0" }.count
    print(map[n]!)
}