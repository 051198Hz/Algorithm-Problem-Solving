var bridgingCount = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)

for i in 1...30{
    bridgingCount[1][i] = i
}

for i in 2...30{
    for j in i...30{
        for k in i-1..<j{
            bridgingCount[i][j] += bridgingCount[i-1][k]
        }
    }
}

(0..<Int(readLine()!)!).forEach{ _ in
    let nm = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    let n = nm[0], m = nm[1]
    

    print(bridgingCount[n][m])
}