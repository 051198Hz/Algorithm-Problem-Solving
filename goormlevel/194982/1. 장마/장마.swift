struct Rain{
    var str = String()
    let n: Int
    let m: Int
    //n 집개수 m 장마기간
			var heights: [Int] = []
			var isRained: Set<Int> = []
    mutating func rainy(){
			heights = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
        for i in 1...m{
            let rangeRain = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
            for i in rangeRain[0]...rangeRain[1]{
                heights[i-1] += 1
                isRained.insert(i-1)
            }
            if i%3 == 0{
                for i in isRained{
                    heights[i] -= 1
                }
                isRained = Set<Int>()
            }
        }
        for i in 0..<n{  
					str.write(String(heights[i]))
					str.write(" ")
				}
    }
}

let nm = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
var rain = Rain(n: nm[0], m: nm[1])
rain.rainy()
print(rain.str)