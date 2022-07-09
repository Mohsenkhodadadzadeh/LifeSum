//
//  NutritionValueTableViewHandler.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

class NutritionValueTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var manager: NutritionDetailManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let manager = manager else {
            return 0
        }
        return manager.itemsCount

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NutritionValueTVC.className, for: indexPath) as! NutritionValueTVC
        let item = manager!.getItemForShow(index: indexPath.row)
        cell.setup(name: item.name, value: item.value)
        return cell
    }
}
