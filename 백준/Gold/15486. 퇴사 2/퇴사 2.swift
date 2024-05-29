import Foundation
let number = Int(readLine()!)!
var t = [Int](repeating: 0, count: number + 1) //소요시간
var p = [Int](repeating: 0, count: number + 1) //이득
var dp = [Int](repeating: 0, count: number + 1)
for i in 0..<number{
    let tp = readLine()!.split{ $0 == " " }.map{ Int($0)! }
    t[i] = tp[0]
    p[i] = tp[1]
}
for i in stride(from: number-1, through: 0, by: -1){
    if t[i] + i > number {
        dp[i] = dp[i+1]
        continue
    }
    dp[i] = max( p[i] + dp[i+t[i]], dp[i+1] )
//    dp[i] = max( p[i] + dp[i+t[i]], dp[i+1] ) -> dp[i+1]에서 인덱스 오류가 발생할 수 있음,
//    마지막값이 if문을 통과하고 이 코드를 실행할 때 t값이 2 이상이면 인덱스 에러가 발생함

}
print(dp[0])