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
class Queue {
    var queue = [Int?]()
    var head = 0
    var isEmpty: Bool {
        queue.count - head == 0
    }
    var front: Int? {
        isEmpty ? nil : queue[head]
    }
    func enqueue(_ element: Int) {
        queue.append(element)
    }
    func dequeue() -> Int? {
        if isEmpty { return nil }
        let ret = queue[head]
        queue[head] = nil
        head += 1
        return ret
    }
}


func BFS(_ e: [Graph], _ r: Int, _ order: inout Int) {
    let queue = Queue()
    queue.enqueue(r)
    while !queue.isEmpty {
        let next = queue.dequeue()!
        if isVisited[next] != 0 { continue }
        order += 1
        isVisited[next] = order
        let nextVertexs = e[next].connectedVertexs()
        for vertex in nextVertexs.sorted(by: { $1 < $0 }) {
            if isVisited[vertex] != 0 { continue }
            queue.enqueue(vertex)
        }
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
BFS(graph, nmr[2], &count)
print(isVisited.suffix(nmr[0]).map { String($0) }.joined(separator: "\n"))