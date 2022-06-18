//
//  File.swift
//  
//
//  Created by Juan vasquez on 27-05-22.
//

import Foundation

public protocol ProviderConfiguration {
    var baseURL: URL { get }
    var baseHeaders: [String: String] { get }
    var decoder: JSONDecoder { get }
    var session: URLSession { get }

    init()
}

public extension ProviderConfiguration {

    var session: URLSession {
        return URLSession.shared
    }

    var baseHeaders: [String: String] {
        return [:]
    }

    var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
