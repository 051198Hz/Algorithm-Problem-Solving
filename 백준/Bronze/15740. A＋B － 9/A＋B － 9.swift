import Foundation
let numbers = readLine()!.split(separator: " ").map{ Decimal(string: String($0))! }
print(numbers[0] + numbers[1])