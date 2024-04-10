import Foundation

var isPrime = [Bool](repeating: true, count: 246_913)

isPrime[0] = false
isPrime[1] = false

for i in 0..<Int(Double(246_912).squareRoot() + 1 ){
    if isPrime[i] {
        var j = 2
        while i * j <= 246_912 {
            isPrime[ i * j ] = false
            j += 1
        }
        
    }
}

var input = Int(readLine()!)!

while(input != 0){
    print(isPrime[input+1...input*2].filter{ $0 }.count)
    input = Int(readLine()!)!
}