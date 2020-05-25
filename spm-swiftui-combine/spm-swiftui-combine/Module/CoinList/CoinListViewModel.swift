//
//  CoinListViewModel.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Combine
import NetworkCore

protocol CoinListViewModelInputs {
    func coinsAction()
}

protocol CoinListViewModelOutputs {
    var coins: [Coin] { get }
}

final class CoinListViewModel: BaseViewModel, ObservableObject {
    typealias Dependencies = HasNetworkDependecies
    
    // MARK: - Dependencies
    
    let dependencies: Dependencies
    
    // MARK: - Initialization
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Bind
    
    override func bind() {
        super.bind()
        bindAction()
    }
    
    // MARK: - Inputs
    
    func coinsAction() {
        let request: AnyPublisher<[Coin], Error> = dependencies.networkManager.makeRequest(router: CoinGeckoRouter.getCoins)
        request.sink(receiveCompletion: { (result) in
            switch result {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        }) { (coins) in
            self.coins = coins
        }.store(in: &disposables)
    }
    
    // MARK: - Outputs
    
    @Published var coins: [Coin] = []
}

extension CoinListViewModel {
    
    func bindAction() {
        
    }
}
