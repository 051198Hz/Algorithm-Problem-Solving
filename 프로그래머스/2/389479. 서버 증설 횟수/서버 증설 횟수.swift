import Foundation
func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    /// m명 늘어날 때 마다 서버 1대가 추가로 필요함
    /// 어느 시간대의 이용자가 m명 미만이라면 서버증설 필요 X
    /// 증설한 서버는 k시간동안 운영하고 반납함. ex) k = 5이면, 10~15까지 운영 가능
    
    /// 하루동안 모든 게임 이용자가 게임을 하기 위해 서버를 최소 몇번 증설해야 하는가?
    /// 같은 시간대에 서버를 n대 증설했다면 해당 시간대의 증설 횟수는 n회이다.
    
    // 서버 한 대로 감당할 수 있는 최대 이용자의 수를 나타내는 정수 m
    var addingServerCount = 0
    var currentServerCount = 0
    //이 부분을 하나의 변수로 두지 말고
    var remainingServerList = [(Int, Int)](repeating: (0, 0), count: players.count)
    // 플레이어스를 순회할 때 addingServerList내의 모든 값들을 1씩 줄인다.
    // 단, 0이라면 더이상 줄이지 않는다. max(-1, addingServerList[i]-1)
    for time in players.indices {
        let playerCount = players[time]
        if playerCount > currentServerCount * m + (m-1) {
            let overdPlayerCount = playerCount - (m-1) - (currentServerCount * m)
            let serverCount = overdPlayerCount / m
            let isOver = overdPlayerCount % m > 0 ? 1 : 0
            remainingServerList[time] = (serverCount + isOver, k)
            addingServerCount += serverCount + isOver
            currentServerCount += serverCount + isOver
        }
        
        (0...time).forEach { i in
            let currentServerInfo = remainingServerList[i]
            if currentServerInfo.0 == 0 || currentServerInfo.1 == 0 { return }
            let nextRemainTime = currentServerInfo.1 - 1
            if nextRemainTime == 0 {
                currentServerCount -= currentServerInfo.0
            }
            remainingServerList[i] = (currentServerInfo.0, nextRemainTime)
        }
    }
    return addingServerCount
}