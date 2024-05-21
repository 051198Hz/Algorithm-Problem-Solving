let time = Int(readLine()!)!
var fibo: [(Int, Int)] = Array<(Int, Int)>(repeating: (0,0), count: 41)
fibo[0] = (1,0)
fibo[1] = (0,1)
for i in fibo.indices where i >= 2{
    fibo[i] = fibo[i-1] + fibo[i-2]
}
while let s = readLine(), let n = Int(s){
    print(fibo[n].0,fibo[n].1)
}
func +(left: (Int, Int), right: (Int,Int))->(Int,Int){
    return (left.0 + right.0, left.1 + right.1)
}