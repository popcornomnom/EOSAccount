
import Foundation

public protocol UserType: class {
    var fullname: String { get }
    var balance: Balance { get }
    var net: Сonsumption { get }
    var ram: Сonsumption { get }
    var cpu: Сonsumption { get }
    var netSelfStaked: Double { get }
    var cpuSelfStaked: Double { get }
}

final public class User: UserType {
    
    public let fullname: String

    public let balance: Balance

    public let net: Сonsumption
    public let ram: Сonsumption
    public let cpu: Сonsumption
    
    public let netSelfStaked: Double
    public let cpuSelfStaked: Double
    
    public init(fullname: String,
                netSelfStaked: Double, cpuSelfStaked: Double,
                balance: Balance,
                net: Сonsumption, cpu: Сonsumption, ram: Сonsumption) {
        self.fullname = fullname
        self.net = net
        self.cpu = cpu
        self.ram = ram
        self.netSelfStaked = netSelfStaked
        self.cpuSelfStaked = cpuSelfStaked
        self.balance = balance
    }
}
