import Foundation

struct Block{
	internal typealias Name = String.Element
	let name: Name
	let count: Int
	init(_ name: Name, _ count: Int = 1){
		self.name = name
		self.count = count
	}
}
let nm = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nm[0], m = nm[1]

var stack = [Block]()
let blocks = readLine()!

for i in blocks.indices{
	if stack.isEmpty{
		stack.append( Block(blocks[i]) )
		continue
	}
	if stack.last!.name != blocks[i]{
		let repeatCount = stack.last!.count
			if repeatCount >= m{ (0..<repeatCount).forEach{ _ in stack.removeLast() } }
	}
	if (!stack.isEmpty) && stack.last!.name == blocks[i]{
		let count = stack.last!.count + 1
		stack.append( Block(blocks[i], count))
		continue
	}
	stack.append( Block(blocks[i]) )
}
if !stack.isEmpty{
	let repeatCount = stack.last!.count
	if repeatCount >= m{ (0..<repeatCount).forEach{ _ in stack.removeLast() } }
}
print( stack.isEmpty ? "CLEAR!" : String(stack.map{ $0.name }) )

// 1. 블록의 첫 문자열부터 차례대로 스택에 append 한다.
//스택이 비어있다면, 스택에 push한다.
// 스택이 비어있지 않다면, 스택의 마지막 블록을 확인하여 이름이 같은지 확인한다.
// 이름이 같다면, let count = 마지막 블록.count + 1
// count == m이라면, 마지막 블록이 더이상 같은 종류가 아닐 때 까지 pop한다.
// count != m이라면, 스택에 push한다.
// 이름이 같지 않다면, append한다.
// 스택이 비어있다면, clear!를 출력한다.
// 그렇지 않다면, 스택을 뒤집어 출력한다.