//
//  DataTableViewCell.swift
//  DynamicControl
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
        dataView.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func addDataView(key: String? , value: String?) {
        let dataStackView = UIStackView(frame: CGRect(x: 0, y: 0, width : self.bounds.size.width, height : 42))
        dataStackView.axis = NSLayoutConstraint.Axis.horizontal
        let keyLabel = UILabel()
        keyLabel.text = key ?? ""
        let valueLabel = UILabel()
        valueLabel.numberOfLines = 2
        valueLabel.text = value ?? ""
        
        dataStackView.addArrangedSubview(keyLabel)
        dataStackView.addArrangedSubview(valueLabel)
        dataStackView.translatesAutoresizingMaskIntoConstraints = false
        dataStackView.spacing = 20
        dataStackView.distribution = .fillEqually
        self.stackView.addArrangedSubview(dataStackView)
        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width : self.bounds.size.width, height : 10))
        let separatorLabel = UILabel(frame: CGRect(x: 0, y: 0, width : self.bounds.size.width, height : 0.5))
        separatorLabel.backgroundColor = .lightGray
        separatorView.addSubview(separatorLabel)
        self.stackView.addArrangedSubview(separatorView)
        
        self.stackView.clipsToBounds = true
    }
    func clearStackView(){
        stackView.removeAllArrangedSubviews()
    }
}
