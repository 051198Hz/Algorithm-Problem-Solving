import Foundation
func getPrimeSet()->[Bool]{
    var isPrime = [Bool](repeating: true, count: 100_000_0+1)
    isPrime[0] = false
    isPrime[1] = false
    for i in 2...Int(Double(100_000_0).squareRoot()+1){
        if isPrime[i] {
            var j = 2
            while i*j < 100_000_0{
                isPrime[i*j] = false
                j += 1
            }
        }
    }
    return isPrime
}


let isPrime = getPrimeSet()

var memo = [Int](repeating: .zero, count: 100_000_0+1)
var input = Int(readLine()!)!

while input != 0 {
    if memo[input] == .zero{
        var result = 0
        for i in stride(from: input, to: 2, by: -1){
            if isPrime[i] && isPrime[input-i]{
                result = i
                memo[input] = result
                break
            }
        }
        print("\(input) = \(input-result) + \(result)")
    }else{
        let i = memo[input]
        print("\(input) = \(input-i) + \(i)")
    }

    input = Int(readLine()!)!
}