//
//  File.swift
//  
//
//  Created by Juan vasquez on 17-06-22.
//

import Foundation
import SPNetwork

struct CatFactProviderConfiguration: ProviderConfiguration {
    var baseURL: URL {
        return URL(string: "https://catfact.ninja")!
    }
}
