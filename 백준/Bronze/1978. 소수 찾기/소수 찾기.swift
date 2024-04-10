import Foundation

func isPrime(number: Int)->Bool{
    if number == 1 { return false }
    if number == 2 { return true }
    if number == 3 { return true }
    let r = Int(Double(number).squareRoot())
    for i in 2...r{
        if number % i == 0 {return false}
    }
    return true
}
_=readLine()!
let numbers = readLine()!.split(separator: " ").map{ Int(String($0))! }
var count = Int.zero
numbers.forEach{ if isPrime(number: $0) {count+=1} }
print(count)