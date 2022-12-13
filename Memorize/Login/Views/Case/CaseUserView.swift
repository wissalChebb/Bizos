//
//  CaseUserView.swift
//  Memorize
//
//  Created by Apple Esprit on 13/12/2022.
//
//  CaseView.swift
//  Memorize
//
//  Created by Apple Esprit on 29/11/2022.
//


import SwiftUI

struct CaseUserView: View {
    @State private var showNewPostView = false
    
    @ObservedObject  var caseViewModel = CasesViewModel()
    var body: some View {
        VStack{
            HStack{
                TagLineViewCase0()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
               
                    VStack(spacing:20.0){
                        ForEach(0..<caseViewModel.casesUser.count , id: \.self ) { item in
                           ItemCase0(casee: caseViewModel.casesUser[item])
                        }.padding(.trailing)
                        
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .onAppear{
                        
                        caseViewModel.getCaseByNameUser(nameUser: UserViewModel.currentUser?.lastName ?? "", lastName:  UserViewModel.currentUser?.firstName ?? "", complited: {(success , respnse)in
                            if success{
                                caseViewModel.casesAvocat = respnse!
                                print("ahyaaaaa", caseViewModel.casesAvocat)
                            }else {
                                print("error cant connect ")
                            }
                            
                        })
                    }
                
            }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
       
            
        }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
    }
}

struct TagLineViewCase0: View {
    @State private var isAvocat = false
    var body: some View {
        
        HStack{
            Text("Check your  ").font(.custom("PlayfairDisplay-Regular", size: 28))
                .foregroundColor(Color("Primary"))
            + Text("\nCases ! ").font(.custom("PlayfairDisplay-Bold", size: 30))
                .foregroundColor(Color("Primary"))
            
        }.padding()
        
    }
}
struct ItemCase0:View{
   
    var casee : Case
    var body: some View {
        ZStack{
            Image("card").frame(width: 340,height: 190).cornerRadius(30)
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
struct CaseUserView_Previews: PreviewProvider {
    var casee : Case
    static var previews: some View {
        CaseUserView()
    }
}
