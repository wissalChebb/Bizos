//
//  ScanData.swift
//  Memorize
//
//  Created by Apple Esprit on 10/12/2022.
//

import Foundation
struct ScanData : Identifiable{
    var id = UUID()
    let content : String
    init(content: String) {
      
        self.content = content
    }
}
