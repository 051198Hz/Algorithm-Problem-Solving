let n = Int(readLine()!)!
var child = [Bool](repeating: false, count: n+1)
var tree = (0...n).map { i in Node(v: i) }
var levels = [Int](repeating: 0, count: n)
var maxColLevel = [Int:Int]()
var minColLevel = [Int:Int]()

for _ in 0..<n {
    let glr = readLine()!.split { $0 == " " }.map { Int(String($0))! },
        g = glr[0],
        l = glr[1],
        r = glr[2]
    if l != -1 {
        tree[g].left = l
        child[l] = true
    }
    if r != -1 {
        tree[g].right = r
        child[r] = true
    }
}

let rootNode = (1...n).filter { child[$0] == false }.first!

var colPos = -1

dfs(rootNode, 1)

var level = 0
var width = 0

for key in maxColLevel.keys {
    let levelWidth = maxColLevel[key]! - minColLevel[key]! + 1
    if levelWidth == width, level > key {
        level = key
        width = levelWidth
        continue
    }
    if levelWidth > width {
        level = key
        width = levelWidth
    }
}

print(level, width)

// 깊이우선탐색으로 레벨별 너비를 구한다.
func dfs(_ current: Int, _ level: Int) {
    if let left = tree[current].left {
        dfs(left, level + 1)
    }
    
    colPos += 1
    levels[colPos] = level
    
    maxColLevel[level, default: Int.min] = colPos > maxColLevel[level, default: Int.min] ? colPos : maxColLevel[level, default: Int.min]
    minColLevel[level, default: Int.max] = colPos < minColLevel[level, default: Int.max] ? colPos : minColLevel[level, default: Int.max]
    
    if let right = tree[current].right {
        dfs(right, level + 1)
    }
}

class Node {
    init(v: Int, left: Int? = nil, right: Int? = nil) {
        self.v = v
        self.left = left
        self.right = right
    }
    let v: Int
    var left: Int?
    var right: Int?
}