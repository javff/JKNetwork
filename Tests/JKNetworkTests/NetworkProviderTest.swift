//
//  NetworkProviderTest.swift
//  
//
//  Created by Juan vasquez on 17-06-22.
//

import XCTest
@testable import SPNetwork

class NetworkProviderTest: XCTestCase {

    func testBasicRequest() throws {
        let provider = NetworkApiProvider<CatFactProviderConfiguration>()
        let endpoint = CatFactEndpoint()
        runAsyncTest {
            do {
                let cat: CatFact = try await provider.request(endpoint: endpoint)
                XCTAssert(cat.fact.isEmpty == false)
                XCTAssert(cat.length > 0)
            } catch {
                XCTFail()
            }
        }
    }
}
