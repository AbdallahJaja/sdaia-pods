//
//  DataSource.swift
//  DynamicControl
//
//  Created by Heba Nageh on 28/12/1441 AH.
//

import Foundation

public protocol DataSourceManagerDelegate {

    func loadMainList()
    func loadMetadata(_ categoryId: Int)
    func loadDataList(_ categoryId: Int)
}

public class DataSourceManager {
    
    public var delegate: DataSourceManagerDelegate?
    
    public var mainList: MainList?
    
    public var metadataList: MainList? {
        didSet {
           
            currentListVC?.currentMainList = mainList
            currentListVC?.reloadData()
        }
    }
    
    public static var shared: DataSourceManager = {
        let dataSourceManager = DataSourceManager()
        return dataSourceManager
    }()
    
    var currentListVC: PanelViewController?
    var currentDataVC: DataViewController?
    
    public func didloadDataList(_ infoList: InfoList, _ categoryId: Int) {
       
        currentDataVC?.list = infoList
        currentDataVC?.reloadData()
    }
    
    public func didLoadMainList(_ mainList: MainList) {
        
        currentListVC?.currentMainList = mainList
        currentListVC?.reloadData()
    }
    
    public func didLoadMetadata(_ metadata: String, _ categoryId: Int) {
        
        if let currentObjectIndex = currentListVC?.currentMainList?.list?.firstIndex (where: { $0.id == categoryId }) {
            
            guard var currentObject = currentListVC?.currentMainList?.list?[currentObjectIndex] else { return }
            currentObject.metadata = metadata
            currentListVC?.currentMainList?.list?[currentObjectIndex] = currentObject
            currentListVC?.reloadVisibleCells()
        }
    }
}

//data
public struct InfoList {
    var dataList : [DataList]?
    func isSingle() -> Bool {
        return dataList?.count == 1 ? true : false
    }
}
public struct DataList {
    var title : String?
    var values : [DataValue]?
    func getValues() -> [DataValue]?{
        return self.values
    }
}
struct DataValue {
    var key: String?
    var image : UIImage?
    var value: String?    
}

// Menu of categories
public struct MainList {
    var list : [SubList]?
    func next(index : Int) -> [SubList] {
        return self.list?[index].subList ?? []
    }
}
public struct SubList {
    
    var id: Int?
    var desc: String?
    var parentId : Int?
    var title: String?
    var image: UIImage?
    var subTitle : String?
    var metadata: String?
    var subList : [SubList]?
    
    init(id : Int? , decs : String? , parentId : Int? , title : String? , image : String? , subTitle : String? , subList : [SubList]?) {
        self.id = id
        self.desc = desc
        self.parentId = parentId
        self.title = title
        self.image = image.convertBase64ToImage() ?? UIImage()
    }
    func isEmptySub() -> Bool {
        return subList?.count == 0 ? true : false
    }
}

