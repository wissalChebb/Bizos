//
//  CaseView.swift
//  Memorize
//
//  Created by Apple Esprit on 29/11/2022.
//


import SwiftUI

struct CaseView: View {
    @State private var showNewPostView = false
    
    @ObservedObject  var caseViewModel = CasesViewModel()
    var body: some View {
        VStack{
            HStack{
                TagLineViewCase()
                Spacer()
            }
            Spacer()
            ZStack{
                ScrollView{
               
                    VStack(spacing:20.0){
                        ForEach(0..<caseViewModel.casesAvocat.count , id: \.self ) { item in
                           ItemCase(casee: caseViewModel.casesAvocat[item])
                        }.padding(.trailing)
                        
                    }
                    
                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .onAppear{
                        
                        caseViewModel.getCaseByAvocat(id: (UserViewModel.currentUser?.id)!, complited: {(success , respnse)in
                            if success{
                                caseViewModel.casesAvocat = respnse!
                                print("ahyaaaaa", caseViewModel.casesAvocat)
                            }else {
                                print("error cant connect ")
                            }
                            
                        })
                    }
                
            }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
            ZStack {
                Button{
                                showNewPostView.toggle()
                            }label: {
                                Image("t")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 40,height: 40)
                                    .padding()
                            }
                            .background(Color(.gray))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .padding()
                            .sheet(isPresented: $showNewPostView)
                            {
                                AddCaseView()
                            }
                           
                
                            
                           
            }
            
        }.background(Color(uiColor: UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)))
    }
}

struct TagLineViewCase: View {
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
struct ItemCase:View{
   
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
struct CaseView_Previews: PreviewProvider {
    var casee : Case
    static var previews: some View {
        CaseView()
    }
}
