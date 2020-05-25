//
//  BaseViewModel.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Combine

/// View model base class
class BaseViewModel: BindableProtocol {
    
    // MARK: - Variables
    
    var disposables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    /// Initializes view model with bind call
    init() {
        bind()
    }
    
    /// Binds actions in view model
    func bind() {
        disposables = Set<AnyCancellable>()
    }
    
}
