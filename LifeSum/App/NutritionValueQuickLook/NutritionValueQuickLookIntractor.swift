//
//  NutritionValueQuickLookIntractor.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

class NutritionValueQuickLookIntractor: AnyInteractor {
   
    weak var presenter: AnyPresenter?
    
    func getData(parameters: [String : Any]? = nil) {
        
       fatalError("worng func has been called!")
    }
    
    func getData(parameter: Any?) {
        guard let id = parameter as? Int else {
            fatalError("parameter is invalid!!")
        }
        
        APIManager.shared.getFoodDetail(code: id) { result in
            self.presenter?.interactorDidFetch(with: result)
        }
    }
}
