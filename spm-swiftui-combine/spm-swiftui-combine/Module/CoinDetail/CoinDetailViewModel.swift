//
//  CoinDetailViewModel.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 25/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Foundation
import Combine
import NetworkCore

protocol CoinDetailViewModelInputs {
    func coinAction()
}

protocol CoinDetailViewModelOutputs {
    var coin: Coin { get }
    var coinImageUrl: URL? { get }
}

final class CoinDetailViewModel: H.BaseViewModel, ObservableObject, CoinDetailViewModelInputs, CoinDetailViewModelOutputs {
    typealias Dependencies = HasCoinApiDependecies
    
    // MARK: - Dependencies
    
    let dependencies: Dependencies
    
    // MARK: - Initialization
    
    init(dependencies: Dependencies, coin: Coin) {
        self.dependencies = dependencies
        self.coin = coin
    }
    
    // MARK: Bind
    
    override func bind() {
        super.bind()
        bindAction()
    }
    
    // MARK: - Inputs
    
    func coinAction() {
        let request: AnyPublisher<Coin, Error> = dependencies.coinApi.getCoin(id: coin.id)
        request.sink(receiveCompletion: { (result) in
            switch result {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        }) { (coin) in
            self.coin = coin
        }.store(in: &disposables)
    }
    
    // MARK: - Outputs
    
    @Published var coin: Coin
    @Published var coinImageUrl: URL?
}

extension CoinDetailViewModel {
    
    func bindAction() {
        $coin.sink { (coin) in
            if let thumb = coin.image?.thumb, let thumbUrl = URL(string: thumb) {
                self.coinImageUrl = thumbUrl
            }
        }.store(in: &disposables)
    }
}
