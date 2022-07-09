//
//  AnyView.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
protocol AnyView: class {
    var presenter: AnyPresenter? { get set }
    
    func update<T: Codable>(with result: T)
    func update(with error: Error)
}
