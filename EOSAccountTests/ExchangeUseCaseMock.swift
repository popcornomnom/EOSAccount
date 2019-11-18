//
//  File.swift
//  EOSAccountTests
//
//  Created by Marharyta Lytvynenko on 18.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import Foundation
@testable import EOSAccount

import Domain

class ExchangeUseCaseMock: Domain.ExchangeUseCase {
    
    func rate(_ closure: @escaping Callback<ExchangeRate>) {
        let rateMock = ExchangeRate(ask: 3.2, bid: 3.2,
                                    last: 3.32, high: 3.52,
                                    low: 3.1)
        closure(rateMock, nil)
    }
}
