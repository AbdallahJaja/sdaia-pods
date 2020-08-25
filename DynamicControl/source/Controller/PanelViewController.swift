//
//  PanelViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class PanelViewController: UIViewController {

    public var currentMainList : MainList?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("dashboard", comment: "")
        // Do any additional setup after loading the view.
    }
    
    public func reloadData() {
        if currentMainList?.list?.count == 0 {
            
            //TODO
            // shoe empty view
            
        } else {
            collectionView.reloadData()
        }
    }
    
    public func reloadVisibleCells() {
        
        let visibleIndecis = collectionView.indexPathsForVisibleItems
        collectionView.reloadItems(at: visibleIndecis)
    }
}

extension PanelViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMainList?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let obj = currentMainList?.list?[indexPath.row]
        cell.titleLbl.text = obj?.title
        cell.iconImg.image = obj?.image
        cell.subTitleLbl.text = obj?.subTitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        loadNextView(index:  indexPath.row)
    }
}

extension PanelViewController {
    
    func loadNextView(index : Int) {
        if let nextList = currentMainList?.next(index: index) {
            if nextList.count > 0 {
                let vc = PanelViewController()
                vc.currentMainList?.list = nextList
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

