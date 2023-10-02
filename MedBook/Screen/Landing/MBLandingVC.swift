//
//  MBLandingVC.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//

import UIKit



class MBLandingVC: MBBaseViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func signupPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MBSignupVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func loginPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MBLoginVC")
        navigationController?.pushViewController(vc, animated: true)
    }

}
