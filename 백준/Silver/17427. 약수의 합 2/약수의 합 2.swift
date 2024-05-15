let om = 1000000
var sums = Array<Int>(repeating:1,count:om+1)
let x = Int(readLine()!)!
if x==1{print(1)}
else{
    var answer=1
    for i in 2...x{
        var j = 1
        while j*i<=om{
            sums[j*i] += i
            j+=1
        }
        answer += sums[i]
    }
    print(answer)
}