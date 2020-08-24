//
//  DataSource.swift
//  DynamicControl
//
//  Created by Heba Nageh on 28/12/1441 AH.
//

import Foundation

//data
struct  InfoList {
    var dataList : [DataList]?
    func isSingle() -> Bool {
        return dataList?.count == 1 ? true : false
    }
}
struct DataList {
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
struct MainList {
    var list : [SubList]?
    
    func next(index : Int) -> [SubList] {
        return self.list?[index].subList ?? []
    }
}
struct SubList {
    
    var title: String?
    var image: UIImage?
    var subTitle : String?
    var subList : [SubList]?
    
    func isEmptySub() -> Bool {
        return subList?.count == 0 ? true : false
    }
}

