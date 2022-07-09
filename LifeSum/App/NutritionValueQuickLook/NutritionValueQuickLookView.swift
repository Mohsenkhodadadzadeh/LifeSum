//
//  NutritionValueQuickLookView.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

extension NutritionValueQuickLookVC: AnyView {
    
    func update<T>(with result: T) where T : Decodable, T : Encodable {
        guard let nutritionDetailObject = result as? Foodipedia else {
            return
        }
        nutritionValues = nutritionDetailObject
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut]) { [weak self] in
            guard let `self` = self else { return }
            self.randomFoodButton.alpha = 0
        } completion: { complete in
            UIWindow.animate(withDuration: 1.0, delay: 0.1, options: [.curveEaseIn]) { [weak self] in
                guard let `self` = self else { return }
                self.caloriesPerServingView.alpha = 1
                self.crucialDetailsStackView.alpha = 1
                self.moreInfoButton.alpha = 1
                
            } completion: { _ in
                
            }
        }
    }
    
    func update(with error: Error) {
        
    }
    
    
}
