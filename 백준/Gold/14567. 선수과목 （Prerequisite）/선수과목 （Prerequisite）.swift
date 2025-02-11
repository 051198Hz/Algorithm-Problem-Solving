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
func topologySort() -> String {
    var semester = 1
    let qList = [Queue(), Queue()]
    var currentQueue = qList[0]
    for i in indegreeList.indices {
        if indegreeList[i] == 0 { qList[0].enqueue(i) }
    }
    while !qList[0].isEmpty || !qList[1].isEmpty {
        while !currentQueue.isEmpty {
            let cur = currentQueue.dequeue()!
            for vertex in connectedInfo[cur] {
                indegreeList[vertex] -= 1
                if indegreeList[vertex] == 0 {
                    qList[semester % 2].enqueue(vertex)
                }
            }
            vertexList[cur] = semester
        }
        if qList[1].isEmpty {
            semester += 1
            currentQueue = qList[0]
        }
        if qList[0].isEmpty {
            semester += 1
            currentQueue = qList[1]
        }
    }
    let sortedVertexs = vertexList.suffix(nm[0]).map { String($0) }.joined(separator: " ")
    return sortedVertexs
}
let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var connectedInfo = [[Int]](repeating: [Int](), count: nm[0])
var vertexList = [Int](repeating: 0, count: nm[0])
var indegreeList = [Int](repeating: 0, count: nm[0])
(0..<nm[1]).forEach { _ in
    let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    connectedInfo[ab[0]-1].append(ab[1]-1)
    indegreeList[ab[1]-1] += 1
}
let answer = topologySort()
print(answer)