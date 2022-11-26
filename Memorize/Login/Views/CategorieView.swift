//
//  CategorieView.swift
//  Memorize
//
//  Created by Apple Esprit on 22/11/2022.
//

import SwiftUI

struct CaategorieView: View {
    @ObservedObject  var cat = CategorieViewModel()
    var body: some View {
        HStack{
            Button("try", action: {
                cat.getCategorie()
            })
        }
    
        
    }
}

struct CaategorieView_Previews: PreviewProvider {
    static var previews: some View {
        CaategorieView()
    }
}
