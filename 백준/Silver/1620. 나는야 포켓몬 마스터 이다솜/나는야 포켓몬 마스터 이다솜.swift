
var inputs = readLine()!.split(separator: " ").map{ Int($0)!}
let n = inputs[0]
let m = inputs[1]
var dictNumKey:[Int:String]=[:]
var dictStringKey:[String:Int]=[:]
for i in 0..<n{
    let name = readLine()!
    dictNumKey.updateValue(name, forKey: i+1)
    dictStringKey.updateValue(i+1, forKey: name)
}
for _ in 0..<m{
    let input = readLine()!
    if let convertedNum = Int(input){
        print(dictNumKey[convertedNum]!)
    }else{
        print(dictStringKey[input]!)
    }
}

