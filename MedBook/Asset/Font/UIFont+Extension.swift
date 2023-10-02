//
//  UIFont+Extension.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//


import UIKit



enum MBFont: String {
    case degularBold = "Degular-Bold"
    case degularMedium = "Degular-Medium"
    case degularRegular = "Degular-Regular"
    case degularSemiBold = "Degular-Semibold"
}


extension UIFont {
    
    static func appFont(name: MBFont = .degularRegular, size: CGFloat = 16) -> UIFont {
        return UIFont(name: name.rawValue, size: size)!
    }
    
}
