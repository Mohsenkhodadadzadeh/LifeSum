//
//  NutritionValueDetailVC.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

class NutritionValueDetailVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var nutritionValues: Foodipedia!
    private var tableViewHandler: NutritionValueTableViewHandler!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHandler = NutritionValueTableViewHandler()
        tableViewHandler.manager = NutritionDetailManager()
        tableViewHandler.manager?.setNutritionItem(nutritionValues)
        tableView.dataSource = tableViewHandler
        tableView.delegate = tableViewHandler
        
        // Do any additional setup after loading the view.
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
