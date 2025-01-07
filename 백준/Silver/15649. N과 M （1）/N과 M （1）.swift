let mn = readLine()!.split{ $0 == " " }.map { Int(String($0))! }

func combination(_ s: [Int], _ selected: [Int], limit: Int) {
    if selected.count == limit {
        print(selected.reduce(""){$0 + "\($1) "})
        return
    }
    for i in s where !selected.contains(i){
        combination(s, selected + [i], limit: limit)
    }
}

combination(Array(1...mn[0]),[], limit: mn[1])
