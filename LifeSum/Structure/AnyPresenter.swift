//
//  AnyPresenter.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
import Moya
protocol AnyPresenter: class {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetch<T>(with result: Result<T, MoyaError>) where T: Codable
}
