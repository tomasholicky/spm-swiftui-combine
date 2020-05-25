//
//  BindableProtocol.swift
//
//
//  Created by Tomas Holicky on 25/05/2020.
//

import Combine

/// Bindable protocol
public protocol BindableProtocol: class {
    
    // MARK: Variables
    
    var disposables: Set<AnyCancellable> { get }
    
    /// Binds actions in view model
    func bind()
    
}
