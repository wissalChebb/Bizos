//
//  PackModel.swift
//  Memorize
//
//  Created by Apple Esprit on 4/12/2022.
//


import Foundation
struct Pack {
    var title: String
    var idUser: String
    var name: String
    var prix : Float
    var description : String
   

    init(  title: String ,name: String , prix: Float , description:String,idUser: String) {
        self.title = title
        self.name = name
        self.prix = prix
        self.description = description
        self.idUser = idUser

    }
    init(  title: String ,name: String , prix: Float , description:String) {
        self.title = title
        self.name = name
        self.prix = prix
        self.description = description
        self.idUser = ""
    }
    
    
    
}

