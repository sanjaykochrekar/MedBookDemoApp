//
//  MBSignupVM.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

protocol MBSignupVMDelegate {
    func handleLogin()
}

class MBSignupVM {
    var delegate: MBSignupVMDelegate?
    
    func signUp(email: String, password: String, country: String) {
        MBDataManager.shared.setUserData(email: email, password: password)
        delegate?.handleLogin()
    }
    
}
