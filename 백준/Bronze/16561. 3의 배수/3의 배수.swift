func solution(n: Int)->Int{
    let n = n/3
    if n == 1 {return 0}
    if n == 2 {return 0}
    var answer = 0
    for i in 1...n-2{
        answer += i
    }
    return answer
}

let number = Int(readLine()!)!
let result = solution(n: number)
print(result)