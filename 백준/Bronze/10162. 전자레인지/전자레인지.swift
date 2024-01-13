import Foundation

let btns:[Int] = [300,60,10]
var pressTime:[Int] = [0,0,0]
let n = Int(readLine()!)!
var rest:Int = n
for i in 0..<btns.count{ //0부터 5까지
    pressTime[i] = rest / btns[i]
    rest %= btns[i]
}
if( rest == 0){
    for item in pressTime{
        print(item, terminator: " ")
    }
}else{
    print(-1)
}
