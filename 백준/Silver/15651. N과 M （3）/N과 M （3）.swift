let mn = readLine()!.split{ $0 == " " }.map { Int(String($0))! }

var answer = ""

func combination(_ s: [Int], _ selected: String, limit: Int, count: Int) {
    if count == limit {
        answer.write(selected + "\n")
        return
    }
    for i in s {
        combination(s, selected + "\(i) ", limit: limit, count: count+1)
    }
}

combination(Array(1...mn[0]),"", limit: mn[1], count: 0)
print(answer)
