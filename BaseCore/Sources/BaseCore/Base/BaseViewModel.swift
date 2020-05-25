//
//  BaseViewModel.swift
//
//
//  Created by Tomas Holicky on 25/05/2020.
//

import Combine

extension HBase {
    
    /// View model base class
    open class BaseViewModel: BindableProtocol {
        
        // MARK: - Variables
        
        public var disposables: Set<AnyCancellable> = Set<AnyCancellable>()
        
        /// Initializes view model with bind call
        public init() {
            bind()
        }
        
        /// Binds actions in view model
        open func bind() {
            disposables = Set<AnyCancellable>()
        }
        
    }
}
