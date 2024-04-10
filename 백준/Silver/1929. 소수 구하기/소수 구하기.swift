import Foundation

///[start, end] 사이의 소수를 출력하는 함수
func getPrimeNumber(start: Int, end: Int){
    let start = start == 1 ? 2 : start
    if end <= 3{
        for i in start...end{
            print(i)
        }
        return
    }
    var numbers = Array(start...end)
    let end = Int(Double(end).squareRoot())
    
    for i in 2...end{
        numbers = numbers.filter{
            !(($0 != i) && ($0 % i == 0))
        }
    }
    numbers.forEach{ print($0) }
}

let input = readLine()!.split(separator: " " ).map { Int(String($0))! }
getPrimeNumber(start: input[0], end: input[1])
