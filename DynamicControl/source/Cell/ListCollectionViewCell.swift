//
//  ListCollectionViewswift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit
import Themes

class ListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var subTitleLbl: UILabel!

    @IBOutlet weak var metdataView: UIView!
    var progress = UIActivityIndicatorView(style: .gray)

    func configureCell(with obj: SubList?) {

        titleLbl.textColor = .co_sea
        arrowImage.image = UIImage(named: "backIcon")?.imageWithColor(.co_sea)
        titleLbl.text = obj?.title
        iconImg.image = obj?.image?.imageWithColor(.co_sea)

        if obj?.metaData?.metadata == nil {

            metdataView.addSubview(progress)
            progress.center = metdataView.convert(metdataView.center, from:metdataView.superview)
            progress.hidesWhenStopped = true
            progress.startAnimating()
            DataSourceManager.shared.delegate?.loadMetadata(obj?.id ?? 0)
        } else {
            dataLbl.text = obj?.metaData?.metadata
            subTitleLbl.text = obj?.metaData?.subTitle

            progress.stopAnimating()
            progress.removeFromSuperview()
        }

        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 10

    }
}
