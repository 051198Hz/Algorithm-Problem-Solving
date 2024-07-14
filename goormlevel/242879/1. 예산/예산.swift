import Foundation

let nm = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let totalPrice = 
let k = (0..<nm[0]).map{ _ in readLine()! }.map{ $0.split{ $0 == " " }.map{ Int(String($0))!} }.map{ $0.reduce(1,*) }.reduce(0,+)
print( nm[1] >= k ? nm[1]-k : "No")
