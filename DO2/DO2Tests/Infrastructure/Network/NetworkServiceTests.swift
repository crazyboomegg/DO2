//
//  NetworkServiceTests.swift
//  DO2Tests
//
//  Created by wyn on 2023/3/15.
//

import XCTest
@testable import DO2

final class NetworkServiceTests: XCTestCase {
    struct EndpointMock: RequestableType {
        var path: String
        var isFullPath: Bool = false
        var method: HTTPMethod
        var headerParameters: [String: String] = [:]
        var queryParametersEncodable: Encodable?
        var queryParameters: [String: Any] = [:]
        var bodyParametersEncodable: Encodable?
        var bodyParameters: [String: Any] = [:]
        var bodyEncoding: BodyEncoding = .stringEncodingAscii

        init(path: String, method: HTTPMethod) {
            self.path = path
            self.method = method
        }
    }

    class NetworkErrorLoggerMock: NetworkErrorLoggerType {
        var loggedErrors: [Error] = []
        func log(request: URLRequest) { }
        func log(responseData data: Data?, response: URLResponse?) { }
        func log(error: Error) { loggedErrors.append(error) }
    }

    private enum NetworkErrorMock: Error {
        case someError
    }
}
