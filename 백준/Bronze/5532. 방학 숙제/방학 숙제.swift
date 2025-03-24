let l = Int(readLine()!)!
let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!
let d = Int(readLine()!)!

let p = a/c + (a%c > 0 ? 1 : 0)
let k = b/d + (b%d > 0 ? 1 : 0)
let cost = p > k ? p : k
print(l-cost)