//
//  AnyInteractor.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
protocol AnyInteractor: class {
    var presenter: AnyPresenter? { get set }
    
    func getData(parameters: [String: Any]?)
    func getData(parameter: Any?)
}
