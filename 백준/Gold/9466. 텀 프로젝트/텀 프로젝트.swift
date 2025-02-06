class Queue {
    var queue = [Int?]()
    var head = 0

    var isEmpty: Bool {
        queue.count-head == 0
    }
    var front: Int? {
        isEmpty ? nil : queue[head]
    }
    func enqueue(_ element: Int) {
        queue.append(element)
    }
    func dequeue() -> Int? {
        if isEmpty { return nil }
        let queuePonter = UnsafeMutableBufferPointer(start: &queue, count: queue.count).baseAddress!
        let ret = queuePonter[head]
        queuePonter[head] = nil
        head += 1
        return ret
    }
}
let t = Int(readLine()!)!
func topologySort(_ vertexList: inout [Int], _ inDegreeList: inout [Int]) -> Int {
    
    let vertexPointer = UnsafeMutableBufferPointer(start: &vertexList, count: vertexList.count).baseAddress!
    let indegreePointer = UnsafeMutableBufferPointer(start: &inDegreeList, count: inDegreeList.count).baseAddress!

    var acyclicVertexCount = 0
    let queue = Queue()
    for i in inDegreeList.indices {
        guard indegreePointer[i] == 0 else { continue }
        queue.enqueue(i)
    }
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        let next = vertexPointer[cur]
        indegreePointer[next] -= 1
        if indegreePointer[next] == 0 {
            queue.enqueue(next)
        }
        acyclicVertexCount += 1
    }
    return acyclicVertexCount
}
var totalAnswer = ""
(0..<t).forEach { _ in
    let n = Int(readLine()!)!
    var inDegree = [Int](repeating: 0, count: n)
    var vertexList = [Int](repeating: 0, count: n)
    let vertexPointer = UnsafeMutableBufferPointer(start: &vertexList, count: vertexList.count).baseAddress!
    let indegreePointer = UnsafeMutableBufferPointer(start: &inDegree, count: inDegree.count).baseAddress!
    readLine()!.split { $0 == " " }.map { Int(String($0))! - 1 }.enumerated().forEach { i, value in
        vertexPointer[i] = value
        indegreePointer[value] += 1
    }
    let answer = topologySort(&vertexList, &inDegree)
    totalAnswer.write("\(answer)\n")
}
print(totalAnswer)