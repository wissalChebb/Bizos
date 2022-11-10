//
//  ProfileView.swift
//  Memorize
//
//  Created by Apple Esprit on 10/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack(){
            HStack() {
            
          
                Image("cercle").resizable().scaledToFill().frame(width: 180,height: 180).overlay(
                    VStack(){
                        
                        
                        
                    }
                )
                Spacer()
                
            }
            Spacer()
        
           
        }.ignoresSafeArea()
        HStack{
            
        }.background(.blue)
   
        
    }
    
    
}
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


