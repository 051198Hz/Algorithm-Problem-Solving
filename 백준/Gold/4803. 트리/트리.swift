import Foundation

var answer = ""
var caseNumber = 0
while let input = readLine() {
    caseNumber += 1
    func union(_ g: Int, _ v: Int) {
        var g = find(parent[g])
        var v = find(parent[v])
        //언제나 g가 작도록.
        if g > v { swap(&g, &v) }
        parent[v] = g
    }

    func find(_ v: Int) -> Int {
        if v == parent[v] { return v }
        parent[v] = find(parent[v])
        return parent[v]
    }

    if input == "0 0" { break }

    let nm = input.split { $0 == " " }.map { Int(String($0))! },
        n = nm[0],
        m = nm[1]
    var parent = Array(0...n)
    var edges = [(Int, Int)]()

    (0..<m).forEach { _ in
        let gv = readLine()!.split { $0 == " " }.map { Int(String($0))! },
            g = gv[0],
            v = gv[1]
        edges.append((g, v))
    }

    var cycleNode = Set<Int>()
    for edge in edges {
        let rootG = find(edge.0)
        let rootV = find(edge.1)
        if rootG == rootV { 
            cycleNode.insert(edge.0)
            cycleNode.insert(edge.1)
        }
        union(edge.0, edge.1)
    }
    let notTreeRoots = Set(cycleNode.map { find($0) })
    let roots = Set(parent[1...].map { find($0) })
    let treeCount = roots.filter { !notTreeRoots.contains($0) }.count
    switch treeCount {
        case 0: answer.write("Case \(caseNumber): No trees.\n")
        case 1: answer.write("Case \(caseNumber): There is one tree.\n")
        default: answer.write("Case \(caseNumber): A forest of \(treeCount) trees.\n")
    }
}
print(answer)