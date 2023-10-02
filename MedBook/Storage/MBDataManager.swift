//
//  MBDataManager.swift
//  MedBook
//
//  Created by Sanju on 02/10/23.
//

import Foundation


/// Singlleton class for data storage
///
/// MBDataManager is a singleton class used for storing userdata
/// inside the app.
class MBDataManager {
    
    static let shared = MBDataManager()
    private var email: String?
    private var password: String?
    
    private init() {}
    
    /// - Parameters:
    ///  - email: email address of the user
    ///  - password: password of the user
    func setUserData(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "EMAIL")
        UserDefaults.standard.set(password, forKey: "PASSWORD")
    }
    
    
    /// - Returns: email address
    func getEmail() -> String? {
        UserDefaults.standard.value(forKey: "EMAIL") as? String
    }
    
    
    /// - Returns: password address
    func getPassword() -> String? {
        UserDefaults.standard.value(forKey: "PASSWORD") as? String
    }
    
    
    /// - Returns: is user  logged in
    func isUserLoggedIn() -> Bool {
        if let _ = UserDefaults.standard.value(forKey: "EMAIL") as? String {
            return true
        }
        return false
    }
    
    
    /// Clear all data from Userdefault
    func clearUserData() {
        UserDefaults.standard.removeObject(forKey: "EMAIL")
        UserDefaults.standard.removeObject(forKey: "PASSWORD")
    }
}
