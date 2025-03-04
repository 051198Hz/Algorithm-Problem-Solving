struct Edge {
    let v1: Int
    let v2: Int
    let cost: Int
}

func union(_ v1: Int, _ v2: Int) {
    let p1 = find(v1)
    let p2 = find(v2)
    guard p1 != p2 else { return }
    parentList[p2] = p1
}

func find(_ v: Int) -> Int {
    if parentList[v] == -1 {
        return v
    }
    parentList[v] = find(parentList[v])
    return parentList[v]
}
// m - 간선갯수, n = 정점갯수
let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }, n = nm[0], m = nm[1]
var parentList = ContiguousArray<Int>(repeating: -1, count: n+1)
let edgeList: [Edge] = (0..<m).map { _ in
    let edge = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    return Edge(v1: edge[0], v2: edge[1], cost: edge[2])
}.sorted { $0.cost < $1.cost }

var choosedEdgeCount = 0
var answer = 0
var maxCost = Int.min
for edge in edgeList {
    guard choosedEdgeCount < n-1 else { break }
    let v1 = edge.v1
    let v2 = edge.v2
    if find(v1) == find(v2) { continue }
    union(v1, v2)
    answer += edge.cost
    maxCost = max(maxCost, edge.cost)
    choosedEdgeCount += 1
}
print(answer - maxCost)