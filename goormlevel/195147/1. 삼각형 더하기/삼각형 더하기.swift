import Foundation
// 두 점 사이의 거리를 계산하는 함수
func distance(_ p1: Point, _ p2: Point) -> Double {
    let dx = Double(p1.x - p2.x)
    let dy = Double(p1.y - p2.y)
    return sqrt(dx * dx + dy * dy)
}
// 주어진 세 점에서 직각이등변삼각형의 직각 꼭짓점을 찾는 함수
func findRightAngleVertex(_ points: [Point]) -> (Point, Int, Point, Point) {
    let p1 = points[0]
    let p2 = points[1]
    let p3 = points[2]
    let d12 = distance(p1, p2)
    let d23 = distance(p2, p3)
    let d31 = distance(p3, p1)
    // 직각이등변삼각형의 직각 꼭짓점은 두 변의 길이가 같은 두 점에서의 길이이다.
    if d12 == d23 {
        return (p2, Int(d12), p1, p3)
    } else if d23 == d31 {
        return (p3, Int(d23), p1, p2)
    } else if d31 == d12 {
        return (p1, Int(d31), p2, p3)
    }
    return (Point(-1,-1), -1,Point(-1,-1),Point(-1,-1))
}
func findUpDownDirectionWithPoints(_ p1: Point, _ p2: Point, _ p3: Point)->DirectionUD{
    var targetPoint: Point
    if p1.x == p2.x{
        targetPoint = p2
    }else{
        targetPoint = p3
    }
    var directionUD: DirectionUD
    if p1.y - targetPoint.y > 0{
        directionUD = .up
    }else{
        directionUD = .down
    }
    return directionUD
}
func findLeftRightDirectionWithPoints(_ p1: Point, _ p2: Point, _ p3: Point)->DirectionLR{
    var targetPoint: Point
    if p1.y == p2.y{
        targetPoint = p2
    }else{
        targetPoint = p3
    }
    var directionLR: DirectionLR
    if p1.x - targetPoint.x > 0{
        directionLR = .left
    }else{
        directionLR = .right
    }
    return directionLR
}
enum DirectionUD{
    case up
    case down
}
enum DirectionLR{
    case left
    case right
}
struct Point{
    let x: Int
    let y: Int
    init(_ x: Int, _ y: Int){
        self.x = x
        self.y = y
    }
}
struct Tri{
    let startX: Int
    let startY: Int
    let length: Int
    let upDown: DirectionUD
    let leftRight: DirectionLR
    init(_ point: [Int]){
        var vertax: [Point] = []
        for i in stride(from: 0, to: 5, by: 2){
            vertax.append( Point(point[i+1], point[i]) )
        }
        let (startPoint, length, p1, p2) = findRightAngleVertex(vertax)
        self.length = length
        let directionUD = findUpDownDirectionWithPoints(startPoint, p1, p2)
        let directionLR = findLeftRightDirectionWithPoints(startPoint, p1, p2)
        self.upDown = directionUD
        self.leftRight = directionLR
        startX = startPoint.x
        startY = startPoint.y
    }
    func getArea()->Int{
        var area: Int = 0
        
        let stepY = (self.upDown == .down ? 1 : -1)
        let objectY = (self.upDown == .down ? length : -1 * length)
        
        var startX = (self.leftRight == .left ? -1*length : length)
        let stepX = (self.leftRight == .left ? 1 : -1)
        let objectX = 0
        
        for i in stride(from: 0, through: objectY, by: stepY){
            let cy = self.startY + i
            for j in stride(from: startX, through: objectX , by: stepX){
                let cx = self.startX + j
                area += grid[cy][cx]
            }
            if startX > 0 { startX -= 1}
            else { startX += 1}
        }
        return area
    }
}
let nq = readLine()!.split{ $0 == " " }.map{ Int(String($0))! }
let n = nq[0], q = nq[1]
let grid = (0..<n).map{ _ in
                    readLine()!.split{$0 == " "}.map{ Int(String($0))! }
                     }
let triPos = (0..<q).map{ _ in
                    readLine()!.split{$0 == " "}.map{Int(String($0))! - 1 }
                     }
triPos.forEach{
    let tri = Tri($0)
    let area = tri.getArea()
    print(area)
}
