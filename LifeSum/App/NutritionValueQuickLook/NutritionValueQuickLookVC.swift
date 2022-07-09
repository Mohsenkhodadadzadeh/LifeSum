//
//  NutritionValueQuickLookVC.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

class NutritionValueQuickLookVC: UIViewController {

    
    @IBOutlet weak var caloriesPerServingView: GradientView!
    @IBOutlet weak var calorieAmountLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var crucialDetailsStackView: UIStackView!
    @IBOutlet weak var carboAmountLabel: UILabel!
    @IBOutlet weak var proteinAmountLabel: UILabel!
    @IBOutlet weak var fatAmountLabel: UILabel!
    @IBOutlet weak var moreInfoButton: GradientButton!
    @IBOutlet weak var randomFoodButton: GradientButton!
    
    var presenter: AnyPresenter?
    
    var nutritionValues: Foodipedia? {
        didSet {
            if nutritionValues != nil {
                calorieAmountLabel.text = "\(nutritionValues?.calories ?? 0)"
                foodNameLabel.text = "\(nutritionValues?.title ?? "")"
                carboAmountLabel.text = "\(nutritionValues?.carbs ?? 0)"
                proteinAmountLabel.text = "\(nutritionValues?.protein ?? 0)"
                fatAmountLabel.text = "\(nutritionValues?.fat ?? 0)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NutritionValueQuickLookRouter.start(self)
        randomFoodButton.addTarget(self, action: #selector(randomFoodButtonPressed), for: .touchUpInside)
 
        // Do any additional setup after loading the view.
    }
    
    @objc func randomFoodButtonPressed(_ sender: UIButton) {
        let randomId = Int.random(in: 1...100)
        (presenter as? NutritionValueQuickLookPresenter)?.getData(with: randomId)
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
