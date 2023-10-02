//
//  MBSignupVC.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



class MBSignupVC: UIViewController {
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardNotificationEvent()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}



// MARK: - UITableViewDataSource Methods
extension MBSignupVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MBSignupPageTVCell", for: indexPath) as! MBSignupPageTVCell
        cell.delegate = self
        return cell
    }
    
}



// MARK: - Keyboard handling
extension MBSignupVC {
    
    func addKeyboardNotificationEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.viewBottomConstraint.constant == 0 {
                self.viewBottomConstraint.constant = keyboardSize.height
            }
        }
    }
    

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.viewBottomConstraint.constant != 0 {
            self.viewBottomConstraint.constant
            = 0
        }
    }
    
}


// MARK: - MBSignupPageTVCellDelgate method
extension MBSignupVC: MBSignupPageTVCellDelgate {
    
    func loginWith(email: String, password: String, contry: MBContry) {
        print(contry)
    }
    
}
