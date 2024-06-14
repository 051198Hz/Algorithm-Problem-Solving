import Foundation 
var name = readLine()!.map{ String($0) }
var newName = [String]()
if name.count == 2{
	newName = name.sorted(by: <)
	newName.removeLast()
}else{
	var isRemoveLast = true
	for i in 0..<name.count-1{
		if name[i] > name[i+1]{
			name.remove(at:i)
			isRemoveLast = false
			break
		}
	}
	if isRemoveLast { name.removeLast() }
	newName = name
}

print( newName.joined() )