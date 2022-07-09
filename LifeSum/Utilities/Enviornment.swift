//
//  Enviornment.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
enum Environment: String, CaseIterable {
    case api
    
    var url: String {
        return "https://\(self.rawValue).lifesum.com"
    }
}

