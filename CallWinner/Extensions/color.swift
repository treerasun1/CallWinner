//
//  color.swift
//  CallWinner
//
//  Created by tai on 23/3/2564 BE.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String, a: CGFloat = 1.0) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: a
        )
    }
    
    
    struct AppColor {
        
        static let background_Orange = UIColor(hex: "FF8F49")
        static let background_Blue = UIColor(hex: "49CDFF")
        static let background_Green = UIColor(hex: "48F17B")
    }
}
