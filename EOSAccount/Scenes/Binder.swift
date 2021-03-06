//
//  Binder.swift
//  EOSAccount
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright (c) 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Foundation

class Binder<T> {
    
    var value: T {
        didSet { subscribers.forEach { $0(value) } }
    }
    typealias Subscripton = (T)->Void
    private var subscribers: [Subscripton] = []
    
    init(value: T) {
        self.value = value
    }
    
    deinit {
        log.debug("\(value) was deinited")
    }
    
    func subscribe(onNext: @escaping Subscripton) {
        subscribers.append(onNext)
        onNext(value)
    }
}
