func union(_ v1: Int, _ v2: Int) -> Bool {
    let g1 = find(v1)
    let g2 = find(v2)
    if g1 == g2 { return false }
    vertexGroupList[g2] = g1
    return true
}
func find(_ v: Int) -> Int {
    if vertexGroupList[v] < 0 { return v }
    vertexGroupList[v] = find(vertexGroupList[v])
    return vertexGroupList[v]
}
struct Edge {
    let from: Int
    let to: Int
    let cost: Int
}
let ve = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var vertexGroupList = [Int](repeating: -1, count: ve[0]+1)
var answer = 0
var edges = (0..<ve[1]).reduce(into: [Edge]()) { result, _ in
    let abc = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    let edge = Edge(from: a, to: b, cost: c)
    result.append(edge)
}.sorted { $0.cost < $1.cost }
var cnt = 0
for edge in edges {
    guard union(edge.from, edge.to) else { continue }
    answer += edge.cost
    cnt += 1
    if cnt == ve[0]-1 { break }
}
print(answer)