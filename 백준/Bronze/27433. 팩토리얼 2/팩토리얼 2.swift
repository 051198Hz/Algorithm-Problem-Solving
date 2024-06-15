func factorial(_ n: Int)->Int{
   if n == 0 { return 1}
   if n == 1 { return 1 }
   let k = factorial(n-1)
   return n*k
}
let n = Int(readLine()!)!
let answer = factorial(n)
print(answer)