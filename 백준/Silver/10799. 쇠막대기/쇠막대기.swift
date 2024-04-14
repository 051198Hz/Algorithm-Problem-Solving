let ps = readLine()!.map{String($0)}

var sticks = Int.zero
var cuts = Int.zero

for i in 0..<ps.count{
    if ps[i] == "("{
        sticks += 1
    }else{
        sticks -= 1
        if ps[i-1] == "("{
            cuts += sticks
        }else{
            cuts += 1
        }
    }
}

print(cuts)