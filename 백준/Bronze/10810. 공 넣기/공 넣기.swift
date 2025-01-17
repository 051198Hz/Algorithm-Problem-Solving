let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var slots = [Int](repeating: 0, count: nm[0])
(0..<nm[1]).forEach { _ in
    let ijk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    ((ijk[0]-1)...(ijk[1]-1)).forEach { index in
        slots[index] = ijk[2]
    }
}
let answer = slots.map { String($0) }.joined(separator: " ")
print(answer)