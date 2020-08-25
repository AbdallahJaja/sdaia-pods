//
//  PanelViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit
import JGProgressHUD
import Extensions

class PanelViewController: UIViewController {

    public var currentMainList : MainList?
    public var currentMainTitle : String?
    @IBOutlet weak var collectionView: UICollectionView!
    var progress = JGProgressHUD.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataSourceManager.shared.currentListVC = self
        addCloseButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        if currentMainList == nil {
            
            //show loading
            progress.show(in: view)
            DataSourceManager.shared.delegate?.loadMainList()
            return
        }
        reloadData()
    }
    
    public func reloadData() {

        //hide loading
        progress.dismiss()
        if currentMainList?.list?.count == 0 {
            setEmptyListImage()
        } else {
            collectionView.reloadData()
        }
        if let title = currentMainTitle {
            self.title = title
        }
        else {
            self.title = NSLocalizedString("dashboard", comment: "")
        }
    }
    
    public func reloadCell(at index: Int) {

        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
}

extension PanelViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return currentMainList?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let obj = currentMainList?.list?[indexPath.row]
        cell.configureCell(with: obj)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let object = currentMainList?.list![indexPath.row] else { return }
        if object.subList?.count == 0 {
            loadDataView(for: object)
        } else {
            loadNextView(for: object)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 177, height: 190.0)
    }
}

extension PanelViewController {
    
    func loadNextView(for object: SubList) {
        if let nextList = object.subList {
            if nextList.count > 0 {
                
                let storyboard = UIStoryboard(name: "DynamicControl", bundle: Bundle(identifier: "org.cocoapods.DynamicControl"))
                let vc: PanelViewController = storyboard.instantiateViewController(withIdentifier: "PanelViewController") as! PanelViewController
                
                vc.currentMainTitle = object.title
                vc.currentMainList = MainList()
                vc.currentMainList?.list = nextList
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func loadDataView(for object: SubList) {

        let storyboard = UIStoryboard(name: "DynamicControl", bundle: Bundle(identifier: "org.cocoapods.DynamicControl"))
        let vc: DataViewController = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
        vc.categoryId = object.id
        vc.currentTitle = object.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension PanelViewController {

    func setEmptyListImage() {
        
    }
}
