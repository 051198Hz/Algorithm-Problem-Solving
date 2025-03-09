let endTime = readLine()!.split { $0 == " " }.map { Int(String($0))! },
    endH = endTime[0],
    endM = endTime[1]

let startH = 9,
    startM = 0

print(endH*60 - startH*60 + endM)