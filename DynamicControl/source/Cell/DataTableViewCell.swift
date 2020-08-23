//
//  DataTableViewCell.swift
//  Alamofire
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var keyLbl: UILabel!
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
