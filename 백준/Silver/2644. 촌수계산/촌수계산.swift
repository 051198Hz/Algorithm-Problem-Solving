let n = Int(readLine()!)!
let ij = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let m = Int(readLine()!)!
var familyTree = [[Int]](repeating: [], count: n+1)
var isVisited = [Bool](repeating: false, count: n+1)
(0..<m).forEach { _ in
    let xy = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    familyTree[xy[0]].append(xy[1])
    familyTree[xy[1]].append(xy[0])
}

func dfs(_ node: Int, _ deepth: Int) -> Int {
    if node == ij[1] { return deepth }
    isVisited[node] = true
    var nextNodes = [Int]()
    for node in familyTree[node] {
        guard !isVisited[node] else { continue }
        nextNodes.append(node)
    }
    for nextNode in nextNodes {
        let result = dfs(nextNode, deepth + 1)
        if result != -1 {
            return result
        }
    }
    return -1
}

let answer = dfs(ij[0], 0)
print(answer)