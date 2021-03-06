//
//  AccountViewController.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright (c) 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import UIKit

class AccountViewController: UIViewController {

    // MARK: - Properties

    // MARK: Public

    var viewModel: AccountViewModelDelegate!
    
    // MARK: Outlets
    
    @IBOutlet private weak var eosValue: UILabel!
    @IBOutlet private weak var usdValue: UILabel!
    @IBOutlet private weak var fullname: UILabel!
    
    @IBOutlet private weak var cpu: ConsumptionView!
    @IBOutlet private weak var net: ConsumptionView!
    @IBOutlet private weak var ram: ConsumptionView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AccountConfigurator().configurate(for: self)
        initBindings()
    }
}

private extension AccountViewController {
    
    func initBindings() {
        eosValue ~> viewModel?.output.eosValue
        usdValue ~> viewModel?.output.usdValue
        fullname ~> viewModel?.output.username
        cpu ~> viewModel?.output.cpu
        net ~> viewModel?.output.net
        ram ~> viewModel?.output.ram
        
        viewModel.output.errorMessage.subscribe { [weak self] message in
            EOSAccount.mainQueue { [weak self] in
                guard let self = self, let message = message else { return }
                let alert = UIAlertController(title: "Oops!",
                                              message: message,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close",
                                              style: .destructive))
                self.present(alert, animated: true)
            }
        }
    }
}

//MARK: - User Actions
private extension AccountViewController {
    
    @IBAction func send() {
        viewModel.input.send()
    }
    
    @IBAction func buy() {
        viewModel.input.buy()
    }
    
    @IBAction func receive() {
        viewModel.input.receive()
    }
}
