//
//  DataViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var categoryId: Int?
    public var currentTitle : String?
    public var list : InfoList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataSourceManager.shared.currentDataVC = self
        DataSourceManager.shared.delegate?.loadDataList(categoryId ?? 0)
        self.addCloseButton()
        
    }
    
    public func reloadData() {
     
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
