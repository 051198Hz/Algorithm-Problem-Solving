import Foundation

func recursion(s: [String], l: Int, r: Int, depth: Int) {
    if l >= r {
        let answer = "\(1) \(depth+1)\n"
        dp[s] = answer
        print("\(1) \(depth+1)")
    } else if s[l] != s[r] {
        let answer = "\(0) \(depth+1)\n"
        dp[s] = answer
        print("\(0) \(depth+1)")
    } else {
        return recursion(s: s, l: l+1, r: r-1, depth: depth+1)
    }
}

func isPalindrome(s: [String]) {
    return recursion(s: s, l: 0, r: s.count-1, depth: 0)
}

let n = Int(readLine()!)!

var dp = [[String]: String]()
var totalAnswer = ""
(0..<n).forEach { _ in
    let s = readLine()!.map { String($0) }
    if let answer = dp[s] {
        totalAnswer.write(answer)
        return
    }
    isPalindrome(s: s)
}