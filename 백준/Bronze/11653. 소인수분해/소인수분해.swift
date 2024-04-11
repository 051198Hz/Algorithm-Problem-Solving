import Foundation

func factorization(n: Int){
    if n == 1 {return}
    var n = n
    var k = 2
    while n>1 {
        if n % k == 0{
            n /= k
            print(k)
        }else{
            k += 1
        }
    }
}

let input = Int(readLine()!)!
factorization(n: input)