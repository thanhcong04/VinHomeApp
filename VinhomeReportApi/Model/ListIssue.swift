//
//  ListIssue.swift
//  VinhomeReportApi
//
//  Created by Công on 3/21/21.
//

import Foundation
import SwiftyJSON
class ListIssue {
    var responseTime: String
    var code: Int
    var message: String
    var data: ResultIssue?
    
    required public init?(json: JSON){
        responseTime = json["responseTime"].stringValue
        code = json["json"].intValue
        message = json["message"].stringValue
        data = ResultIssue(json: json["data"])
    }
}

class ResultIssue {

    let result: [Issue]?
    let resultCount: Int?

    init(json: JSON) {
        result = json["result"].arrayValue.map { Issue(json: $0)! }
        resultCount = json["resultCount"].intValue
    }
    
}

class Issue {
    var id: String = ""
    var createdAt: String = ""
    var createdBy: String = ""
    var title: String = ""
    var content: String = ""
    var status: String = ""
    var photos: [String] = []
    var isEnable: String = ""
    
    init(){
    
    }
    required public init?(json: JSON){
        id = json["id"].stringValue
        createdAt = json["createdAt"].stringValue
        createdBy = json["createdBy"].stringValue
        title = json["title"].stringValue
        content = json["content"].stringValue
        status = json["status"].stringValue
        photos = [json["photos"].stringValue]
        isEnable = json["isEnable"].stringValue
    }
}
