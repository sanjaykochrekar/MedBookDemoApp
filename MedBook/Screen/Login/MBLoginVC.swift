//
//  MBLoginVC.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



class MBLoginVC: UIViewController {
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextField: MBTextField!
    @IBOutlet weak var emailTextField: MBTextField!
    
    @IBOutlet weak var emailErrorUILabel: UILabel!
    @IBOutlet weak var passwordErrorUILabel: UILabel!
    
    
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



// MARK: - Keyboard handling
extension MBLoginVC {
    
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


extension MBLoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            setEmailError()
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    
    
    private func setEmailError() {
        if !MBValidation.isValidEmail(emailTextField.text ?? "")  {
            emailErrorUILabel.text = "Enter Valid Email"
        } else {
            emailErrorUILabel.text = ""
        }
    }
    
    
    private func setPasswordError() {
        
    }
}
