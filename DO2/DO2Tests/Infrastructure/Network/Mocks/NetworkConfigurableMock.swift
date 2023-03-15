//
//  NetworkConfigurableMock.swift
//  DO2Tests
//
//  Created by wyn on 2023/3/15.
//

import Foundation
@testable import DO2

struct NetworkConfigurableMock: NetworkConfigurableType {
    var baseURL: URL? = URL(string: "https://mock.testing.com")
    var headers: [String: String] = [:]
    var queryParameters: [String: String] = [:]
}

