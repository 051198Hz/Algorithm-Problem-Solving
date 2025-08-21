let n = Int(readLine()!)!
let k = Int(readLine()!)!

let sensors = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted { $0 < $1 }
var distances = [Int]()
for i in 1..<n {
    let distance = sensors[i] - sensors[i-1]
    distances.append(distance)
}

let answer = distances.reduce(0, +) - distances.sorted { $0 > $1 }.prefix(k-1).reduce(0, +)
print(answer)