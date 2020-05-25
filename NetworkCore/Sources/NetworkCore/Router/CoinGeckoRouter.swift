//
//  CoinGeckoRouter.swift
//  
//
//  Created by Tomas Holicky on 13/05/2020.
//

import Foundation
import Alamofire

public enum CoinGeckoRouter {
    case getCoins
    case getCoin(id: String)
}

extension CoinGeckoRouter: URLRequestConvertible {
    
    // MARK: - Base URL
    
    var baseUrl: String {
        switch self {
        default:
            return "https://api.coingecko.com"
        }
    }
    
    // MARK: - Headers
    
    var headers: [(value: String, headerField: String)] {
        switch self {
        default:
            return []
        }
    }
    
    // MARK: - Method
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Version
    
    var version: String {
        switch self {
        default:
            return "/api/v3"
        }
    }
    
    // MARK: - Path
    
    var path: String {
        switch self {
        case .getCoins:
            return "/coins/list"
        case .getCoin(id: let id):
            return "/coins/" + id
        }
    }
    
    // MARK: - Query
    
    var query: [URLQueryItem]? {
        switch self {
        default:
            return []
        }
    }
    
    // MARK: - Parameters
    
    var parameters: [String: Any]? {
        switch self {
        default:
            return [:]
        }
    }
    
    /// Returns a URL request or throws if an `Error` was encountered.
    public func asURLRequest() throws -> URLRequest {
        var url = URLComponents(string: baseUrl)
        url?.path = version + path
        if let query = query, !query.isEmpty {
            url?.queryItems = query
        }
        
        var request = URLRequest(url: (url?.url)!)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 15 * 1_000
        request.cachePolicy = .reloadIgnoringCacheData
        
        // Adding Headers
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.headerField)
        }
        
        switch self {
        default:
            return try URLEncoding.default.encode(request, with: parameters ?? [:])
        }
    }
}

