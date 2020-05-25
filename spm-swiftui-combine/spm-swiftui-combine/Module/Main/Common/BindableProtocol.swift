//
//  BindableProtocol.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Combine

/// Bindable protocol
public protocol BindableProtocol: class {
    
    // MARK: Variables
    
    var disposables: Set<AnyCancellable> { get }
    
    /// Binds actions in view model
    func bind()
    
}
