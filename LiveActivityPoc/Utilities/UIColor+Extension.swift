//
//  UIColor+Extension.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import Foundation
import UIKit

extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        // Remove any leading '#' character
        var hexValue = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }
        
        // Check if the hex value has a valid length
        guard hexValue.count == 6 || hexValue.count == 8 else {
            return nil
        }
        
        // Convert the hex value to RGB or RGBA
        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)
        
        if hexValue.count == 6 {
            r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgbValue & 0x0000FF) / 255.0
            a = 1.0
        } else {
            r = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgbValue & 0x000000FF) / 255.0
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

