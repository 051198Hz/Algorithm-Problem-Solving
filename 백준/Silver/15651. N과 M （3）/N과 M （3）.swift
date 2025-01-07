let mn = readLine()!.split{ $0 == " " }.map { Int(String($0))! }

var answer = ""

func combination(_ s: String, _ selected: String, limit: Int, count: Int) {
    if count == limit {
        answer.write(selected + "\n")
        return
    }
    for i in s {
        combination(s, selected + "\(i) ", limit: limit, count: count+1)
    }
}
let s = (1...mn[0]).map{ String($0) }.reduce("",+)
combination( s,"", limit: mn[1], count: 0)
print(answer)
