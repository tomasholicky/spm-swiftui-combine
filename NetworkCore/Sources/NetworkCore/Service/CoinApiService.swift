//
//  CoinApiService.swift
//  
//
//  Created by Tomas Holicky on 25/05/2020.
//

import Combine
import Foundation

public protocol HasCoinApi {
    var coinApi: CoinApiServicing { get }
}

public protocol CoinApiServicing {
    func getCoins() -> AnyPublisher<[Coin], Error>
    func getCoin(id: String) -> AnyPublisher<Coin, Error>
}

final public class CoinApiService {
    public typealias Dependencies = HasNetworkManager
    
    private let dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension CoinApiService: CoinApiServicing {
    
    public func getCoins() -> AnyPublisher<[Coin], Error> {
        return dependencies.networkManager.makeRequest(router: CoinGeckoRouter.getCoins)
    }
    
    public func getCoin(id: String) -> AnyPublisher<Coin, Error> {
        return dependencies.networkManager.makeRequest(router: CoinGeckoRouter.getCoin(id: id))
    }
}
