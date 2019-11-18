//
//  AccountConfigurator.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 18.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//

import Foundation

import Domain
import NetworkData

final class AccountConfigurator {
    
    private let eosUrlString = "http://api.eoseoul.io/"
    private let accountName = "eosdublinwow"
    
    func configurate(for view: AccountViewController) {
        let acccountUseCase: Domain.UserUseCase =
            NetworkData.UserUseCaseProvider(url: self.eosUrlString,
                                            username: self.accountName).useCase
        let rateUseCase: Domain.ExchangeUseCase =
            NetworkData.ExchangeUseCaseProvider().useCase
        view.viewModel = AccountViewModel(acccountUseCase: acccountUseCase,
                                          rateUseCase: rateUseCase)
    }
}
