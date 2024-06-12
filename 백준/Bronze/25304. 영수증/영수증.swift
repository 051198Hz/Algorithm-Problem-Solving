let money = Int(readLine()!)!
let n = Int(readLine()!)!
var result = 0
(0..<n).forEach{ _ in
    let priceCount = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
    result += ( priceCount[0] * priceCount[1] )
}
print(money == result ? "Yes" : "No")