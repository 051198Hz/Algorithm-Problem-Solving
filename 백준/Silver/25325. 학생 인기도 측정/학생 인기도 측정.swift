import Foundation
let n = Int(readLine()!)!
var studs = Dictionary(uniqueKeysWithValues: readLine()!.components(separatedBy: " ").map{ ($0, 0) })
(0..<n).forEach{ _ in
    readLine()!.components(separatedBy: " ").map{ studs[$0]! += 1 }
}
studs.sorted{
    if $0.value == $1.value{ return $0.key < $1.key}
    return $0.value > $1.value
}.forEach{
    print($0,$1)
}