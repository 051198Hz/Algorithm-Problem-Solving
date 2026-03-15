import Foundation

func solution(_ board:[[Int]], _ commands:[[Int]]) -> [[Int]] {

    let dr = [0, 0, 1, 0, -1]
    let dc = [0, 1, 0, -1, 0]

    func buildApps(_ board: [[Int]]) -> [Int: App] {
        let n = board.count
        let m = board[0].count

        var minRow: [Int: Int] = [:]
        var minCol: [Int: Int] = [:]
        var maxRow: [Int: Int] = [:]
        var maxCol: [Int: Int] = [:]

        for r in 0..<n {
            for c in 0..<m {
                let id = board[r][c]
                if id == 0 { continue }

                minRow[id] = min(minRow[id] ?? r, r)
                minCol[id] = min(minCol[id] ?? c, c)
                maxRow[id] = max(maxRow[id] ?? r, r)
                maxCol[id] = max(maxCol[id] ?? c, c)
            }
        }

        var apps: [Int: App] = [:]

        for id in minRow.keys {
            let r1 = minRow[id]!
            let c1 = minCol[id]!
            let r2 = maxRow[id]!

            let size = r2 - r1 + 1

            apps[id] = App(
                id: id,
                row: r1,
                col: c1,
                size: size
            )
        }

        return apps
    }

    func push(_ id: Int,
              dir: Int,
              board: inout [[Int]],
              apps: inout [Int: App]) {

        guard var app = apps[id] else { return }

        let n = board.count
        let m = board[0].count

        let r = app.row
        let c = app.col
        let s = app.size

        let drow = dr[dir]
        let dcol = dc[dir]

        switch dir {
        case 1:
            for i in 0..<s { board[r+i][c] = 0 }
        case 2:
            for i in 0..<s { board[r][c+i] = 0 }
        case 3:
            for i in 0..<s { board[r+i][c+s-1] = 0 }
        case 4:
            for i in 0..<s { board[r+s-1][c+i] = 0 }
        default: break
        }

        var frontCells: [(Int,Int)] = []

        switch dir {
        case 1:
            for i in 0..<s { frontCells.append((r+i, c+s)) }
        case 2:
            for i in 0..<s { frontCells.append((r+s, c+i)) }
        case 3:
            for i in 0..<s { frontCells.append((r+i, c-1)) }
        case 4:
            for i in 0..<s { frontCells.append((r-1, c+i)) }
        default: break
        }

        for (rr,cc) in frontCells {
            if rr < 0 || rr >= n || cc < 0 || cc >= m {

                for i in 0..<s {
                    for j in 0..<s {
                        let rr2 = r + i
                        let cc2 = c + j

                        if rr2 >= 0 && rr2 < n && cc2 >= 0 && cc2 < m {
                            board[rr2][cc2] = 0
                        }
                    }
                }

                removedQueue.append(
                    RemovedApp(
                        id: id,
                        row: r,
                        col: c,
                        size: s,
                        dir: dir
                    )
                )

                apps.removeValue(forKey: id)
                return
            }
        }

        for (rr,cc) in frontCells {
            let target = board[rr][cc]

            if target != 0 && target != id {
                push(target, dir: dir, board: &board, apps: &apps)
            }
        }

        for (rr,cc) in frontCells {
            board[rr][cc] = id
        }

        app.row += drow
        app.col += dcol
        apps[id] = app
    }

    func spawn(board: inout [[Int]], apps: inout [Int: App]) {

        let n = board.count
        let m = board[0].count

        while !removedQueue.isEmpty {

            let removed = removedQueue.removeFirst()

            let id = removed.id
            let s = removed.size
            let dir = removed.dir

            var r = removed.row
            var c = removed.col

            switch dir {
            case 1: c = 0
            case 2: r = 0
            case 3: c = m - s
            case 4: r = n - s
            default: break
            }

            apps[id] = App(id: id, row: r, col: c, size: s)

            for step in 0..<s {

                var cells: [(Int,Int)] = []

                switch dir {

                case 1:
                    for i in 0..<s { cells.append((r+i, step)) }

                case 2:
                    for i in 0..<s { cells.append((step, c+i)) }

                case 3:
                    for i in 0..<s { cells.append((r+i, m-1-step)) }

                case 4:
                    for i in 0..<s { cells.append((n-1-step, c+i)) }

                default: break
                }

                for (rr,cc) in cells {
                    let target = board[rr][cc]
                    if target != 0 && target != id {
                        push(target, dir: dir, board: &board, apps: &apps)
                    }
                }

                for (rr,cc) in cells {
                    board[rr][cc] = id
                }
            }
        }
    }

    var board = board
    var removedQueue: [RemovedApp] = []
    var apps = buildApps(board)

    for cmd in commands {

        let id = cmd[0]
        let dir = cmd[1]

        push(id, dir: dir, board: &board, apps: &apps)
        spawn(board: &board, apps: &apps)
    }

    return board
}

struct App {
    let id: Int
    var row: Int
    var col: Int
    let size: Int
}

struct RemovedApp {
    let id: Int
    let row: Int
    let col: Int
    let size: Int
    let dir: Int
}