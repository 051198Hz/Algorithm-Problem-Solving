import Foundation

func GCD(a: Int, b: Int) -> Int{
    var a = a, b = b
    if a < b{
        swap(&a, &b)
    }
    while(b != 0){
        let n = a%b
        a = b
        b = n
    }
    return a
}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let gcd = GCD(a: input[0], b: input[1])
let lcm = input[0] * input[1] / gcd
print(gcd)
print(lcm)