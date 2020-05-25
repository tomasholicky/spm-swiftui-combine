//
//  NetworkManager.swift
//  
//
//  Created by Tomas Holicky on 13/05/2020.
//

import Foundation
import Alamofire
import Combine

private typealias NetworkManagerHelper = NetworkManager

public protocol HasNetworkManager {
    var networkManager: NetworkableManager { get }
}

public protocol NetworkableManager {
    func makeRequest<T: Codable>(router: URLRequestConvertible) -> AnyPublisher<T, Error>
}

public class NetworkManager {
    public typealias Dependencies = HasNetworkManager
    
    // MARK: - Dependencies
    
    private let dependencies: Dependencies
    
    // MARK: - Variables
    
    private let manager: SessionManager = { () -> SessionManager in
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForResource = 20
        return SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: nil)
    }()
    
    // MARK: - Initialization
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
        bindAction()
    }
}

extension NetworkManager {
    
    private func bindAction() {}
}

extension NetworkManager: NetworkableManager {
    
    public func makeRequest<T: Codable>(router: URLRequestConvertible) -> AnyPublisher<T, Error> {
        return Future { [unowned self] promise in
            self.manager.request(router)
                .validate(statusCode: 200...299)
                .responseJSON { (response) in
                    switch response.result {
                    case .failure(let error):
                        promise(.failure(error))
                    case .success:
                        guard let data = response.data else {
                            promise(.failure(CustomError.dataNotFound))
                            return
                        }
                        
                        if let responseString = String(data: data, encoding: String.Encoding.utf8) as String? {
                            print(responseString)
                        }
                        
                        do {
                            let mappedObject = try JSONDecoder().decode(T.self, from: data)
                            promise(.success(mappedObject))
                        } catch let error {
                            promise(.failure(error))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}


