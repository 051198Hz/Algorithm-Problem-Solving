let burgerPrice = (0..<3).map { _ in Int(readLine()!)! }.min()!
let drinkPrice = (0..<2).map { _ in Int(readLine()!)! }.min()!
let answer = burgerPrice + drinkPrice - 50
print(answer)