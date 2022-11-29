
//
//  Casemodel.swift
//  Memorize
//
//  Created by Apple Esprit on 26/11/2022.
//

import Foundation
struct Case{
    
    var id: String = ""
  
    var title : String = ""
    var description : String = ""
    var traite :Bool = false
    var prenom : String = ""
    var name : String = ""

    init(  traite : Bool , description:String,title:String,name:String,prenom:String) {
        self.traite = traite
        self.name = name
        self.prenom = prenom
        self.description = description
        self.title = title
      
    }
    
    
    
}
