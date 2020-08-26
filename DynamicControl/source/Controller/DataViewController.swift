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
    var expandFlagArr : [Bool] = []
    var docImg : UIImage?
    
    var progress = JGProgressHUD.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 100
    
        DataSourceManager.shared.currentDataVC = self
        
        self.title = currentTitle
        self.addCloseButton()
     
    }
    override func viewWillAppear(_ animated: Bool) {

        //show loading
        tableView.backgroundView = nil
        self.list?.dataList = []
        self.list = nil
        progress.show(in: view)
          DataSourceManager.shared.delegate?.loadDataList(self.categoryId ?? 0)
          reloadData()
    }
    
    public func reloadData() {
        progress.dismiss()
        if list?.dataList?.count == 0 {
            setEmptyDataImage()
        } else {
            tableView.backgroundView = nil
            if list?.isSingleValue ?? false {
                expandFlagArr.append(true)
            }
            else if let currentList = self.list?.dataList {
                for _ in currentList {
                    self.expandFlagArr.append(false)
                }
            }

        }
        tableView.reloadData()
    }
}
extension DataViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list?.dataList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandFlagArr[section] {
            return 3
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
        else if indexPath.row == 1{
            if expandFlagArr[indexPath.section] && isImageExist(index: indexPath.section ){
                return 120
            } else {
                return 0
            }
        }
        else if indexPath.row == 2{
            return expandFlagArr[indexPath.section] ? UITableView.automaticDimension : 0
        }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "DataTitleTableViewCell", for: indexPath) as! DataTitleTableViewCell
         
                if list?.isSingleValue ?? false {
                    cell.titleLbl.text = currentTitle
                    cell.titleLbl.textColor = .co_sea
                    cell.dataLbl.isHidden = true
                }
                else {
                    cell.titleLbl.text = list?.dataList?[indexPath.row].title
                    cell.dataLbl.text = list?.dataList?[indexPath.row].value
                    cell.dataLbl.textColor = .co_sea

                    var accessoryImage : UIImageView?
                    if expandFlagArr[indexPath.section] {
                        accessoryImage = UIImageView(image: UIImage(named: "up",in: DynamicControl.assetBundle, compatibleWith: nil))
                       }
                       else {
                        accessoryImage = UIImageView(image: UIImage(named: "down",in: DynamicControl.assetBundle, compatibleWith: nil))
                       }
                       cell.accessoryView = accessoryImage
                }
                cell.selectionStyle = .none
                cell.clipsToBounds = true
                return cell
        }
        else if indexPath.row == 1{
            if expandFlagArr[indexPath.section] {
               let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
                cell.selectionStyle = .none
                if isImageExist(index: indexPath.section){
                    cell.docImage.image = docImg
                }
                cell.selectionStyle = .none
                cell.clipsToBounds = true
                return cell
            }
        }
        else if indexPath.row == 2{
            if expandFlagArr[indexPath.section] {
               let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as! DataTableViewCell
                if let dataValues = list?.dataList?[indexPath.section].dataValues {
                    loadDataStackView(dataValues: dataValues, cell: cell , index : indexPath)
                }
                cell.selectionStyle = .none
                cell.clipsToBounds = true
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.row == 0{
            if let isSingle = self.list?.isSingleValue , isSingle == false {
                expandResultDetails(index: indexPath.section)
            }
         }
    }
}

extension DataViewController {
    func setEmptyDataImage() {

        let view = UIView(frame: CGRect(x: 0, y: 0, width : self.tableView.bounds.size.width, height : self.tableView.bounds.size.height))
        tableView.separatorStyle = .none
        let noDataImageV: UIImageView  = UIImageView(frame: CGRect(x: self.tableView.bounds.size.width/2-25, y: self.tableView.bounds.size.height/2-50, width : 50, height : 50))
        noDataImageV.clipsToBounds = true
        noDataImageV.alpha = 0.3
        noDataImageV.image = UIImage(named: "emptystate",in: DynamicControl.assetBundle, compatibleWith: nil)
        let noDataLbl: UILabel  = UILabel(frame: CGRect(x: 0, y: self.tableView.bounds.size.height/2, width : self.tableView.bounds.size.width , height : 32))
        noDataLbl.alpha = 0.3
        noDataLbl.text = list?.msg
        noDataLbl.textAlignment = .center

        view.addSubview(noDataImageV)
        view.addSubview(noDataLbl)
        self.tableView.backgroundView = view
        
    }
}

extension DataViewController {

func expandResultDetails(index : Int) {
    expandFlagArr[index] = !expandFlagArr[index]
    //Collapse All
    for i in 0..<expandFlagArr.count {
        if i != index {
            expandFlagArr[i] = false
        }
    }
    tableView.reloadData()
    }
    
    func loadDataStackView(dataValues : [DataValue], cell : DataTableViewCell , index : IndexPath) {
        cell.clearStackView()
        for dataValue in dataValues {
            cell.addDataView(key: dataValue.title , value: dataValue.value )
       }
        tableView.reloadRows(at: [index], with: .none)
    }
    
    func isImageExist(index : Int) -> Bool {
        if let dataValues = list?.dataList?[index].dataValues {
            for dataValue in dataValues {
                if dataValue.image == nil {
                    return false
                }
                else {
                    self.docImg = dataValue.image
                    return true
                }
            }
        }
        return false
    }
    
}
