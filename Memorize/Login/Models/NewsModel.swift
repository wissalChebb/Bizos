//
//  NewsModel.swift
//  Memorize
//
//  Created by Apple Esprit on 28/11/2022.
//

import Foundation
struct News {
    
    var title: String
    var date : String
    var snippet : String
    var thumbnail : String

    
    init(  title: String , date: String , snippet:String ,thumbnail:String) {
        self.title = title
        self.date = date
        self.snippet = snippet
        self.thumbnail = thumbnail
      
    }
    
    
    
}
