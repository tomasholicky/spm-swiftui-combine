//
//  AppDependency.swift
//  spm-swiftui-combine
//
//  Created by Tomas Holicky on 13/05/2020.
//  Copyright © 2020 Tomas Holicky. All rights reserved.
//

import Foundation
import NetworkCore

typealias HasNetworkDependecies = HasNetworkManager

// MARK: - Dependencies

final class AppDependency: HasNetworkDependecies {
    lazy var networkManager: NetworkableManager = NetworkManager(dependencies: self)
}

protocol HasNoDependency {}

extension AppDependency: HasNoDependency {}

let dependencies = AppDependency()
