let x = Int(readLine()!)!
var sticks: [Int] = [64]
while sticks.reduce(0,+) > x {
    let shortStick = sticks.popLast()!
    let halfStick = shortStick/2
    if sticks.reduce(0,+) + halfStick >= x {
        sticks.append(halfStick)
        continue
    }
    sticks.append(halfStick)
    sticks.append(halfStick)
}
print(sticks.count)