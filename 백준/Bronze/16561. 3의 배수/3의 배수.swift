func solution(n: Int)->Int{
    if n == 1 || n == 2 {return 0}
    var answer = 0
    for i in 1...n-2{
        answer += i
    }
    return answer
}
print(solution(n: Int(readLine()!)!/3))