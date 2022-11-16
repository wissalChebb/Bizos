//
//  UserModel.swift
//  Memorize
//
//  Created by Apple Esprit on 12/11/2022.
//
import Foundation

struct User {
    
    
    var firstName : String
    var lastName : String
    var password : String
    var email : String 
    var id: String!
    var image : String = ""
    
    init(firstname: String, password: String, email: String, lastName: String) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
   
    }
    
    
}
