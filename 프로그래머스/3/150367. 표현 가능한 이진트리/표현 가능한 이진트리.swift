import Foundation

// 어떤 정상적인 포화 이진트리에 대해, 루트가 반드시 존재하므로 1이다.
// 루트의 오른쪽 서브트리들이 더미여도, 루트의 순서에 의해 해당 더미노드들이 보존된다.
// 따라서 왼쪽에 패딩한다.

func solution(_ numbers:[Int64]) -> [Int] {
    var answer = [Int]()
    
    for number in numbers {
        let binary = String(number, radix: 2)
        
        var fullSize = 1
        // 포화 이진트리의 노드 수는 2^k - 1
        while fullSize - 1 < binary.count {
            fullSize *= 2
        }
        fullSize -= 1
        
        let pad = String(repeating: "0", count: fullSize - binary.count)
        let binTree = Array(pad + binary)
        let isVailidTree = isValidTree(binTree)
        answer.append(isVailidTree == true ? 1 : 0)
    }
    
    return answer
}

func isValidTree(_ s: [Character]) -> Bool {
    if s.count == 1 { return true } // leaf node
    
    let mid = s.count / 2
    let root = s[mid]
    let left = Array(s[..<mid])
    let right = Array(s[(mid + 1)...])
    
    if root == "0" {
        // 루트가 0이면 자식도 모두 0이어야 함
        if left.contains("1") || right.contains("1") {
            return false
        }
    }
    // 양쪽 서브트리도 각각 검사
    return isValidTree(left) && isValidTree(right)
}