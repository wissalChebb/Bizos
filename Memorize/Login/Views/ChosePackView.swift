//
//  ChosePackView.swift
//  Memorize
//
//  Created by baccoucheyessin on 11/11/2022.
//

import SwiftUI

struct ChosePackView: View {
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("Chose your").fontWeight(.medium)
                    Text("Pack").fontWeight(.regular).bold()
                }.padding()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
                    PackItem()
                    PackItem()
                    PackItem()
                    PackItem()
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
            }.background(.red)
        }.background(.blue)
    }
}
struct PackItem:View{
    var body: some View {
        ZStack{
            Image("wissal").frame(width: 340,height: 190).cornerRadius(30)
            HStack{
                VStack(alignment: .leading){
                    Text("Pack Gold")
                    
                    VStack{
                        Text("dfhjghkjljklk").bold()
                        Text("ghjh")
                    }.padding()
                }.padding()
                VStack(alignment: .leading){
                    Text("About").bold()
                    Text("hxcgkhcvgclkgkhgckhgckhckhcghgchghclhgclclyc")
                    
                }.padding()
                
            }.frame(width: 350,height: 200).cornerRadius(40)
        }
}
}
struct ChosePackView_Previews: PreviewProvider {
    static var previews: some View {
        ChosePackView()
    }
}
