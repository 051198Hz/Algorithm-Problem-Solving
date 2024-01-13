import Foundation

for _ in 0..<Int(readLine()!)!{
    var n = Int(readLine()!)!
    var result:String = "1"
    var i: Int = 2
    while( i < 10){
        if(n % i == 0){
            if( (result.last!.wholeNumberValue!) * i <= 9){
                let c : String = "\((result.last!.wholeNumberValue!) * i)"
                _ = result.removeLast()
                result += c
            }else{
                result += "\(i)"
            }
            n /= i
            i = 1
        }
        i += 1
    }
    if( n == 1){
        print(result.count)
    }else{
        print(-1)
    }
}
