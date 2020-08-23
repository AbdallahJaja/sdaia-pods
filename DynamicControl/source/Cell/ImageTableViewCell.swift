//
//  ImageTableViewCell.swift
//  Alamofire
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
