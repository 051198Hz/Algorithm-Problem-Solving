var square = [[Bool]](repeating: [Bool](repeating: false, count: 100), count: 100)
let pointCount = Int(readLine()!)!
let points = (0..<pointCount).map { _ in readLine()!.split { $0 == " " }.map { Int(String($0))! }}
for point in points {
    let (x, y) = (point[0], point[1])
    for yPos in y..<(y+10) {
        for xPos in x..<(x+10) {
            square[yPos][xPos] = true
        }
    }
}
let answer = square.map { $0.filter { $0 }.count }.reduce(0, +)
print(answer)