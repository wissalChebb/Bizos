
//
//  Casemodel.swift
//  Memorize
//
//  Created by Apple Esprit on 26/11/2022.
//

import Foundation
struct Case{
    
    var id: String!
    var nameU : String
    var title : String
    var description : String
    var traite :Bool
    init(  traite : Bool ,nameU: String, description:String,title:String) {
        self.traite = traite
        self.nameU = nameU
        self.description = description
        self.title = title
      
    }
    
    
    
}
