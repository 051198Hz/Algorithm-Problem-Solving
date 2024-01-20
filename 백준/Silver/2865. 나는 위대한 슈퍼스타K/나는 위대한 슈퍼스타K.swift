//
//  main.swift
//  exPS
//
//  Created by Yune gim on 2024/01/20.
//

import Foundation

let _inputs = readLine()!.split(separator: " ").map{Int($0)!}
let n = _inputs[0]
let m = _inputs[1]
let k = _inputs[2]
var scores:[Double] = Array(repeating: 0, count: n)
scores.reserveCapacity(n)

for _ in 0..<m{
    let _scoreLine = readLine()!.split(separator: " ").map{Double($0)!}
    for i in stride(from: 0, to: _scoreLine.count-1, by: 2) {
        let idx = Int(_scoreLine[i]) - 1
        let _score = _scoreLine[i+1]
        scores[idx] = _score > scores[idx] ? _score : scores[idx]
    }
}
scores.sort(by: {return $0 > $1})

var result : Double = .zero

for item in scores[0..<k]{
    result += item
}

let digit: Double = pow(10, 1) // 10의 3제곱 4번째자리 반올림
result = round(result * digit) / digit  // 5.123
print( result )

