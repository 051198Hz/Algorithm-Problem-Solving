let n = Int(readLine()!)!
var levels:[Int] = []

for _ in 0..<n{
    levels.append(Int(readLine()!)!)
}
var sum = 0;

for i in stride(from: levels.count-2, through: 0, by: -1){
    if levels[i] >= levels[i+1] {
        let diff = levels[i] - levels[i+1] + 1
        levels[i] -= diff
        sum += diff
    }
}
print(sum)