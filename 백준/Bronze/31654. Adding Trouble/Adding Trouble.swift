import Foundation
let abc = readLine()!.split{ $0 == " "}.map{ Int($0)! }
let answer = abc[0] + abc[1] == abc[2] ? "correct!" : "wrong!"
print(answer)