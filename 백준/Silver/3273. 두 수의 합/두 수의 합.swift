let n = Int(readLine()!)!
let numberList = readLine()!.split { $0 == " " }.map { Int(String($0))! }.sorted { $0 < $1 }
let x = Int(readLine()!)!

var start = 0
var end = n-1
var answer = 0

while start < end {
    let sum = numberList[start] + numberList[end]
    if sum == x {
        answer += 1
        start += 1
        end -= 1
        continue
    }
    if sum > x {
        end -= 1
        continue
    }
    if sum < x {
        start += 1
        continue
    }
}
print(answer)
