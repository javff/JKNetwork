//
//  File.swift
//  
//
//  Created by Juan vasquez on 17-06-22.
//

import Foundation
import SPNetwork

struct CatFactEndpoint: EndpointDefinition {
    func makeRequest(_ urlRequestBuilder: URLRequestBuilder) -> URLRequest {
        return urlRequestBuilder
            .withPath("fact")
            .build()
    }
}
