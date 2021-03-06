//
//  AccountViewModel.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright (c) 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Foundation

import Domain
import NetworkData

protocol AccountInputViewModelType: class {
    func send()
    func receive()
    func buy()
}

protocol AccountOutputViewModelType: class {
    var username: Binder<String?> { get }
    var eosValue: Binder<String?> { get }
    var usdValue: Binder<String?> { get }
    var errorMessage: Binder<String?> { get }
    var cpu: Binder<ConsumptionViewModelType?> { get }
    var net: Binder<ConsumptionViewModelType?> { get }
    var ram: Binder<ConsumptionViewModelType?> { get }
}

protocol AccountViewModelDelegate: class {
    var input: AccountInputViewModelType { get }
    var output: AccountOutputViewModelType { get }
}

final class AccountViewModel: AccountViewModelDelegate,
AccountInputViewModelType, AccountOutputViewModelType {
    
    // MARK: - Properties

    // MARK: Private

    private var user: Domain.UserType? {
        didSet {
            username.value = user.fullname
            eosValue.value = user.eosTotal
            usdValue.value = user.toUsd
            cpu.value = ConsumptionViewModel(user?.cpu, staked: user?.cpuSelfStaked)
            net.value = ConsumptionViewModel(user?.net, staked: user?.netSelfStaked)
            ram.value = ConsumptionViewModel(user?.ram, staked: nil)
        }
    }
    private var rate: Domain.ExchangeRate?
    
    private let acccountUseCase: Domain.UserUseCase
    private let rateUseCase: Domain.ExchangeUseCase
    
    // MARK: Public
    
    lazy var input: AccountInputViewModelType = self
    lazy var output: AccountOutputViewModelType = self
    
    lazy var username = Binder<String?>(value: nil)
    lazy var eosValue = Binder<String?>(value: nil)
    lazy var usdValue = Binder<String?>(value: nil)
    
    var errorMessage = Binder<String?>(value: nil)
    
    var cpu = Binder<ConsumptionViewModelType?>(value: nil)
    var net = Binder<ConsumptionViewModelType?>(value: nil)
    var ram = Binder<ConsumptionViewModelType?>(value: nil)
    
    // MARK: Lifecycle

    init(acccountUseCase: Domain.UserUseCase,
         rateUseCase: Domain.ExchangeUseCase) {
        self.acccountUseCase = acccountUseCase
        self.rateUseCase = rateUseCase
        loadUser()
        loadRate()
    }
    
    deinit {
        log.info("\(self) deinited")
    }
    
    // MARK: Work with data
    
    ///load user info
    private func loadUser() {
        acccountUseCase.user { [weak self] user, error in
            guard let self = self else { return }
            guard let user = user else {
                if let error = error {
                    self.errorMessage.value = error.localizedDescription
                }
                return
            }
            self.user = user
            self.updateModel()
        }
    }
    
    ///load eos to usd rate
    private func loadRate() {
        rateUseCase.rate { [weak self] rate, error in
            guard let self = self else { return }
            guard let rate = rate else {
                if let error = error {
                    self.errorMessage.value = error.localizedDescription
                }
                return
            }
            self.rate = rate
            self.updateModel()
        }
    }

    /// merge echange rate with user data
    private func updateModel() {
        if let user = user, let rate = rate {
            let balance = Balance(unstaked: user.balance.unstaked,
                                  staked: user.balance.staked,
                                  toUsdExchange: rate)
            self.user = user.copied(balance: balance)
        }
    }
    
    // MARK: Output
    
    func send() {
        log.info("send clicked")
    }
    
    func receive() {
        log.info("receive clicked")
    }
    
    func buy() {
        log.info("buy clicked")
    }
}
