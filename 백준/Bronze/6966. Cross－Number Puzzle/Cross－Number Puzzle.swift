import Foundation

func isPerfectNumber(_ n: Int) -> Bool {
    let sum = (1...Int(floor(Double(n).squareRoot()))).reduce(0) { partialResult, number in
        guard n % number == 0 else {
            return partialResult
        }
        let a = n/number
        let b = number
        guard a != b else { return partialResult + a }
        return partialResult + a + b
    } - n
    return sum == n
}
func isAmstrongNumber(_ origin: Int) -> Bool {
    var n = origin
    var digitList = [Int]()
    var divisor = 100
    while divisor > 0 {
        let number = n / divisor
        digitList.append(number)
        n = n % divisor
        divisor /= 10
    }
    
    let sum = digitList.reduce(0) { partialResult, number in
        return partialResult + (number*number*number)
    }
    return sum == origin
}
let a1 = (100...999).filter { isAmstrongNumber($0) }.map { String($0) }.joined(separator: " ")
let answer = (1000...9999).filter { isPerfectNumber($0) }.map { String($0) }.joined(separator: " ")
print(answer)
print(a1)