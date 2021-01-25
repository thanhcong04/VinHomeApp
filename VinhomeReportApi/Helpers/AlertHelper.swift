//
//  AlertHelper.swift
//  VinhomeReportApi
//
//  Created by Công on 12/16/20.
//

import UIKit

class AlertHelper {
    
    class func sorry(message: String, viewController: UIViewController?) {
        
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Report App", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Đồng ý", style: .default, handler: nil)
            // Accessing alert view backgroundColor :
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.AppColor.pinkLight1
                // Accessing buttons tintcolor :
            alert.view.tintColor = UIColor.AppColor.black

            alert.addAction(action)
            
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    class func confirmOrCancel(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Report App", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Đồng ý", style: .default) { (action) in
                success()
            }
            let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
            
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.AppColor.pinkLight1
                // Accessing buttons tintcolor :
            alert.view.tintColor = UIColor.AppColor.black

            alert.addAction(action)
            alert.addAction(cancel)
            
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
}
