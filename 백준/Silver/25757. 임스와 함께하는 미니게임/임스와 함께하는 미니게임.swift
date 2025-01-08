let nk = readLine()!.split { $0 == " " }
var players: Set<String> = []
(0..<Int(nk[0])!).forEach { _ in
    let name = readLine()!
    players.insert(name)
}
let k: Int = {
    switch nk[1] {
    case "Y":
        return 1
    case "F":
        return 2
    default:
        return 3
    }
}()
print(players.count / k)
