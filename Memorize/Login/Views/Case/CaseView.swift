//
//  CaseView.swift
//  Memorize
//
//  Created by Apple Esprit on 29/11/2022.
//


import SwiftUI

struct CaseView: View {
    var casee : Case
    @ObservedObject  var caseViewModel = CasesViewModel()
    var body: some View {
        VStack{
            HStack{
            TagLineView3()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
               
                    VStack(spacing:20.0){
                        ForEach(0..<caseViewModel.cases.count , id: \.self ) { item in
                            PackItemCase(casee: caseViewModel.cases[item])
                        }.padding(.trailing)
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
            }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
        }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
    }
}

struct TagLineViewCase: View {
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
struct PackItemCase:View{
    var casee : Case
    var body: some View {
        ZStack{
            Image("pac").frame(width: 340,height: 190).cornerRadius(30)
            HStack{
                VStack(alignment: .leading){
                    Text(casee.name)
                    Text(casee.prenom)
                    
                    
                }.padding()
                VStack(alignment: .leading){
                    Text(casee.title).bold()
                    Text(casee.description)
                    
                }.padding()
                
            }.frame(width: 350,height: 200).cornerRadius(40)
        }
}
}
struct CaseView_Previews: PreviewProvider {
    var casee : Case
    static var previews: some View {
        CaseView(casee: Case(traite: true, description: "", title: "", name: "", prenom: ""))
    }
}
