//
//  DataViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit
import JGProgressHUD
import Extensions

class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var categoryId: Int?
    public var currentTitle : String?
    public var list : InfoList?
    
    var progress = JGProgressHUD.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        DataSourceManager.shared.currentDataVC = self
        DataSourceManager.shared.delegate?.loadDataList(categoryId ?? 0)
        
        self.title = currentTitle
        self.addCloseButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {

        //show loading
        progress.show(in: view)
        DataSourceManager.shared.delegate?.loadDataList(self.categoryId ?? 0)
        reloadData()
    }
    
    public func reloadData() {
        progress.dismiss()
        tableView.reloadData()
    }
}
extension DataViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list?.dataList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataTitleTableViewCell", for: indexPath) as! DataTitleTableViewCell
        cell.titleLbl.text = list?.dataList?[indexPath.row].title
        return cell
    }
        
}


extension DataViewController {
    func setEmptyDataImage() {

        let noDataImageV: UIImageView  = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        noDataImageV.clipsToBounds = true
        noDataImageV.alpha = 0.3
        let noDataLbl: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 32))
        noDataLbl.alpha = 0.3
        self.tableView.backgroundView?.addSubview(noDataImageV)
        self.tableView.backgroundView?.addSubview(noDataLbl)
        
    }
}

