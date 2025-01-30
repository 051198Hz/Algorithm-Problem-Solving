var lines = [[String]](repeating: [String](repeating: "", count: 15), count: 5)
var answer = ""
(0..<5).map { index in (index, readLine()!.map { String($0)}) }.forEach { (index, line) in
    for i in line.indices {
        lines[index][i] = line[i]
    }
}
for i in (0..<15) {
    for line in lines {
        answer.write(line[i])
    }
}
print(answer)