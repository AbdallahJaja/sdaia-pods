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
    
    public func didLoadMetadata(_ metadata: SubList.MetaData, _ categoryId: Int) {
        
        if let currentObjectIndex = currentListVC?.currentMainList?.list?.firstIndex (where: { $0.id == categoryId }) {
            
            guard var currentObject = currentListVC?.currentMainList?.list?[currentObjectIndex] else { return }
            currentObject.metaData = metadata
            currentListVC?.currentMainList?.list?[currentObjectIndex] = currentObject
            currentListVC?.reloadVisibleCells()
        }
    }
}

//data
public struct InfoList {
    public init() {
        
    }
    public init(isSingleValue : Bool? , msg : String? , dataList: [DataList]?) {
        self.isSingleValue = isSingleValue
        self.msg = msg
        self.dataList = dataList
    }
    var isSingleValue : Bool? = false
    var msg : String? = ""
    var dataList : [DataList]? = nil
    func isSingle() -> Bool {
        return dataList?.count == 1 ? true : false
    }
}
public struct DataList {
    public init(title : String? , value : String? , dataValues: [DataValue]?) {
        self.title = title
        self.value = value
        self.dataValues = dataValues
    }
    var id: Int?
    var title : String?
    var value : String?
    var dataValues : [DataValue]?
    
    func getValues() -> [DataValue]?{
        return self.dataValues
    }
}
public struct  DataValue {
    public init(title : String? , value : String? , image: UIImage?) {
        self.title = title
        self.value = value
        self.image = image
    }
    var title: String?
    var value: String?
    var image : UIImage?
}

// Menu of categories
public struct MainList {
    
    public init() {
        
    }
    public var list : [SubList]? = nil
    func next(index : Int) -> [SubList] {
        return self.list?[index].subList ?? []
    }
}
public struct SubList {
    
    var id: Int?
    var parentId : Int?
    var title: String?
    var image: UIImage?
    var metaData : MetaData?
    public var subList : [SubList]?
    
    public init(id : Int? , parentId : Int? , title : String? , image : UIImage? , subList : [SubList]?) {
        self.id = id
        self.parentId = parentId
        self.title = title
        self.image = image
        self.subList = subList
    }
    
    func isEmptySub() -> Bool {
        return subList?.count == 0 ? true : false
    }
    
    public struct MetaData {
        
        public init(key: String , value: String) {
            subTitle = key
            metadata = value
        }
        
        var subTitle : String?
        var metadata: String?
    }
}

