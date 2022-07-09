//
//  APIConfiguration.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

class APIConfiguration {
    enum Version: String {
        case one = "v1"
        case two = "v2"
    }
}

extension APIConfiguration.Version: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}
