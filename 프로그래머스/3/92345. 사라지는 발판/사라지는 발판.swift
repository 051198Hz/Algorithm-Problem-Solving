import Foundation

struct Location {
    var x:Int,y:Int
}

struct GameResult {
    var count:Int,isWinnerA:Bool
}

func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    let wrapBoard = wrapBoardEdges(board)
    let aLoc = Location(x: aloc[0]+1, y: aloc[1]+1)
    let bLoc = Location(x: bloc[0]+1, y: bloc[1]+1)
    let result = move(wrapBoard, 0, aLoc, bLoc)
    return result.count
}

func wrapBoardEdges(_ board:[[Int]]) -> [[Int]] {
    var wrapBoard = board
    for i in 0..<board.count {
        wrapBoard[i].insert(0, at: 0)
        wrapBoard[i].append(0)
    }
    wrapBoard.insert(Array(repeating: 0, count: board[0].count+2), at: 0)
    wrapBoard.append(Array(repeating: 0, count: board[0].count+2))
    return wrapBoard
}

func move(_ board:[[Int]], _ count:Int,_ aLoc:Location,_ bLoc:Location) -> GameResult {
    let isTurnA = count%2 == 0 ? true : false
    let loc = isTurnA ? aLoc : bLoc
    var minCount = Int.max
    var maxCount = 0
    
    if board[loc.x][loc.y] == 0 {
        return GameResult(count: count, isWinnerA: isTurnA)
    }
        
    for l in makeLRUD(loc).filter({board[$0.x][$0.y] != 0}) {
        var newBoard = board
        newBoard[loc.x][loc.y] = 0
        let moved = isTurnA ? move(newBoard,count+1,l,bLoc) : move(newBoard,count+1,aLoc,l)
        let result = isTurnA ? moved.isWinnerA :!moved.isWinnerA
        if result {
            maxCount = max(maxCount,moved.count)
        }else {
            minCount = min(minCount,moved.count)
        }
    }
    
    if minCount == Int.max && maxCount == 0 {
        return GameResult(count: count, isWinnerA: isTurnA)
    }
    
    if minCount != Int.max {
        return GameResult(count: minCount, isWinnerA: !isTurnA)
    }
    
    return GameResult(count: maxCount, isWinnerA: isTurnA)
}

func makeLRUD(_ loc:Location) -> [Location] {
    return [Location(x: loc.x-1, y: loc.y),Location(x: loc.x+1, y: loc.y),Location(x: loc.x, y: loc.y-1),Location(x: loc.x, y: loc.y+1)]
}