import XCTest
import Combine
@testable import NetworkCore

final class NetworkCoreTests: XCTestCase {
    
    func testExample() {
        
        var bag = Set<AnyCancellable>()
        
        let expectationTest = expectation(description: "Network Core Test")
        
        let dependencies = AppDependency()
        
        let request: AnyPublisher<[Coin], Error> = dependencies.networkManager.makeRequest(router: CoinGeckoRouter.getCoins)
        
        request
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .finished:
                    expectationTest.fulfill()
                }
            }) { (coin) in
                print(coin)
        }.store(in: &bag)
        
        waitForExpectations(timeout: 15) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}

final class AppDependency: HasNetworkManager{
    lazy var networkManager: NetworkableManager = NetworkManager(dependencies: self)
}
