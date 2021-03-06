//
//  DataViewController.swift
//  DynamicControl
//
//  Created by Heba Nageh on 03/01/1442 AH.
//

import UIKit
import JGProgressHUD
import Extensions
import Themes

enum CellType  {
    case title
    case image
    case data
}
class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var categoryId: Int?
    public var currentTitle : String?
    public var list : InfoList?
    var expandFlagArr : [Bool] = []
    var docImg : UIImage?
    var cells : [CellType] = []
    
    var progress = JGProgressHUD.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = Theme.backgroundColor
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 100

        DataSourceManager.shared.currentDataVC = self
        cells = [.title , .image , .data]
        title = currentTitle
        addCloseButton()

    }
    override func viewWillAppear(_ animated: Bool) {

        //show loading
        tableView.backgroundView = nil
        list?.dataList = []
        list = nil
        expandFlagArr = []
        progress.show(in: view)
        DataSourceManager.shared.delegate?.loadDataList(categoryId ?? 0)
        reloadData()
    }
    
    public func reloadData() {
        progress.dismiss()
        if list?.dataList == nil || list?.dataList?.count == 0 {
            setEmptyDataImage()
        } else {
            tableView.backgroundView = nil
            if let isSingle = list?.isSingle() , isSingle == true {
                expandFlagArr.append(true)
            }
            else if let currentList = list?.dataList {
                for _ in currentList {
                    expandFlagArr.append(false)
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

        if section < expandFlagArr.count && expandFlagArr[section] {
            return cells.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cells[indexPath.row] {
        case .title:
            return 50
        case .image:
            if expandFlagArr[indexPath.section] && isImageExist(index: indexPath.section) {
                return UITableView.automaticDimension
            } else {
                return 0
            }
        case .data:
            return expandFlagArr[indexPath.section] ? UITableView.automaticDimension : 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch cells[indexPath.row] {
            
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataTitleTableViewCell", for: indexPath) as! DataTitleTableViewCell

            if let isSingle = list?.isSingle() , isSingle == true {
                cell.titleLbl.text = currentTitle
                cell.titleLbl.textColor = .co_sea
                cell.dataLbl.isHidden = true
            }  else {
                cell.titleLbl.text = list?.dataList?[indexPath.section].title
                cell.dataLbl.text = list?.dataList?[indexPath.section].value
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
        case .image:
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
        case .data:
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
        if cells[indexPath.row] == .title {
            if let isSingle = list?.isSingle() , isSingle == false {
                expandResultDetails(index: indexPath.section)
            }
        }
    }
}

extension DataViewController {

    func setEmptyDataImage() {

        let view = UIView(frame: CGRect(x: 0, y: 0, width : tableView.bounds.size.width, height : tableView.bounds.size.height))
        tableView.separatorStyle = .none
        let noDataImageV: UIImageView  = UIImageView(frame: CGRect(x: tableView.bounds.size.width/2-25, y: tableView.bounds.size.height/2-50, width : 50, height : 50))
        noDataImageV.clipsToBounds = true
        noDataImageV.alpha = 0.3
        noDataImageV.image = UIImage(named: "emptystate",in: DynamicControl.assetBundle, compatibleWith: nil)
        let noDataLbl: UILabel  = UILabel(frame: CGRect(x: 0, y: tableView.bounds.size.height/2 + 10, width : tableView.bounds.size.width , height : 32))
        noDataLbl.alpha = 0.5
        noDataLbl.textColor = .gray
        noDataLbl.text = list?.msg
        noDataLbl.textAlignment = .center

        view.addSubview(noDataImageV)
        view.addSubview(noDataLbl)
        tableView.backgroundView = view
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
    }
    
    func isImageExist(index : Int) -> Bool {
        if let dataValues = list?.dataList?[index].dataValues {
            for dataValue in dataValues {
                if dataValue.image == nil {
                    return false
                }
                else {
                    docImg = dataValue.image
                    return true
                }
            }
        }
        return false
    }
    
}
