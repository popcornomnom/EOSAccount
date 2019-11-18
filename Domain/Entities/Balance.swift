
import Foundation

public struct Balance {
    
    public let unstaked: Double
    public let staked: Double
    public var total: Double {
        return unstaked + staked
    }
    
    public let toUsdExchange: ExchangeRate?
    
    public init(unstaked: Double, staked: Double,
                toUsdExchange: ExchangeRate? = nil) {
        self.unstaked = unstaked
        self.staked = staked
        self.toUsdExchange = toUsdExchange
    }
}
