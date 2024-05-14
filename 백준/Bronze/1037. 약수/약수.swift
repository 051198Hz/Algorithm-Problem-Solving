let count = Int(readLine()!)!
let divs = readLine()!.split{ $0 == " " }.map{ Int($0)! }
print(divs.max()!*divs.min()!)