//
//  Foodipedia.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Foundation

struct Foodipedia: Codable {
    let title: String?
    let calories: Int?
    let carbs: Double?
    let protein: Double?
    let fat: Double?
    let saturatedfat: Double?
    let unsaturatedfat: Double?
    let fiber: Double?
    let cholesterol: Double?
    let sugar: Double?
    let sodium: Double?
    let potassium: Double?
    let gramsperserving: Double?
    let pcstext: String?
    
    var dictionary: [String: Any?] {
            return ["title": title,
                    "calories": calories,
                    "carbs": carbs,
                    "protein": protein,
                    "fat": fat,
                    "saturatedfat": saturatedfat,
                    "unsaturatedfat": unsaturatedfat,
                    "fiber": fiber,
                    "cholesterol": cholesterol,
                    "sugar": sugar,
                    "sodium": sodium,
                    "potassium": potassium,
                    "gramsperserving": gramsperserving,
                    "pcstext": pcstext]
        }
    
}

