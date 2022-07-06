//
//  File.swift
//  
//
//  Created by Juan vasquez on 27-05-22.
//

import Foundation

protocol NetworkProviderProtocol {
    func request<T: Decodable>(endpoint: EndpointDefinition) async throws -> T
    func request(endpoint: EndpointDefinition) async throws -> NetworkApiResponse
}

struct NetworkApiResponse {
    let response: HTTPURLResponse
}

enum NetworkApiError: Error {
    case malformedResponse
}

public final class NetworkApiProvider<T: ProviderConfiguration>: NetworkProviderProtocol {
    private let service: BaseService
    private let decoder: JSONDecoder

    public init() {
        let configuration = T.init()
        self.service = BaseServiceImpl(session: configuration.session, builder: URLRequestBuilder(url: configuration.baseURL))
        self.decoder = configuration.decoder
    }

    func request<T: Decodable>(endpoint: EndpointDefinition) async throws -> T {
        let (data, _) = try await service.request(endpoint: endpoint)
        return try decoder.decode(T.self, from: data)
    }

    func request(endpoint: EndpointDefinition) async throws -> NetworkApiResponse {
        let (_, response) = try await service.request(endpoint: endpoint)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkApiError.malformedResponse
        }
        return .init(response: response)
    }
}
