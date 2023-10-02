//
//  MBLoginVC.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



class MBLoginVC: MBBaseViewController {
    
    lazy var vm = MBLoginVM()
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextField: MBTextField!
    @IBOutlet weak var emailTextField: MBTextField!
    
    @IBOutlet weak var emailErrorUILabel: UILabel!
    @IBOutlet weak var passwordErrorUILabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func backPress(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardNotificationEvent()
        vm.delegate = self
    }
    
    
    @IBAction func handleLoginPress(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
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
        
        vm.signUp(email: email, password: password)
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

extension MBLoginVC: MBLoginVMDelegate {
    
    func handleLogin() {
        NotificationCenter.default.post(name: .screenSwitch, object: nil, userInfo: nil)
    }
    
}
