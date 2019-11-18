//
//  EOSAccountTests.swift
//  EOSAccountTests
//
//  Created by Marharyta Lytvynenko on 14.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import XCTest
@testable import EOSAccount

import Domain

class EOSAccountTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testAccountViewModel() {
        let userUseCase = UserUseCaseMock()
        let exchangeUseCase = ExchangeUseCaseMock()
        let viewModel = AccountViewModel(acccountUseCase: userUseCase,
                                         rateUseCase: exchangeUseCase)
        XCTAssertNotNil(viewModel.username.value)
        XCTAssertNotNil(viewModel.usdValue.value)
        XCTAssertNil(viewModel.errorMessage.value)
    }
    
    func testAccountViewModelEmptyRate() {
        let userUseCase = UserUseCaseMock()
        let exchangeUseCase = ExchangeUseCaseEmptyMock()
        let viewModel = AccountViewModel(acccountUseCase: userUseCase,
                                         rateUseCase: exchangeUseCase)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
