import Foundation

var positions:[Int: (Int,Int)] = [:]
var maxValue = Int.min
for i in 1...9{
    var j = 0
    readLine()!.split{ $0 == " " }
    .map{ Int(String($0))! }
    .forEach{ 
        j += 1
        positions.updateValue((i,j), forKey: $0)
        maxValue = max(maxValue, $0)
    }
}
let posMaxValue = positions[maxValue]!
let x = posMaxValue.0, y = posMaxValue.1
print(maxValue)
print(x,y)