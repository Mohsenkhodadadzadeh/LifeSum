//
//  BaseEntity.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

struct BaseEntity<T>: Codable where T: Codable {
    let meta: Meta
    let response: T?
}

