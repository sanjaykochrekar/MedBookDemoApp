//
//  MBSignupPageTVCell.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import UIKit



protocol MBSignupPageTVCellDelgate {
    func loginWith(email: String, password: String, contry: MBContry)
}

class MBSignupPageTVCell: UITableViewCell {
    
    var list: [MBContry] = []
    var delegate: MBSignupPageTVCellDelgate?
    
    @IBOutlet weak var passwordTextField: MBTextField!
    @IBOutlet weak var emailTextField: MBTextField!
    @IBOutlet weak var contryPicker: UIPickerView!
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    
    @IBOutlet weak var eightCharImageView: UIImageView!
    @IBOutlet weak var upperCaseImageView: UIImageView!
    @IBOutlet weak var specialCharImageView: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func onPressLogin() {
        delegate?.loginWith(email: emailTextField.text ?? "", password: passwordTextField.text ?? "", contry: list[contryPicker.selectedRow(inComponent: 0)])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetUp()
    }
    
    
    func initialSetUp() {
        emailTextField.addTarget(self, action: #selector(self.onEmailChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.onPasswordChange(_:)), for: UIControl.Event.editingChanged)
        list = MBContryLoader.loadContryList()
        contryPicker.selectRow(list.firstIndex(where: { item in
            item.country == "India"
        }) ?? 0, inComponent: 0, animated: true)
    }
    
    
    @objc func onEmailChange(_ textField: UITextField) {
        guard let email = emailTextField.text else { return }
        if MBValidation.isValidEmail(email) {
            emailErrorLabel.text = ""
        } else {
            emailErrorLabel.text = "Enter valid email"
        }

    }
    
    
    @objc func onPasswordChange(_ textField: UITextField) {
        guard let password = passwordTextField.text else { return }
        if password.count > 7 {
            eightCharImageView.image = UIImage(systemName: "checkmark")
            eightCharImageView.tintColor = .systemGreen
        } else {
            eightCharImageView.image = UIImage(systemName: "square")
            eightCharImageView.tintColor = .orange
        } 
        if MBValidation.containUpperCase(password) {
            upperCaseImageView.image = UIImage(systemName: "checkmark")
            upperCaseImageView.tintColor = .systemGreen
        } else {
            upperCaseImageView.image = UIImage(systemName: "square")
            upperCaseImageView.tintColor = .orange
        }
        if MBValidation.containSpecialChar(password) {
            specialCharImageView.image = UIImage(systemName: "checkmark")
            specialCharImageView.tintColor = .systemGreen
        } else {
            specialCharImageView.image = UIImage(systemName: "square")
            specialCharImageView.tintColor = .orange
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}

extension MBSignupPageTVCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}





extension MBSignupPageTVCell: UITextFieldDelegate {
    
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
        guard let email = emailTextField.text else { return }
        if MBValidation.isValidEmail(email) {
            emailErrorLabel.text = ""
        } else {
            emailErrorLabel.text = "Enter valid email"
        }
    }
    
    
    private func setPasswordError() {
        
    }
    
}


extension MBSignupPageTVCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        list[row].country
    }
}
