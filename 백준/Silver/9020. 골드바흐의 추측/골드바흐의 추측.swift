
import Foundation

// 1. 10000까지의 수를 에라토네스의 체로 걸러 소수만 남기고
// 2. 주어진 수 n을 2..n까지의 소수로 뺀 결과가 소수인지 확인한다.
// 3. 두 수가 소수라면, 소수쌍을 기록한다.
// 4. 기록한 두 소수쌍 중 차가 제일 적은 쌍을 출력한다.

var isPrime = [Bool](repeating: true, count: 10000+1)
isPrime[0] = false
isPrime[1] = false

for i in 2...Int(Double(10000).squareRoot()+1){
    if isPrime[i] {
        var j = 2
        while i * j <= 10000 {
            isPrime[i * j] = false
            j += 1
        }
    }
}

func primePartition(n: Int)->(Int, Int){
    var min = (index:0,value:987654321)
    for i in 2..<n{
        if isPrime[i] && isPrime[n - i] {
            if abs(n-i-i) < min.value {
                min.index = i
                min.value = abs(n-i-i)
            }
        }
    }
    return (min.index,n-min.index)
}

var times = Int(readLine()!)!
while(times != 0){
    let number = Int(readLine()!)!
    let primes = primePartition(n: number)
    print(primes.0,primes.1)
    times -= 1
}
