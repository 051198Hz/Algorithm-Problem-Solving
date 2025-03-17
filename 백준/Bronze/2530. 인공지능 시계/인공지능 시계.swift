let currentHMS = readLine()!.split { $0 == " " }.map { Int(String($0))! }, 
    curH = currentHMS[0], 
    curM = currentHMS[1],
    curS = currentHMS[2]
let duration = Int(readLine()!)!

let currentS = curH*3600 + curM*60 + curS
var nextS = (currentS + duration) % (24*3600)
let nextH = nextS/3600
nextS %= 3600
let nextM = nextS/60
nextS %= 60
print(nextH, nextM, nextS)