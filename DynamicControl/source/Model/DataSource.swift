//
//  DataSource.swift
//  Alamofire
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
    var values : [Data]?
    func getValues() -> [Data]?{
        return self.values
    }
}
struct Data {
    var key: String?
    var image : UIImage?
    var value: String?    
}

// Menu of categories
struct MainList {
    var list : [List]?
    
    func next(index : Int) -> [List] {
        return self.list?[index].subList ?? []
    }
}
struct List {
    
    var title: String?
    var image: UIImage?
    var subTitle : String?
    var subList : [List]?
    
    func isEmptySub() -> Bool {
        return subList?.count == 0 ? true : false
    }
}

