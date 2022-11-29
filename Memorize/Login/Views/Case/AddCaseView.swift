//
//  AddCaseView.swift
//  Memorize
//
//  Created by Apple Esprit on 29/11/2022.
//

import SwiftUI

struct AddCaseView: View {
    var body: some View {
        ZStack{
            Image("pac").frame(width: 400,height:1000).ignoresSafeArea()
            HStack{
                HStack{
                    Text("vbnvb")
                   
                    
                    
                }.padding()
                VStack(alignment: .leading){
                    Text("cvbc").bold()
                    Text("cbvb")
                    
                }.padding()
               
                
            }.frame(width: 350,height: 200).cornerRadius(40)
            
        }.ignoresSafeArea()
}
    }


struct AddCaseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCaseView()
    }
}
