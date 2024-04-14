let ps = readLine()!.map{String($0)}

var sticks = Int.zero
var cuts = Int.zero

for i in 0..<ps.count{
    switch ps[i]{
    case ")":
        sticks -= 1
        if ps[i-1] == "("{
            cuts += sticks
        }else{
            cuts += 1
        }
    default:
        sticks += 1
    }
}

print(cuts)