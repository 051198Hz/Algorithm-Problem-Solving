let xywh = readLine()!.split { $0 == " " }.map { Int(String($0))! }, 
    x = xywh[0],
    y = xywh[1],
    w = xywh[2],
    h = xywh[3]
let minX = min(x - 0, w - x)
let minY = min(y - 0, h - y)
let minDist = min(minX, minY)
print(minDist)