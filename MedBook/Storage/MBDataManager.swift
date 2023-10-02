//
//  MBDataManager.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import Foundation


class MBDataManager {
    
    static let shared = MBDataManager()
    private var email: String?
    private var password: String?
    
    private init() {}
    
    func setUserData(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "EMAIL")
        UserDefaults.standard.set(password, forKey: "PASSWORD")
    }
    
    
    func getEmail() -> String? {
        UserDefaults.standard.value(forKey: "EMAIL") as? String
    }
    
    
    func getPassword() -> String? {
        UserDefaults.standard.value(forKey: "PASSWORD") as? String
    }
    
    
    func isUserLoggedIn() -> Bool {
        if let _ = UserDefaults.standard.value(forKey: "EMAIL") as? String {
            return true
        }
        return false
    }
    
    
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: "EMAIL")
        UserDefaults.standard.removeObject(forKey: "PASSWORD")
    }
}
