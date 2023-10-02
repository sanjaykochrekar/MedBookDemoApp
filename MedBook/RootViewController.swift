//
//  ViewController.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//

import UIKit

class RootViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        handleScreenSwitch()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(self.handleScreenSwitch),
                                       name: .screenSwitch,
                                       object: nil)
    }
    
    
    @objc private func handleScreenSwitch() {
        
        if MBDataManager.shared.isUserLoggedIn() {
            let storyboard = UIStoryboard(name: "MBHome", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MBHomeVC")
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.viewControllers.removeAll(where: { (vc) -> Bool in
                if vc.isKind(of: RootViewController.self) || vc.isKind(of: MBHomeVC.self) {
                    return false
                    
                } else {
                    return true
                }
            })
        } else {
            let storyboard = UIStoryboard(name: "Auth", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MBLandingVC")
            navigationController?.pushViewController(vc, animated: true)
            navigationController?.viewControllers.removeAll(where: { (vc) -> Bool in
                if vc.isKind(of: RootViewController.self) || vc.isKind(of: MBLandingVC.self) {
                    return false
                } else {
                    return true
                }
            })
        }
    }
    
}

extension Notification.Name {
    static let screenSwitch = Notification.Name(
        rawValue: "screenSwitch")
}
