let ns = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let sequence = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var isVisited = [Bool](repeating: false, count: ns[0])
var answer = 0

func backtracking(_ current: Int, _ sum: Int = 0) {
    if sum + sequence[current] == ns[1] { answer += 1 }

    for i in current..<ns[0] {
        if isVisited[i] { continue }
        isVisited[i] = true
        backtracking(i, sum + sequence[current])
        isVisited[i] = false
    }
}

for i in 0..<ns[0] {
    isVisited[i] = true
    backtracking(i, 0)
    isVisited[i] = false
}

print(answer)