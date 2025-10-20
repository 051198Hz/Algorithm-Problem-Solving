let t = Int(readLine()!)!
var answer = ""

for _ in 0..<t {
    
    let n = Int(readLine()!)!
    let preorder = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    let inorder = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    var inorderIndexMap = [Int](repeating: 0, count: n+1)
    
    var preorderIndex = 0
    
    for i in 0..<n {
        let number = inorder[i]
        inorderIndexMap[number] = i
    }
    
    let postorder = build(0, n-1)
    
    answer += postorder + "\n"
    
    func build(_ inorderL: Int, _ inorderR: Int) -> String {
        guard inorderL <= inorderR else { return "" }
        
        var result = ""
        
        let root = preorder[preorderIndex]
        preorderIndex += 1

        let rootIdx = inorderIndexMap[root]
        
        result += build(inorderL, rootIdx - 1) // left
        result += build(rootIdx + 1, inorderR) // right

        result.append("\(root) ")
        
        return result
    }
}

print(answer)