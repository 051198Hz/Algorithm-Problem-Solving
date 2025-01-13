let hhmm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let duration = Int(readLine()!)!
let startTime = (hhmm[0]*60) + hhmm[1]
let endhh = ((startTime + duration) / 60) % 24
let endmm = ((startTime + duration) % 60)
print("\(endhh) \(endmm)")