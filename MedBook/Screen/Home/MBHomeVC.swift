//
//  MBHomeVC.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



class MBHomeVC: MBBaseViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func handleLogout(_ sender: Any) {
        logout()
    }
    
}
