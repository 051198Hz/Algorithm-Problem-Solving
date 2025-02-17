let n = Int(readLine()!)!
var m = n
var answer = 0
repeat {
    answer += 1
    let k = m < 10 ? m : (m/10 + m%10)
    m = (m%10 * 10) + k%10
} while n != m
print(answer)