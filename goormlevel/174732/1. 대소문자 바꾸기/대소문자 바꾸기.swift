import Foundation
_ = readLine()!
let input = readLine()!
input.forEach{
if $0.isUppercase{ print($0.lowercased(), terminator:"") }
else { print($0.uppercased(), terminator:"") }
}