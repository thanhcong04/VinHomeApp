//
//  AppDelegate.swift
//  VinhomeReportApi
//
//  Created by Công on 12/13/20.
//

import UIKit

extension UIColor {
    class func mainColor() -> UIColor {
        return UIColor(hexString: "AF8DDC")
    }
    class func main2Brown()->UIColor{
        return UIColor(red:0.48, green:0.36, blue:0.12, alpha:1.0)
    }
}

extension UIColor{
    
    /// Converting hex string to UIColor
    ///
    /// - Parameter hexString: input hex string
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    class AppColor {
            
        static let grayLight1 = UIColor(hexString: "EFEEEE")
        static let grayLight2 = UIColor(hexString: "979797")
        static let grayLight3 = UIColor(hexString: "8B8B8B")
        
        static let white = UIColor.white
        static let black = UIColor.black
        
        static let pinkLight1 = UIColor(hexString: "F4E9FF")
        static let pinkLight2 = UIColor(hexString: "CBB5E8")
        static let pinkLight3 = UIColor(hexString: "AF8DDC")
        static let pinkLight4 = UIColor(hexString: "A36DEA")
    }
}


