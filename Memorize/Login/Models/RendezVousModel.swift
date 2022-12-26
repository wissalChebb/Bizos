//
//  RendezVousModel.swift
//  Memorize
//
//  Created by Apple Esprit on 5/12/2022.
//


import Foundation
struct RendezVous : Decodable{
    var idUser: String
    var idAvocat: String
    var date : Date
   
   

    
    init(  idUser: String ,idAvocat: String , date: Date ) {
        self.idUser = idUser
        self.idAvocat = idAvocat
        self.date = date
     }
    
    
    
}


