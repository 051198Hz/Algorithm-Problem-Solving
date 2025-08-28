//14442번 벽 부수고 이동하기2

import Foundation

func bfs() -> Int {
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    var visit = [[Int]](repeating: [Int](repeating: k+1, count: m), count: n)
    visit[0][0] = 0

    var queue = [(0, 0, 1)]
    var idx = 0

    while queue.count > idx {
        let (x, y, dist) = queue[idx]
        idx += 1

        if x == n - 1 && y == m - 1 { return dist }

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            guard (0..<n) ~= nx && (0..<m) ~= ny else { continue }

            // 다음칸이 벽인지 + 현재까지 부순 벽의 갯수
            // 현재까지 부순 벽의 갯수가 0개이고, 다음 칸이 벽이여서 1이라고 하자.
            // 부술 벽의 visit에는 1이 할당될 것이다.
            // 이것이 쭉 쌓이다, 다음 상황을 고려해보자.
            // 현재까지 부순 벽의 갯수가 10개이고, 다음 칸이 벽이여서 1이라고 하자.
            // 부술 벽의 visit에는 11이 할당될 것 이다.
            // 다음에 이 벽이 탐색 대상으로 고려될 때, 이보다 작으면 탐색한다.
            let brokenWallCount = graph[nx][ny] + visit[x][y] 

            if brokenWallCount < visit[nx][ny] && brokenWallCount <= k {
                visit[nx][ny] = brokenWallCount
                queue.append((nx, ny, dist + 1))
            }
        }
    }

    return -1
}

let t = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m, k) = (t[0], t[1], t[2])

var graph = [[Int]]()
for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    graph.append(line)
}

print(bfs())