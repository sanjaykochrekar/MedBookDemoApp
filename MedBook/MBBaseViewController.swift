//
//  MBBaseViewController.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit


class MBBaseViewController: UIViewController {
    
    func logout() {
        MBDataManager.shared.clearUserData()
        NotificationCenter.default.post(name: .screenSwitch, object: nil, userInfo: nil)
    }
    
}
