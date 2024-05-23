struct Tile{
    var dp = [Int](repeating:0, count:1001)
    init(){
        dp[1] = 1
        dp[2] = 2
    }
    mutating func tiling(_ number: Int)->Int{
        for i in 3...number{ dp[i] = (dp[i-1] + dp[i-2]) % 10007 }
        return dp[number]
    }
}
var tile = Tile()
var number = Int(readLine()!)!
if number <= 2 { print( tile.dp[number]) }
else{ print(tile.tiling(number)) }