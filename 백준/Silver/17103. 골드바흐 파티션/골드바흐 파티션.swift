var isPrime = [Bool](repeating: true, count: 1_000_000 + 1)
var primeArry = [Int]()
isPrime[0] = false
isPrime[1] = false
for i in 2...1000000 where isPrime[i] == true{
    primeArry.append(i)
    for j in stride(from: i*i, through: 1_000_000, by: i){
        isPrime[j] = false
    }
}

let times = Int(readLine()!)!

for _ in 0..<times{
    let number = Int(readLine()!)!
//    var visited = [Bool](repeating: false, count: 1_000_000+1)
    var cnt = 0
    for prime in primeArry.reversed() where prime <= number && isPrime[number - prime] {
        if number - prime > prime { break }
        cnt+=1
    }
//    for i in stride(from: number, through: 0, by: -1){
//        if isPrime[i] && isPrime[number-i]{
//            cnt += 1
//        }else if(i <= number/2){
//            break
//        }
//    }
    print(cnt)
}