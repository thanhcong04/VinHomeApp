//
//  ApiManager.swift
//  VinhomeReportApi
//
//  Created by Công on 12/16/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager {
    
    static let shared = ApiManager()
    
    init() {
    }
    
    func getHeaders() -> HTTPHeaders {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        return ["Authorization": "Bearer \(token)"]
    }
    
}

