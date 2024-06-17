import Foundation

var positions:[Int: (Int,Int)] = [:]
var maxValue = Int.min
var x = 0, y = 0
for i in 1...9{
    var j = 0
    readLine()!.split{ $0 == " " }
    .map{ Int(String($0))! }
    .forEach{ 
        j += 1
        positions.updateValue((i,j), forKey: $0)
        if $0 > maxValue{
            maxValue = $0
            x = i
            y = j
        }
    }
}
print(maxValue)
print(x,y)