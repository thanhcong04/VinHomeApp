//
//  ApiNameManager.swift
//  VinhomeReportApi
//
//  Created by Công on 12/16/20.
//

import Foundation
class ApiNameManager {
    
    static let shared = ApiNameManager()
    
    init() {
    }
    
    let domain = "http://report.bekhoe.vn"
    let login = "/api/accounts/login"
    let register = "/api/accounts/Register"
    let getProfile = "/api/accounts/profile"
    let upload = "/api/upload"
    let updateProfile = "/api/accounts/update"
    let changePassword = "/api/accounts/changePassword"
    
    func returnUrl(_ nameRequest: String) -> String{
        return domain + nameRequest
    }
}
