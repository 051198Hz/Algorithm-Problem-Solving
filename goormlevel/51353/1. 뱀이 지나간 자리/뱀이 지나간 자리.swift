let nm = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nm[0], m = nm[1]
var grid = [String](repeating: String(repeating: ".", count: m), count: n)
var isEven = true
var isLeft = true
let notFootprint = String(repeating: ".", count: m-1)
let Footprint = String(repeating: "#", count: m) 
for i in 0..<n{
	if isEven{ 
		grid[i] = Footprint
		isEven.toggle()
		continue
	}else{
		if isLeft{
			grid[i] = notFootprint + "#" 
		}else{
			grid[i] = "#" + notFootprint
		}
		isLeft.toggle()
		isEven.toggle()
	}
}
grid.forEach{ print($0) }