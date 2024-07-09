import Foundation

struct Info{
    let number: Int
    let order: String
}
struct Board{
    var info: [[Info]] = []
}
extension Board{
    mutating func givenBoard(_ infos: [[String]]){
        var board: [[Info]] = []
        for line in infos{
            var lineInfo: [Info] = []
            for place in line{
							let number = Int(place.filter{ $0.isNumber})!
							let order = place.filter{ $0.isLetter}.map{ String($0) }.first!
							//칸에 적혀있는 숫자가 두자리 이상일 수 있음
                lineInfo.append(Info(number: number, order: order))
            }
            board.append(lineInfo)
        }
        self.info = board
    }
}
//보드판 크기와 플레이어 정보를 받아오기 위한 셋팅
let boardSize = Int(readLine()!)!
var playersInitXY = [[Int]]()
var playerScores = [1,1]
var playersName = ["goorm", "player"]
//플레이어들 정보 입력
let gxy = readLine()!.split{ $0 == " " }.map{ Int(String($0))! - 1 }
playersInitXY.append(gxy)
let pxy = readLine()!.split{ $0 == " " }.map{ Int(String($0))! - 1 }
playersInitXY.append(pxy)
//보드 만들기
var boardInfo: [[String]] = []
for _ in 0..<boardSize{
    let line: [String] = readLine()!.split{$0 == " "}.map{ String($0) }
    boardInfo.append(line)
}
var board = Board()
board.givenBoard(boardInfo)
let dy = ["L":0, "D":1, "R":0, "U":-1]
let dx = ["L":-1, "D":0, "R":1, "U":0]

game: for i in 0..<2{
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: boardSize), count: boardSize)
    var currentY = playersInitXY[i][0], currentX = playersInitXY[i][1]
	  isVisited[currentY][currentX] = true
    var currentDirect = ""
    var moveCount = 0
    while true{
        moveCount = board.info[currentY][currentX].number
        currentDirect = board.info[currentY][currentX].order
        for _ in 0..<moveCount{
            var nextY = currentY + dy[currentDirect]!
            var nextX = currentX + dx[currentDirect]!
            //게임판을 넘어섰을 때
            if nextY < 0 { nextY = boardSize-1 }
            else if nextY > boardSize-1 { nextY = 0 }
            else if nextX < 0 { nextX = boardSize-1 }
            else if nextX > boardSize-1 { nextX = 0 }
            if isVisited[nextY][nextX] == true { continue game }
            playerScores[i] += 1
            currentY = nextY
            currentX = nextX
            isVisited[currentY][currentX] = true
        }
    }
}

print(playerScores[0] > playerScores[1] ? "\(playersName[0]) \(playerScores[0])" : "\(playersName[1]) \(playerScores[1])")
