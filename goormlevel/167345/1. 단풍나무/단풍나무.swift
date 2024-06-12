import Foundation

typealias treePos = (Int,Int)
let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

let n = Int(readLine()!)!
var grid: [[Int]] = []
var notColored: [treePos] = []
(0..<n).forEach{ i in
    var j = 0
    let line = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    line.forEach{
        let notColoredNumber = Int(String($0))!
        if notColoredNumber > 0 {
            notColored.append((i,j))
        }
        j += 1
    }
    grid.append(line)
}
var answer = 0
coloring: while !notColored.isEmpty{
    var beColored = Array<(treePos, Int)>()
    while !notColored.isEmpty{
        let coloringPos = notColored.removeLast()
        let cx = coloringPos.0, cy = coloringPos.1
        var colorCount = 0
        for i in 0..<4 {
            let nx = cx+dx[i]
            let ny = cy+dy[i]
            if nx < 0 || nx >= n || ny < 0 || ny >= n { continue } //범위 벗어나면 다음위치 탐색
            if grid[nx][ny] == 0{ colorCount += 1 }
        }
        beColored.append((coloringPos,colorCount))
    }
    while !beColored.isEmpty{
    let coloringInfo = beColored.removeLast()
    let pos = coloringInfo.0, count = coloringInfo.1
    let x = pos.0, y = pos.1
    grid[x][y] = max(grid[x][y] - count, 0)
    if grid[x][y] != 0 { notColored.append(pos)}
    }
    answer += 1
}
print(answer)