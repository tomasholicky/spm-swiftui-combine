//
//  CustomError.swift
//  
//
//  Created by Tomas Holicky on 25/05/2020.
//

import Foundation

enum CustomError: Error {
    case businessError(String)
    case dataNotFound
}

extension CustomError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .businessError(let error):
            return NSLocalizedString(error, comment: "")
        case .dataNotFound:
            return NSLocalizedString("Data not found.", comment: "")
        }
    }
}

