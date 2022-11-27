//
//  UserModel.swift
//  Memorize
//
//  Created by Apple Esprit on 12/11/2022.
//
import Foundation

struct User {
    
    
    var firstName : String = ""
    var lastName : String = ""
    var password : String = ""
    var email : String = ""
    var id: String! = ""
    var image : String = ""
    var role : String = ""
    var specialite  : String = ""
    var experience : Int = 0
    
    init(firstname: String, password: String, email: String, lastName: String , specialite: String, image:String , experience:Int, role:String) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
        self.image = image
        self.role = role
        self.specialite = specialite
  
        self.experience = experience
    }
    
    init(firstname: String, password: String, email: String, lastName: String , image:String, role:String) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
        self.image = image
        self.role = role
    }
    init(firstname: String, password: String, email: String, lastName: String ) {
        self.firstName = firstname
        self.password = password
        self.email = email
        self.lastName = lastName
        
   
    }
    init(firstname:  String, lastName: String, specialite: String, image:String , experience:Int) {
        self.firstName = firstname
        self.lastName = lastName
        self.specialite = specialite
        self.image = image
        self.experience = experience
        
        
   
    }
    
    
    
}
