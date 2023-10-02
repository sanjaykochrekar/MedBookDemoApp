//
//  MBValidation.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import Foundation


struct MBValidation {
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    // TODO: -  need to optimise and correct
    static func isvalidPassword(_ password: String) -> String? {
        
        if password.count < 8 {
            return "Password should be atleast 8 character"
        }
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let capitalLetterPredicate = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        
        if capitalLetterPredicate.evaluate(with: password) {
            return "Password should contain atleast one uppercase"
        }
        
        let lowerLetterRegEx  = ".*[a-z]+.*"
        let lowerLetterPredicate = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        
        if lowerLetterPredicate.evaluate(with: password) {
            return "Password should contain atleast one lowercase"
        }
        
        
        if password.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) == nil {
            return "Password should contain atleast one special character"
        }
        
        return nil
    }
    
    
    static func containSpecialChar(_ string: String) -> Bool {
        string.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
    
    static func containUpperCase(_ string: String) -> Bool {
        (string.range(of: ".*[A-Z]+.*", options: .regularExpression) != nil)
    }
    
}
