//
//  ChosePackView.swift
//  Memorize
//
//  Created by baccoucheyessin on 11/11/2022.
//

import SwiftUI

struct ChosePackView: View {
    @ObservedObject  var packViewModel = PackViewModel()
    var body: some View {
        VStack{
            HStack{
            TagLineView3()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
               
                    ForEach(0..<packViewModel.packs.count , id: \.self ) { item in
                       PackItem(pack: packViewModel.packs[item])
                    }.padding(.trailing)
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
            }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
        }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
    }
}

struct TagLineView3: View {
    @State private var isAvocat = false
    var body: some View {
        
        HStack{
            Text("Chose your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nPack ! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            
        }.padding()
        
    }
}
struct PackItem:View{
    var pack: Pack
    
    var body: some View {
        ZStack{
            Image("card").frame(width: 340,height: 190).cornerRadius(30)
            HStack{
                VStack(alignment: .leading){
                    Text(pack.name)
                    
                    VStack{
                        Text(String(pack.prix)).bold()
                      
                    }.padding()
                }.padding()
                VStack(alignment: .leading){
                    Text(pack.title).bold()
                    Text(pack.description)
                    
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
