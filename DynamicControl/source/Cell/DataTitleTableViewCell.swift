//
//  DataTitleTableViewCell.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class DataTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true {
            self.accessoryView = UIImageView(image: UIImage(named: "up"))
        }else{
             self.accessoryView = UIImageView(image: UIImage(named: "down"))
        }
        // Configure the view for the selected state
    }

}
