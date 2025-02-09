class Node {
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
    let value: Int
    var next: Node?
}

class Graph {
    var head: Node?
    var tail: Node?
    func appendEdge(_ node: Node) {
        if head == nil {
            head = node
            tail = node
            return
        }
        tail?.next = node
        tail = node
    }
    func connectedVertexs() -> [Int] {
        guard let head = self.head else { return [] }
        var nextVertexs = [Int]()
        var next = head.next
        while next != nil {
            nextVertexs.append(next!.value)
            next = next?.next
        }
        return nextVertexs
    }
}


func dfs(_ e: [Graph], _ r: Int, _ order: inout Int) {
    order += 1
    isVisited[r] = order
    let nextVertexs = e[r].connectedVertexs()
    for vertex in nextVertexs.sorted(by: { $1 < $0 }) {
        if isVisited[vertex] != 0 { continue }
        dfs(e, vertex, &order)
    }
}

let nmr = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var graph: [Graph] = (0...nmr[0]).map { index in
    let g = Graph()
    g.appendEdge(Node(value: index))
    return g
}
var isVisited = [Int](repeating: 0, count: nmr[0] + 1)
(0..<nmr[1]).forEach { _ in
    let uv = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var g = graph[uv[0]]
    g.appendEdge(Node(value: uv[1]))
    g = graph[uv[1]]
    g.appendEdge(Node(value: uv[0]))
}
var count = 0
dfs(graph, nmr[2], &count)
print(isVisited.suffix(nmr[0]).map { String($0) }.joined(separator: "\n"))