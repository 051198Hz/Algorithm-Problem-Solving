import Foundation
var number = Int(readLine()!)!
var serials = [String]()
for _ in 0..<number{
    serials.append(readLine()!)
}
serials.sort(by: compare)
func compare(n1: String, n2:String)->Bool{
    if n1.count < n2.count { return true}
    if n1.count > n2.count { return false}
    if n1.count == n2.count{
        var sumNumberN1 =  0
        var sumNumberN2 = 0
        n1.forEach{ if let number = Int(String($0)){ sumNumberN1 += number} }
        n2.forEach{ if let number = Int(String($0)){ sumNumberN2 += number} }
        if sumNumberN1 < sumNumberN2 { return true }
        if sumNumberN1 > sumNumberN2 { return false }
        for i in n1.indices{
            if n1[i].asciiValue! < n2[i].asciiValue!{ return true }
            if n1[i].asciiValue! > n2[i].asciiValue!{ return false }
        }
    }
    return false
}
serials.forEach{ print($0) }