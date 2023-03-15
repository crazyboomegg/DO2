//
//  DataTransferServiceTests.swift
//  DO2Tests
//
//  Created by wyn on 2023/3/15.
//

import XCTest
@testable import DO2

final class DataTransferServiceTests: XCTestCase {
    struct MockResponseData: Decodable {
        let name: String
    }

    struct NetworkConfigurableMock: NetworkConfigurableType {
        var baseURL: URL? = URL(string: "https://mock.testing.com")
        var headers: [String: String] = [:]
        var queryParameters: [String: String] = [:]
    }

    func testReceivedValidJSONResponse_decodeResponseToObject() async {
        let expectation = expectation(description: "should decode response to object")
        let sut = makeSUT(mockData: #"{"name": "Mock Name"}"#)
        // when
        do {
            let mockEndpoint = Endpoint<MockResponseData>(path: "https://mock.endpoint.com", method: .get)
            let value: MockResponseData = try await sut.request(with: mockEndpoint)
            XCTAssertEqual(value.name, "Mock Name")
            expectation.fulfill()
        } catch {
            XCTFail("Decoding mock object failure")
        }
        // result
        wait(for: [expectation], timeout: 3)
    }

    func testReceivedInvalidResponse_decodeNoObjectThrowError() async {
        let expectation = expectation(description: "Should throw error of network")
        let sut = makeSUT(mockData: #"{"gender": "man"}"#)
        // when
        do {
            let mockEndpoint = Endpoint<MockResponseData>(path: "https://mock.endpoint.com", method: .get)
            let _: MockResponseData = try await sut.request(with: mockEndpoint)
            XCTFail("Should not successfully decode data")
        } catch {
            expectation.fulfill()
        }
        // result
        wait(for: [expectation], timeout: 3)
    }
    // MARK: - Helper
    private func makeSUT(mockData: String) -> DataTransferServiceType {
        // given
        let mockConfig = NetworkConfigurableMock()
        let mockData = mockData.data(using: .utf8)
        let mockSessionManager = NetworkSessionManagerMock(response: HTTPURLResponse(),
                                                           data: mockData!,
                                                           error: nil,
                                                           expectation: nil)
        let networkService = NetworkService(config: mockConfig, sessionManager: mockSessionManager)

        return DataTransferService(networkService: networkService)
    }

}
