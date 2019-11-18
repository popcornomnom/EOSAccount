
import Foundation

public struct Сonsumption {
    
    public typealias T = Double
    
    public enum `Type`: String {
        case s, kb
    }
    
    public let used: T
    public let available: T
    public let total: T
    public let type: Type

    public init(used: T, available: T? = nil, total: T, type: Type) {
        self.used = used
        self.available = available ?? (total - used)
        self.total = total
        self.type = type
    }
    
    public var usagePercentage: Int {
        return Int(used * 100 / total)
    }    
}
