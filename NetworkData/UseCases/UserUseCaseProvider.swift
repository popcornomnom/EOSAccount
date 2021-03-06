//
//  UserUseCase.swift
//  NetworkData
//
//  Created by Marharyta Lytvynenko on 17.11.2019.
//  Copyright (c) 2019 Marharyta Lytvynenko. All rights reserved.
//
//  This file was generated by http://www.popcornomnom.com
//

import Foundation

import Domain

public final class UserUseCaseProvider: Domain.UseCaseProvider {
    
    private let repository: Repository

    private let username: String
    
    public init(url: String, username: String) {
        self.username = username
        repository = Repository(url: url, defaultParams: [:])
    }

    public var useCase: Domain.UserUseCase {
        return UserUseCase(repository, username: username)
    }
}
