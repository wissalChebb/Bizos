//
//  UserManager.swift
//  Memorize
//
//  Created by Wissal Chebbi on 30/12/2022.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    func saveUser(user: User) {
        UserDefaults.standard.set(user.email, forKey: "emailUser")
        UserDefaults.standard.set(user.password, forKey: "passwordUser")
    }
    
    func getUserData() -> (String?, String?) {
        (UserDefaults.standard.string(forKey: "emailUser"), UserDefaults.standard.string(forKey: "passwordUser"))
    }
}
