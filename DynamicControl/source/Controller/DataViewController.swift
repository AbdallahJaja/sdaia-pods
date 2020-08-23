//
//  DataViewController.swift
//  Alamofire
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var list : InfoList?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
