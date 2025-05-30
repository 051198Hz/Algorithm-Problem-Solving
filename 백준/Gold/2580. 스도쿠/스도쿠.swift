typealias Pos = (x: Int, y: Int)
var emptyPlaceList = [Pos]()
var sudokuBoard: [[Int]] = (0..<9).map { _ in
    readLine()!.split { $0 == " " }.map{ Int($0)! }
}

for y in 0..<9 {
    for x in 0..<9 {
        if sudokuBoard[y][x] == 0 {
            emptyPlaceList.append(Pos(x, y))
        }
    }
}

func check(_ x: Int, _ y: Int, number: Int) -> Bool {
    if sudokuBoard[y].contains(number) { return false }
    
    for i in 0..<9 {
        if sudokuBoard[i][x] == number {
            return false
        }
    }
    
    let upperY = 3*(y/3)
    let upperX = 3*(x/3)
    for i in upperY..<upperY+3 {
        for j in upperX..<upperX+3 {
            if sudokuBoard[i][j] == number {
                return false
            }
        }
    }
    
    return true
}

func solveSudoku(_ count: Int) -> Bool {
    if count >= emptyPlaceList.count {
        let answer = sudokuBoard.map {
            return $0.map { "\($0)" }.joined(separator: " ")
        }.joined(separator: "\n")
        print(answer)
        return true
    }
    let x = emptyPlaceList[count].x, y = emptyPlaceList[count].y
    for i in 1...9 {
        if check(x, y, number: i) {
            sudokuBoard[y][x] = i
            if solveSudoku(count+1) { return true }
            sudokuBoard[y][x] = 0
        }
    }
    return false
}
solveSudoku(0)