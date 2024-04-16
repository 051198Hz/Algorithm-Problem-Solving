import Foundation
var probs = 0
_=readLine()!
while(true){
    let str = readLine()!
    switch str{
    case "문제": probs += 1
    case "고무오리": if probs == .zero{
        probs += 2
    }else{
        probs -= 1
    }
    default:
        if probs == .zero{
            print("고무오리야 사랑해")
        }else{
            print("힝구")
        }
        exit(0)
    }
}