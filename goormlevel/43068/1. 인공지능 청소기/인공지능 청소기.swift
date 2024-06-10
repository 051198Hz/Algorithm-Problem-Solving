import Foundation

let times = Int(readLine()!)!

// let dx = [0,0,-1,1]
// let dy = [-1,1,0,0]
// let min = Int(pow(-10.0,9.0))
// let max = Int(pow(10.0,9.0))

// func DFS(_ x: Int, _ y: Int, _ tx: Int, _ ty: Int, _ depth: Int, _ n: Int)->Bool{
    
//     if y < min || y > max || x < min || x > max {
//         return false
//     }
    
//     if depth > n{
//         return false
//     }
    
//     if depth == n{
//         if x == tx && y == ty { return true }
//         return false
//     }
    
//     for i in 0..<4{
//         if DFS(x+dx[i], y+dy[i], tx, ty, depth + 1, n) {
//             return true
//         }
//     }
    
//     return false
// }
for _ in 0..<times {
	  let xyn = readLine()!.split{$0 == " " }.map{ Int($0)! }
    let x = xyn[0], y = xyn[1], n = xyn[2]
		let minDist = abs(x) + abs(y)
		if minDist > n{
			print("NO")
			continue
		}
		if minDist%2 == 0{
			if n%2 == 0 { print("YES")}
			else { print("NO") }
		}else{
			if n%2 == 1 { print("YES")}
			else { print("NO") }
		}
}