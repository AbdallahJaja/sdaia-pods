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

            setEmptyDataImage()
            
        } else {
            //TODO
            collectionView.reloadData()
        }
        if let title = currentMainTitle {
            self.title = title
        }
        else {
            self.title = NSLocalizedString("dashboard", comment: "")
        }
    }
    
    public func reloadVisibleCells() {
        
        let visibleIndecis = collectionView.indexPathsForVisibleItems
        collectionView.reloadItems(at: visibleIndecis)
    }
}

extension PanelViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentMainList?.list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        let obj = currentMainList?.list?[indexPath.row]
        cell.titleLbl.text = obj?.title
        cell.iconImg.image = obj?.image?.imageWithColor(.co_sea)
        cell.subTitleLbl.text = obj?.metaData?.subTitle
        if obj?.metaData?.metadata == nil {
            
            DataSourceManager.shared.delegate?.loadMetadata(obj?.id ?? 0)
        } else {
            cell.dataLbl.text = obj?.metaData?.metadata
        }
        
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.borderWidth = 0.5
        cell.contentView.layer.cornerRadius = 10

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
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PanelViewController {
    func setEmptyDataImage() {

        let noDataImageV: UIImageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        noDataImageV.clipsToBounds = true
        noDataImageV.alpha = 0.3
        let noDataLbl: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
        noDataLbl.alpha = 0.3
        self.collectionView.backgroundView?.addSubview(noDataImageV)
        self.collectionView.backgroundView?.addSubview(noDataLbl)
        
    }
}

