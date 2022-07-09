//
//  NSObject+className.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}
