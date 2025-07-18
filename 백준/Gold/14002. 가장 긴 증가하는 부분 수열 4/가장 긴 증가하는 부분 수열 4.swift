let n = Int(readLine()!)!
let s = readLine()!.split { $0 == " " }.map { Int(String($0))! }

// dp[i]: s[i]를 마지막 원소로 하는 가장 긴 증가 부분 수열의 길이
var dp = [Int](repeating: 1, count: n)
// parent[i]: s[i] 앞에 오는 원소의 인덱스 (LIS 구성용)
var parent = [Int](0..<n) // 초기화는 자기 자신을 가리키도록

var maxLength = 0
var lastIndex = 0

if n > 0 {
    maxLength = 1
}

for i in 1..<n {
    for j in 0..<i {
        if s[i] > s[j] {
            if dp[i] < dp[j] + 1 {
                dp[i] = dp[j] + 1
                parent[i] = j // s[i] 앞에 s[j]가 옴
            }
        }
    }
    // 현재까지의 최대 길이와 해당 길이의 마지막 인덱스 갱신
    if dp[i] > maxLength {
        maxLength = dp[i]
        lastIndex = i
    }
}

// LIS 구성
var answer = [Int]()
if maxLength > 0 { // LIS가 존재할 경우에만
    var currentIndex = lastIndex
    while dp[currentIndex] != 1 { // 길이가 1이 될 때까지 역추적
        answer.append(s[currentIndex])
        currentIndex = parent[currentIndex]
    }
    answer.append(s[currentIndex]) // 마지막으로 길이가 1인 원소 추가
}


print(maxLength)
print(answer.reversed().map { "\($0)" }.joined(separator: " "))