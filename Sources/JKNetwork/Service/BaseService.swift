//
//  File.swift
//  
//
//  Created by Juan vasquez on 27-05-22.
//

import Foundation

public protocol BaseService {
    func request(endpoint: EndpointDefinition) async throws -> (Data, URLResponse)
}

final class BaseServiceImpl: BaseService {
    private let session: URLSession
    private let builder: URLRequestBuilder

    init(session: URLSession, builder: URLRequestBuilder) {
        self.session = session
        self.builder = builder
    }

    public func request(endpoint: EndpointDefinition) async throws -> (Data, URLResponse) {
        let request = endpoint.makeRequest(builder)
        return try await session.data(for: request)
    }
}
