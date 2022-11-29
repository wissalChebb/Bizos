//
//  CategorieModel.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//




import Foundation
struct Categorie {
    
    var id: String!
    var name : String
    var image : String

    
    init(  id : String ,name: String,image:String) {
        self.id = id
        self.name = name
        self.image = image
      
    }
    
    
    
}
