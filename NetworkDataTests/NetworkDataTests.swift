//
//  NetworkDataTests.swift
//  NetworkDataTests
//
//  Created by Marharyta Lytvynenko on 14.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import XCTest
@testable import NetworkData

import Domain

class NetworkDataTests: XCTestCase {

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

    func testGetAccountSuccess() {
        let eosUrlString = "http://api.eoseoul.io/"
        let accountName = "eosdublinwow"
        let useCase = UserUseCaseProvider(url: eosUrlString,
                                          username: accountName).useCase
      let userExpectation = expectation(description: "user")
      var userResponse: User?
        useCase.user { user, error in
        userResponse = user
        userExpectation.fulfill()
      }
      waitForExpectations(timeout: 1) { (error) in
        XCTAssertNotNil(userResponse)
        XCTAssertEqual(userResponse?.fullname, accountName)
      }
    }
}
