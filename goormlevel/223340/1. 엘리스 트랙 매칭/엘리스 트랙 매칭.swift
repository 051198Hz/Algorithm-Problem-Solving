let n = Int(readLine()!)!
var attendCount: [String:Int] = [:]
["C","S","I","A"].forEach{ attendCount.updateValue(0 ,forKey:$0) }
let friendTracks = readLine()!.split{ $0 == " " }.map{ String($0) }
let targetTrack = readLine()!
friendTracks.forEach{ attendCount[$0]! += 1 }
print(attendCount[targetTrack]!)