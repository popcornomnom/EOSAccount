//
//  File.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright © 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import UIKit

extension ConsumptionView {
    
    static func ~>(view: ConsumptionView, binder: (Binder<ConsumptionViewModelType?>)?) {
        binder?.subscribe { value in
            EOSAccount.mainQueue {
                if let viewModel = binder?.value {
                    view.viewModel = viewModel
                }
            }
        }
    }
}
