import Foundation
let sing =
#"""
baby sukhwan tururu turu
very cute tururu turu
in bed tururu turu
baby sukhwan
"""#
let arrSing = sing.components(separatedBy: [" ","\n"])
//print(arrSing)
let input = Int(readLine()!)!-1
let repeating = input/14
let idx = input%14

var word = arrSing[idx]
if word.contains("turu"){
    word += String(repeating: "ru", count: repeating)
    let cntRu = word.filter{ $0 == "r"}.count
    if cntRu >= 5{
        word = "tu+ru*\(cntRu)"
    }
}
print(word)