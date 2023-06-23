//
//  UIView+Extension.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(radius: CGFloat?) {
        layer.cornerRadius = radius ?? 16.0
        layer.borderColor = UIColor.black.cgColor
        clipsToBounds = true
    }
    
    func addShadow(color: UIColor?, opacity: Float = 0.7, offset: CGSize? = nil, radius: CGFloat = 16.0) {
        layer.shadowColor = color?.cgColor ?? UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset ?? self.bounds.size
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}
