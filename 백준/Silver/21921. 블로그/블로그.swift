let nx = readLine()!.split{ $0 == " "}.map{Int($0)!}
let visitCount = readLine()!.split{$0==" "}.map{Int($0)!}
var visitPrefixSum = Array<Int>()
for i in visitCount.indices{
    visitPrefixSum.append( visitCount[i] + (visitPrefixSum.last ?? 0) )
}
var max = Int.min
var count = 0
for i in visitPrefixSum.indices where i >= nx[1] - 1 {
    let currentPrefixSum = visitPrefixSum[i] - (i > nx[1] - 1 ? visitPrefixSum[i-nx[1]] : 0)
    if currentPrefixSum > max{
        max = currentPrefixSum
        count = 1
    }else if currentPrefixSum == max{ count += 1}
}
if max == 0{
    print("SAD")
}else{
    print(max)
    print(count)
}