//
//  ExchangeUseCaseEmptyMock.swift
//  EOSAccountTests
//
//  Created by Marharyta Lytvynenko on 18.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import Foundation
@testable import EOSAccount

import Domain

class ExchangeUseCaseEmptyMock: Domain.ExchangeUseCase {
    
    func rate(_ closure: @escaping Callback<ExchangeRate>) {
        let error = NSError(domain: "", code: 0,
                            userInfo: [ "message": "Wrong ratedata" ])
        closure(nil, error)
    }
}
