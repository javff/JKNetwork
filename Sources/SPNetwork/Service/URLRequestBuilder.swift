//
//  File.swift
//  
//
//  Created by Juan vasquez on 27-05-22.
//

import Foundation

public final class URLRequestBuilder {
    private var request: URLRequest
    private let encoder: JSONEncoder

    public init(url: URL, encoder: JSONEncoder = JSONEncoder()) {
        self.request = URLRequest(url: url)
        self.encoder = encoder
    }

    public func withMethod(_ method: HTTPMethod) -> URLRequestBuilder {
        request.httpMethod = method.rawValue
        return self
    }

    public func withQueryParams(_ params: [String: String]) -> URLRequestBuilder {
        guard let urlString = request.url?.absoluteURL.absoluteString else {
            return self
        }
        var urlComponents = URLComponents(string: urlString)
        let queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents?.queryItems = queryItems
        guard let newUrl = urlComponents?.url else { return self }
        self.request.url = newUrl
        return self
    }

    public func withPath(_ path: String) -> URLRequestBuilder {
        request.url?.appendPathComponent(path)
        return self
    }

    public func withBody(_ data: Data?) -> URLRequestBuilder {
        request.httpBody = data
        return self
    }

    public func build() -> URLRequest {
        return request
    }
}
