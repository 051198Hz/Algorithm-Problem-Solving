let n = Int(readLine()!)!
typealias Peep = (weight: Int, tall: Int)
let peeps: [Peep] = (0..<n).map { _ in
    let wt = readLine()!.split{ $0 == " " }.map { Int(String($0))! }
    return Peep(wt[0], wt[1])
}
var answer = ""
for curPeep in peeps {
    var order = 1
    for peep in peeps {
        guard peep.tall > curPeep.tall && peep.weight > curPeep.weight else { continue }
        order += 1
    }
    answer.write("\(order) ")
}
print(answer)
