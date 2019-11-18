//
//  AccountViewModelMock.swift
//  EOSAccountTests
//
//  Created by Marharyta Lytvynenko on 18.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import Foundation
@testable import EOSAccount

import Domain

class UserUseCaseMock: Domain.UserUseCase {
    
    func user(_ closure: @escaping Callback<User>) {
        let balance = Balance(unstaked: 1234, staked: 4321)
        let net = Сonsumption(used: 123, available: 321, total: 444, type: .s)
        let ram = Сonsumption(used: 123, available: 1321, total: 1444, type: .kb)
        let cpu = Сonsumption(used: 3998, available: 2, total: 4000, type: .kb)
        let userMock = User(fullname: "Test name",
                            netSelfStaked: 100.0012, cpuSelfStaked: 100.0012,
                            balance: balance,
                            net: net, cpu: cpu, ram: ram)
        closure(userMock, nil)
    }
}
