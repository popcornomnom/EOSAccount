
import Foundation

public struct ExchangeRate {

    public typealias T = Double
    
    public let ask: T
    public let bid: T
    public let last: T
    public let high: T
    public let low: T
    
    public init(ask: T, bid: T, last: T, high: T, low: T) {
        self.ask = ask
        self.bid = bid
        self.last = last
        self.high = high
        self.low = low
    }
}
