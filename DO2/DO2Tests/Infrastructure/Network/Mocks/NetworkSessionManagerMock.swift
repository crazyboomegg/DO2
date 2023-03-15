//
//  NetworkSessionManagerMock.swift
//  DO2Tests
//
//  Created by wyn on 2023/3/15.
//

import XCTest
@testable import DO2

struct NetworkSessionManagerMock: NetworkSessionManagerType {
    let response: HTTPURLResponse?
    let data: Data?
    let error: Error?
    let expectation: XCTestExpectation?
    init(response: HTTPURLResponse?,
         data: Data?,
         error: Error?,
         expectation: XCTestExpectation?) {
        self.response = response
        self.data = data
        self.error = error
        self.expectation = expectation
    }
    func request(_ request: URLRequest) async throws -> DataResponse {
        expectation?.fulfill()
        guard let response, let data else {
            throw error ?? RequestError.noResponse
        }
        return (data, response)
    }
}

private enum RequestError: Error {
    case noResponse
}
