//
//  NutritionValueTVC.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import UIKit

class NutritionValueTVC: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value
    }

}
