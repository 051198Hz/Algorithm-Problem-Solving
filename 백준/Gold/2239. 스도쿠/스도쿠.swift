struct Point {
    let r: Int
    let c: Int
}

var grid = [[Int]]()
var emptyPoints = [Point]()

var rowMask = [Int](repeating: 0, count: 9)
var colMask = [Int](repeating: 0, count: 9)
var sectionMask = [Int](repeating: 0, count: 9)

func sectionIndex(_ r: Int, _ c: Int) -> Int {
    return (r / 3) * 3 + (c / 3)
}

// 초기화 및 입력 처리
for i in 0..<9 {
    let line = readLine()!.map { Int(String($0))! }
    grid.append(line)
    for j in 0..<9 {
        let val = line[j]
        if val == 0 {
            emptyPoints.append(Point(r: i, c: j))
        } else {
            let bit = 1 << (val - 1)
            rowMask[i] |= bit
            colMask[j] |= bit
            sectionMask[sectionIndex(i, j)] |= bit
        }
    }
}

func backtracking(_ depth: Int) -> Bool {
    if depth == emptyPoints.count {
        return true
    }
    
    let point = emptyPoints[depth]
    let r = point.r
    let c = point.c
    let s = sectionIndex(r, c)
    
    // 1~9 중에서 놓을 수 있는 숫자 후보 계산 (비트로 표현된 숫자들 중 없는 것)
    let used = rowMask[r] | colMask[c] | sectionMask[s]
    let candidates = (~used) & 0x1FF  // 하위 9비트만 체크
    
    var bit = 1
    for num in 1...9 {
        if (candidates & bit) != 0 {
            // 놓기
            grid[r][c] = num
            rowMask[r] |= bit
            colMask[c] |= bit
            sectionMask[s] |= bit
            
            if backtracking(depth + 1) {
                return true
            }
            
            // 되돌리기
            grid[r][c] = 0
            rowMask[r] &= ~bit
            colMask[c] &= ~bit
            sectionMask[s] &= ~bit
        }
        bit <<= 1
    }
    return false
}

_ = backtracking(0)

// 결과 출력
for r in 0..<9 {
    print(grid[r].map(String.init).joined())
}