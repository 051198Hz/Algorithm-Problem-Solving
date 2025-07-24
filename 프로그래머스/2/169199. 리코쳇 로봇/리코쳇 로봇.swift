import Foundation

func solution(_ board:[String]) -> Int {
    struct Point {
        let r: Int
        let c: Int
        var move: Int = 0
    }
    let rRange = 0..<board.count
    let cRange = 0..<board[1].count
    
    var start: Point?
    
    var board = board.map { $0.map { String($0) }}
    var answer = -1
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: board[1].count), count: board.count)
    
    for r in rRange {
        for c in cRange {
            if board[r][c] == "R" { 
                start = Point(r: r, c: c) 
                continue
            }
        }
    }
    
    guard let startPoint = start else { return -1 }
    
    var q = [startPoint]
    var index = 0
    let dr = [0, 0, -1, 1]
    let dc = [-1, 1, 0, 0]
    bfs: while q.count > index {
        let current = q[index]
        if isVisited[current.r][current.c] {
            index += 1
            continue
        }
        isVisited[current.r][current.c] = true
        index += 1
        for i in 0..<4 {
            var nextR = current.r
            var nextC = current.c
            while true {
                guard rRange.contains(nextR+dr[i]) else { break }
                guard cRange.contains(nextC+dc[i]) else { break }
                guard board[nextR+dr[i]][nextC+dc[i]] != "D" else { break }
                nextR += dr[i]
                nextC += dc[i]
            }
            if nextR == current.r, nextC == current.c { continue }
            if isVisited[nextR][nextC] { continue }
            if board[nextR][nextC] == "G" {
                answer = current.move + 1
                break bfs
            }
            q.append(Point(r: nextR, c: nextC, move: current.move + 1))
        }
    }
    return answer
}