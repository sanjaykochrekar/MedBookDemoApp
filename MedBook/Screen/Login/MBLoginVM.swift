//
//  MBLoginVM.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//


protocol MBLoginVMDelegate {
    func handleLogin()
}

class MBLoginVM {
    var delegate: MBLoginVMDelegate?
    
    func signUp(email: String, password: String) {
        MBDataManager.shared.setUserData(email: email, password: password)
        delegate?.handleLogin()
    }
}
