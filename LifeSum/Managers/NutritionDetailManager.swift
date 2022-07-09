//
//  NutritionDetailManager.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

class NutritionDetailManager {
    
    private var nutritionObject: Foodipedia? {
        didSet {
            guard let strongObjects = nutritionObject?.dictionary
                    .filter({ !($0.value is String)})
                    .filter({ $0.value != nil })
                    .map({ ($0.capitalized, $1!)}) else {
                return
            }
            availableNutritions = strongObjects
        }
    }
    
    private var availableNutritions: [(String, Any)]?
    var itemsCount: Int { availableNutritions?.count ?? 0 }
    
    func setNutritionItem(_ object: Foodipedia) {
        nutritionObject = object
    }
    
    func getItemForShow(index: Int) -> (name: String, value: String) {
        guard index < itemsCount, let item = availableNutritions else {
            fatalError("index is out of range!")
        }
        
    return (item[index].0 , "\(item[index].1)")
    }
    
}
