import Foundation
print(String(format: "%-15s%-15s%-11s%-10s", "SHIP NAME".cstring, "CLASS".cstring, "DEPLOYMENT".cstring, "IN SERVICE".cstring))
print(String(format: "%-15s%-15s%-11s%-10s", "N2 Bomber".cstring,"Heavy Fighter".cstring, "Limited".cstring, "21".cstring))
print(String(format: "%-15s%-15s%-11s%-10s", "J-Type 327".cstring,"Light Combat".cstring, "Unlimited".cstring, "1".cstring))
print(String(format: "%-15s%-15s%-11s%-10s", "NX Cruiser".cstring,"Medium Fighter".cstring, "Limited".cstring, "18".cstring))
print(String(format: "%-15s%-15s%-11s%-10s", "N1 Starfighter".cstring,"Medium Fighter".cstring, "Unlimited".cstring, "25".cstring))
print(String(format: "%-15s%-15s%-11s%-10s", "Royal Cruiser".cstring,"Light Combat".cstring, "Limited".cstring, "4".cstring))

extension String{
    var cstring: UnsafePointer<CChar>{
        (self as NSString).utf8String!
    }
}