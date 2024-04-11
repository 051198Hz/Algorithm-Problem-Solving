var isPrime = [Bool](repeating: true, count: 1_000_000 + 1)
isPrime[0] = false
isPrime[1] = false
for i in 2...Int(Double(1_000_000).squareRoot()+1){
    if isPrime[i] {
        var j = i*i
        while j <= 1_000_000{
            isPrime[j] = false
            j += i
        }
    }
}

let times = Int(readLine()!)!

for _ in 0..<times{
    let number = Int(readLine()!)!
//    var visited = [Bool](repeating: false, count: 1_000_000+1)
    var cnt = 0
    for i in stride(from: number, through: 0, by: -1){
        if isPrime[i] && isPrime[number-i]{
            cnt += 1
        }else if(i <= number/2){
            break
        }
    }
    print(cnt)
}