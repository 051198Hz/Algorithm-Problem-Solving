let n = Int(readLine()!)!
let m = Int(readLine()!)!
let str = readLine()!.map { String($0) }

var i = 0, 
    count = 0, 
    answer = 0

while i+2 < m {
    if str[i...i+2] == ["I", "O", "I"] {
        count += 1
        if count >= n {
            answer += 1
            i += 2
            continue
        }
        i += 2
        continue
    }
    i += 1
    count = 0
}

print(answer)