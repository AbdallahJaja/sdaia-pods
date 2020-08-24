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
    var subList : List?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                self.mainList?.list = nextList
                collectionView.reloadData()
            }
        }
    }
}

