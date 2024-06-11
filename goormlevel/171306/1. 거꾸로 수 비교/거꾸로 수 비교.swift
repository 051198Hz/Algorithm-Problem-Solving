import Foundation
let strs = readLine()!.split{ $0 == " " }
let revStr1 = String(strs[0].reversed()), revStr2 = String(strs[1].reversed())
if Int(revStr1)! > Int(revStr2)! { print(strs[0]) }
else { print(strs[1]) }