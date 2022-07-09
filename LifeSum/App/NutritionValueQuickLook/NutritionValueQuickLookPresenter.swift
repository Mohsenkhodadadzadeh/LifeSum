//
//  NutritionValueQuickLookPresenter.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
import Moya

class NutritionValueQuickLookPresenter: AnyPresenter {
    weak var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    weak var view: AnyView?
    
    func interactorDidFetch<T>(with result: Result<T, MoyaError>) where T: Codable {
        
        switch result {
        case .success(let nutritionDetail):
            view?.update(with: nutritionDetail)
        case .failure(let error):
            view?.update(with: error)
        }
    }
    
    func getData(with id: Int) {
        interactor?.getData(parameter: id)
    }
    
}
