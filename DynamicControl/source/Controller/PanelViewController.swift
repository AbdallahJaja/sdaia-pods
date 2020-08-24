//
//  PanelViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class PanelViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var mainList : MainList?
    var subList : SubList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("dashboard", comment: "")
        // Do any additional setup after loading the view.
    }
}

extension PanelViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainList?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.titleLbl.text = mainList?.list?[indexPath.row].title
        cell.iconImg.image = mainList?.list?[indexPath.row].image
        cell.subTitleLbl.text = mainList?.list?[indexPath.row].subTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            loadNextView(index:  indexPath.row)
    }
}

extension PanelViewController {
    
    func loadNextView(index : Int) {
        if let nextList = mainList?.next(index: index) {
            if nextList.count > 0 {
                let vc = PanelViewController()
                vc.mainList?.list = nextList
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension PanelViewController {

    func addCloseButton(){
        let closeButton: UIBarButtonItem
               if #available(iOS 13.0, *) {
                   closeButton = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(closeNavigationVC))
               } else {
                   closeButton = UIBarButtonItem.init(image: UIImage.init(named: "ic-close"), style: .plain, target: self, action: #selector(closeNavigationVC))
               }
        //self.navigationController?.navigationBar.tintColor = .co_sea
        self.navigationItem.rightBarButtonItem = closeButton

    }
    @objc
    func closeNavigationVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

