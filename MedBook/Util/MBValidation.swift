//
//  MBValidation.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import Foundation


struct MBValidation {
    
    // TODO: - need add doc comment
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // TODO: - need add doc comment
    static func isValidPassword(_ password: String) -> Bool {
        if password.count < 8 {
            return false
        }
        if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
            return false
        }
        
        if password.range(of: ".*[A-Z]+.*", options: .regularExpression) == nil {
            return false
        } 
        if password.range(of: ".*[a-z]+.*", options: .regularExpression) == nil {
            return false
        }
        return true
    }
    
    
    // TODO: -  need to add doc comment
    static func getPasswordValidationMessage(_ password: String) -> String? {
        
        if password.count < 8 {
            return "Password should be atleast 8 character"
        }
   
        if password.range(of: ".*[A-Z]+.*", options: .regularExpression) == nil  {
            return "Password should contain atleast one uppercase"
        }
        
        if password.range(of: ".*[a-z]+.*", options: .regularExpression) == nil {
            return "Password should contain atleast one lowercase"
        }
        
        if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
            return "Password should contain atleast one special character"
        }
        
        return nil
    }
    
    // TODO: - need add doc comment
    static func containSpecialChar(_ string: String) -> Bool {
        string.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
    
    // TODO: - need add doc comment
    static func containUpperCase(_ string: String) -> Bool {
        (string.range(of: ".*[A-Z]+.*", options: .regularExpression) != nil)
    }
    
}
