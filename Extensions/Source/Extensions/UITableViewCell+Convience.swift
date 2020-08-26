//
//  UITableViewCell+Convience.swift
//  Tawakkalna
//
//  Created by عمر سعيد الشمري on 20/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit
import Themes

public extension UITableViewCell {
    
    class func disclousreCell(with image: UIImage?, title: String?, subtitle: String?) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.km_body
        cell.detailTextLabel?.font = UIFont.km_footnote
        cell.detailTextLabel?.textColor = Theme.secondaryForegroundColor
        cell.imageView?.image = image
        cell.imageView?.layer.cornerRadius = 6
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    class func value1Cell(image: UIImage?, title: String?, subtitle: String) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.km_body
        cell.detailTextLabel?.font = UIFont.km_subheadline
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        cell.imageView?.image = image
        return cell
    }
    
    class func value2Cell(title: String?) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.km_body
        cell.detailTextLabel?.font = UIFont.km_subheadline
        cell.textLabel?.text = title
        cell.textLabel?.setContentHuggingPriority(UILayoutPriority.init(rawValue: 200), for: .horizontal)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.systemRed
        return cell
    }
  
  class func subTitleCell(with image: UIImage?, title: String?, subtitle: String? , bgColorFlag :Bool = true) -> UITableViewCell {
      let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
      cell.textLabel?.numberOfLines = 0
      cell.detailTextLabel?.numberOfLines = 0
      cell.textLabel?.font = UIFont.km_body
      cell.detailTextLabel?.font = UIFont.km_footnote
      cell.detailTextLabel?.textColor = Theme.secondaryForegroundColor

      cell.imageView?.image = bgColorFlag ? image?.addImagePadding(x: 10, y: 10) : image
      cell.imageView?.layer.cornerRadius = 4
      cell.imageView?.backgroundColor = bgColorFlag ? .co_sea : .clear

      cell.imageView?.clipsToBounds = true
      cell.textLabel?.text = title
      cell.detailTextLabel?.text = subtitle
      cell.accessoryType = .disclosureIndicator
      return cell

  }

    class func cellForNotification(with image: UIImage?, title: String?, subtitle: String? , count: Int?) -> UITableViewCell {

        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.km_body
        cell.detailTextLabel?.font = UIFont.km_footnote
        cell.detailTextLabel?.textColor = Theme.secondaryForegroundColor
        cell.imageView?.image = image?.imageWithColor(.white)
        cell.imageView?.layer.cornerRadius = 5
        cell.imageView?.backgroundColor = .co_sea
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        cell.accessoryType = .disclosureIndicator
        if(count != 0){
            if isAppArabic() {
                  let image = UIImage(named: "notification-right")?.addImagePadding(x: 10, y: 10)
                cell.imageView?.image = image
                
            }
            else {
                let image = UIImage(named: "notification-left")?.addImagePadding(x: 10, y: 10)
                cell.imageView?.image = image
            }
            
        }
        
        return cell
    }

    class func customLabelCell(image: UIImage?, title: String?, subtitle: String) -> UITableViewCell {
           let cell = UITableViewCell.init(style: .value1, reuseIdentifier: nil)
           cell.textLabel?.font = UIFont.km_callout
           cell.textLabel?.textColor = .gray
           cell.detailTextLabel?.font = UIFont.km_body
           cell.detailTextLabel?.textColor = .co_black
           cell.detailTextLabel?.textAlignment = .center
           cell.textLabel?.text = title
           cell.detailTextLabel?.text = subtitle
           cell.imageView?.image = image
           cell.backgroundColor = .white
           return cell
       }
    
    class func customSubTitleCell(with image: UIImage?, title: String?, subtitle: String? , accessoryImage : UIImage? ) -> UITableViewCell {
          let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
          cell.textLabel?.numberOfLines = 0
          cell.detailTextLabel?.numberOfLines = 0
          cell.textLabel?.font = UIFont.km_body
          cell.detailTextLabel?.font = UIFont.km_footnote
          cell.detailTextLabel?.textColor = Theme.secondaryForegroundColor
          cell.imageView?.image = image
          cell.imageView?.layer.cornerRadius = 4
          cell.imageView?.clipsToBounds = true
          cell.textLabel?.text = title
          cell.detailTextLabel?.text = subtitle
          let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 8))
          imgView.image = accessoryImage?.imageWithColor(.gray)
          imgView.clipsToBounds = true
          cell.accessoryView = imgView
          cell.selectionStyle = .none
          return cell

      }
    
    fileprivate class func isAppArabic() -> Bool {
        let isAppArabic = Locale.current.languageCode?.lowercased().hasPrefix("ar") ?? false
        return isAppArabic
    }
}

