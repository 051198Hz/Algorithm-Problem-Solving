let nr = readLine()!.split { $0 == " " }.map { Int(String($0))! },
    n = nr[0],
    root = nr[1]

var tree = [[Edge]](repeating: [Edge](), count: n+1)
var isVisited = [Bool](repeating: false, count: n+1)

for _ in 0..<n-1 {
    let gve = readLine()!.split { $0 == " " }.map { Int(String($0))! },
        g = gve[0],
        v = gve[1],
        e = gve[2]
    let egv = Edge(from: g, to: v, cost: e)
    let evg = Edge(from: v, to: g, cost: e)
    tree[g].append(egv)
    tree[v].append(evg)
}

var gigaNode = root
var branchLengthMax = 0
// 최초로 자식이 3개 이상인 노드를 찾으면 반환
// 그렇지 않으면 게속 재귀하다가, 더이상 찾을 노드가 없으면 반환
func findGiga(_ current: Int) -> Int {
    gigaNode = current
    isVisited[current] = true
    if current == root, tree[current].count > 1 {
        return 0
    }
    if tree[current].count > 2 {
        return 0
    }
    for e in tree[current] {
        if isVisited[e.to] { continue }
        return e.cost + findGiga(e.to)
    }
    return 0
}

func findBranch(_ current: Int, _ cost: Int) {
    isVisited[current] = true
    if cost > branchLengthMax {
        branchLengthMax = cost
    }
    for e in tree[current] {
        if isVisited[e.to] { continue }
        findBranch(e.to, cost + e.cost)
    }
}

let pillarLength = findGiga(root)
if tree[gigaNode].count >= 2 {
    findBranch(gigaNode, 0)
}

print(pillarLength, branchLengthMax)

struct Edge {
    let from: Int
    let to: Int
    let cost: Int
}