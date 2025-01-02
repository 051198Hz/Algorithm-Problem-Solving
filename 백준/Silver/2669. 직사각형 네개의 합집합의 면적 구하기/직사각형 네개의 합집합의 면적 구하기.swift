import Foundation

var grid = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)

func makeRect(_ x1: Int, _ y1: Int, x2: Int, y2: Int) {
    if x1 == x2 && y1 == y2 { return }
    for j in y1..<y2 {
        for i in x1..<x2 {
            grid[j][i] = true
        }
    }
}

for _ in 0..<4 {
    let LDRT = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    makeRect(LDRT[0], LDRT[1], x2: LDRT[2], y2: LDRT[3])
}

let result = grid.map{ $0.filter{ $0 == true}.count }.reduce(0,+)
print(result)
