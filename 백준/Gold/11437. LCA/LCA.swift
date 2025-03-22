final class Queue<T> {
    private var queue = [T?]()
    private var head = 0
    var isEmpty: Bool {
        queue.count - head == 0
    }
    func enqueue(_ element: T) {
        queue.append(element)
    }
    func dequeue() -> T? {
        if isEmpty { return nil }
        let ret = queue[head]
        queue[head] = nil
        head += 1
        return ret
    }
}

var answer = ""
let n = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](), count: n+1)
var parentInfo = [Int](repeating: 0, count: n+1)
var depthInfo = [Int](repeating: 0, count: n+1)

(0..<n-1).forEach { _ in
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    graph[ab[0]].append(ab[1])
    graph[ab[1]].append(ab[0])
}

var startNode = 1
var queue = Queue<(Int, Int)>()
queue.enqueue((startNode, 0))
while !queue.isEmpty {
    let (curNode, depth) = queue.dequeue()!
    let childNodes = graph[curNode]
    childNodes.forEach {
        guard parentInfo[$0] == 0 && $0 != 1 else { return }
        parentInfo[$0] = curNode
        depthInfo[$0] = (depth+1)
        queue.enqueue(($0, depth+1))
    }
}
let m = Int(readLine()!)!
(0..<m).forEach { _ in
    let vg = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    // v의 depth가 g보다 반드시 큼
    var v = vg[0]
    var g = vg[1]
    if depthInfo[v] < depthInfo[g] { swap(&v, &g) }
    
    while depthInfo[v] > depthInfo[g] {
        v = parentInfo[v]
    }
    
    if v == g {
        answer.write("\(v)\n")
        return
    }
    
    while parentInfo[v] != parentInfo[g] {
        v = parentInfo[v]
        g = parentInfo[g]
    }
    answer.write("\(parentInfo[v])\n")
}
print(answer)