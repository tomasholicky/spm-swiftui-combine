//
//  AppDependency.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 13/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Foundation
import NetworkCore
import BaseCore

typealias HasNetworkDependecies = HasNetworkManager
typealias HasCoinApiDependecies = HasCoinApi

// MARK: - Dependencies

final class AppDependency: HasNetworkDependecies, HasCoinApiDependecies {
    lazy var networkManager: NetworkableManager = NetworkManager(dependencies: self)
    lazy var coinApi: CoinApiServicing = CoinApiService(dependencies: self)
}

protocol HasNoDependency {}

extension AppDependency: HasNoDependency {}

let dependencies = AppDependency()

// MARK: - Aliases

typealias H = HBase
