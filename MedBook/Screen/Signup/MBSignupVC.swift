//
//  MBSignupVC.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



class MBSignupVC: MBBaseViewController {
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    lazy var vm = MBSignupVM()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardNotificationEvent()
        vm.delegate = self
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
            self.viewBottomConstraint.constant = 0
        }
    }
    
}


// MARK: - MBSignupPageTVCellDelgate method
extension MBSignupVC: MBSignupPageTVCellDelgate {
    
    
    func backPress() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func loginWith(email: String, password: String, contry: MBContry) {
        
        if !MBValidation.isValidEmail(email) {
            let alert = UIAlertController(title: "Invalid Email", message: "Enter a valid email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let message = MBValidation.getPasswordValidationMessage(password)
        if let message {
            let alert = UIAlertController(title: "Invalid Password", message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        vm.signUp(email: email, password: password, country: contry.country)
        
    }
    
}


extension MBSignupVC: MBSignupVMDelegate {
    
    func handleLogin() {
        NotificationCenter.default.post(name: .screenSwitch, object: nil, userInfo: nil)
    }
    
}
