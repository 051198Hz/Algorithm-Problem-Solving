let number = Int(readLine()!)!
func fibo()->[Int]{
    var fibo = Array<Int>(repeating:0, count:51)
    fibo[0] = 0
    fibo[1] = 1
    for i in fibo.indices where i>1{
        fibo[i] = fibo[i-1] + fibo[i-2]
    }
    return fibo
}
print(fibo()[number])