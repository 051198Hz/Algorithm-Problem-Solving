func hanoi(n: Int, from: String, through: String, to: String, history: inout String) {
    count += 1
    if n == 1 {
        history.write("\(from) \(to)\n")
        return
    }

    hanoi(n: n-1, from: from, through: to, to: through, history: &history)
    history.write("\(from) \(to)\n")
    hanoi(n: n-1, from: through, through: from, to: to, history: &history)
}

let n = Int(readLine()!)!
var count = 0
var history = ""
hanoi(n: n, from: "1", through: "2", to: "3", history: &history)

print("\(count)\n\(history)")