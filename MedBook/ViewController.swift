//
//  ViewController.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MBSignupVC")
        navigationController?.pushViewController(vc, animated: true)
        // Do any additional setup after loading the view.
    }

}

