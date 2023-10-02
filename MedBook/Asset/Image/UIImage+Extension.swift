//
//  UIImage+Extension.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//

import UIKit



extension UIImage {
    
    convenience init?(name: MBImageName) {
        self.init(named: name.rawValue, in: nil, with: nil)
    }
    
}

