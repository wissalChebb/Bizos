//
//  Payment.swift
//  Memorize
//
//  Created by Apple Esprit on 1/1/2023.
//

import Foundation
struct payment {
   
    var idUser: String
    var image: String
    var url : String
    
    
    init(  idUser: String ,image: String ,  url:String) {
        self.idUser = idUser
        self.image = image
        self.url = url

    }

    
}
