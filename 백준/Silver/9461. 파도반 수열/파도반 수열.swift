let time = Int(readLine()!)!
var fibo = Array<Int>(repeating: 0, count: 101)
fibo[1] = 1
fibo[2] = 1
fibo[3] = 1
for i in fibo.indices where i >= 4{
    fibo[i] = fibo[i-2] + fibo[i-3]
}
while let s = readLine(), let n = Int(s){
    print(fibo[n])
}