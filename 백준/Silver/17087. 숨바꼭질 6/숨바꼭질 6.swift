func GCD(a: Int, b: Int) -> Int{
    var a = a, b = b
    while(b != 0){
        let n = a%b
        a = b
        b = n
    }
    return a
}
let ns = readLine()!.split(separator: " ").map{ Int(String($0))!}
let distances = readLine()!.split(separator: " ").map{ abs(Int(String($0))! - ns[1]) }
let answer = distances.reduce(distances.first! ){ GCD(a: $0, b: $1) }
print(answer)