let nmk = readLine()!.split { $0 == " " }.map { Int(String($0))! },
    n = nmk[0], //행갯수
    m = nmk[1], //열갯수
    k = nmk[2] //부술수 있는 벽갯수

var map = [[Int]]()
var isVisited = [[[Bool]]](
    repeating: [[Bool]](repeating: [Bool](repeating: false, count: k+1), count: m),
    count: n
)
var answer = Int.max

for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    map.append(line)
}

struct Point {
    let r: Int
    let c: Int
    let moveCount: Int
    let breakCount: Int
}
let dc = [0, 0, -1, 1]
let dr = [-1, 1, 0, 0]

func bfs() {
    let firstMove = Point(r: 0, c: 0, moveCount: 0, breakCount: 0)
    var queue = [firstMove]
    isVisited[0][0][0] = true
    var index = 0

    while queue.count > index {
        let currentPoint = queue[index]
        if currentPoint.r == n-1, currentPoint.c == m-1 {
            index += 1
            answer = answer > currentPoint.moveCount ? currentPoint.moveCount : answer
            return
        }
        for i in 0..<4 {
            let nc = currentPoint.c + dc[i]
            let nr = currentPoint.r + dr[i]
            guard (0..<n).contains(nr), (0..<m).contains(nc) else { continue }
            guard !isVisited[nr][nc][currentPoint.breakCount] else { continue }
            if map[nr][nc] == 1 {
                let nb = currentPoint.breakCount + 1
                guard nb <= k, !isVisited[nr][nc][nb] else { continue }
                queue.append(Point(r: nr, c: nc, moveCount: currentPoint.moveCount+1, breakCount: nb))
                isVisited[nr][nc][nb] = true
            } else {
                queue.append(Point(r: nr, c: nc, moveCount: currentPoint.moveCount+1, breakCount: currentPoint.breakCount))
                isVisited[nr][nc][currentPoint.breakCount] = true
            }
        }
        index += 1
    }
}

bfs()

print(answer == Int.max ? -1 : answer + 1)