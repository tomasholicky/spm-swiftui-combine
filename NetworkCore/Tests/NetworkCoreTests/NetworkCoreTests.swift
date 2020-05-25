import XCTest
import Combine
@testable import NetworkCore

final class NetworkCoreTests: XCTestCase {
    
    func testExample() {
        
        var bag = Set<AnyCancellable>()
        
        let expectationTest = expectation(description: "Entry Login Flow User")
        
        let dependencies = AppDependency()
        
        let aa: AnyPublisher<[Coin], Error> = dependencies.networkManager.makeRequest(router: CoinGeckoRouter.getCoins)
        
        aa.sink(receiveCompletion: { (error) in
            print(error)
            expectationTest.fulfill()
        }) { (coin) in
            print(coin)
            expectationTest.fulfill()
        }.store(in: &bag)
        
        waitForExpectations(timeout: 1) { error in
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
