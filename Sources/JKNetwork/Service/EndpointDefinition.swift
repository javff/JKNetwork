//
//  File.swift
//  
//
//  Created by Juan vasquez on 27-05-22.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put  = "PUT"
    case delete = "DELETE"
}

public protocol EndpointDefinition {
    func makeRequest(_ urlRequestBuilder: URLRequestBuilder) -> URLRequest
}
