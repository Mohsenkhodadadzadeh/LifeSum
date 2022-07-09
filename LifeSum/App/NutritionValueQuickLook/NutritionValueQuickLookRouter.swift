//
//  NutritionValueQuickLookRouter.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation
class NutritionValueQuickLookRouter: AnyRouter {
    
    weak var view: EntryPoint?
    
    @discardableResult
    static func start(_ view: EntryPoint) -> AnyRouter {
        let router = NutritionValueQuickLookRouter()
        
        let _view: AnyView = view
        let presenter: AnyPresenter = NutritionValueQuickLookPresenter()
        let interactor: AnyInteractor = NutritionValueQuickLookIntractor()
        
        _view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = _view
        presenter.interactor = interactor
        
        router.view = _view as? EntryPoint
        
        return router
    }
    
}
