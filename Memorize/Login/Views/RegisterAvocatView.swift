//
//  RegisterAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 17/11/2022.
//

import SwiftUI

struct RegisterAvocatView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State private var isShowingContentView = false
    @State private var isLogin = false
    @State var options = ["Civil Right", "Commercial and Business Law", "Criminal Law And Criminal Procedure", "Social Right"] // 1
     @State var selectedItem = "Swift" // 2
    @State var annee = ["0","1", "2", "3", "5"] // 1
    @State var SelectedItem = "0" // 2
    @State var experience = ""
    var currentUser: User?
    @State private var isShowingRegisterView = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading ,spacing: 40){
                // Top View
                Image("headerLogin")
                    .overlay(
                        
                        VStack( spacing: 0) {
                            Spacer()
                            HStack{
                            Text("Experience:")
                                    .font(.title3)
                                .bold()
                            
                            Picker("Pick a language", selection: $SelectedItem) { // 3
                                ForEach(annee, id: \.self) { item in // 4
                                    Text(item) // 5
                                }
                            }.pickerStyle(.wheel)}
                            HStack{
                                Text("Categorie:")
                                    .font(.title3)
                                    .bold()
                                Picker("Pick a language", selection: $selectedItem) { // 3
                                    ForEach(options, id: \.self) { item in // 4
                                        Text(item) // 5
                                    }
                                }.pickerStyle(.inline)
                                
                            }
                                
                            
                        }.padding([.leading,.trailing],27.5)
                        
                        
                    )
              
                
                // Bottom View
                Image("bottomLogin")
                    .overlay (
                        
                        HStack {
                            
                            Spacer()
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $isShowingRegisterView){
                                Button("Register", action: {
                                    
                                    isShowingRegisterView = true
                                })
                                .foregroundColor(.black)
                                .frame(width: 100, height: 40)
                                .border(.black,width: 2.0)
                                
                                
                            }
                            
                            
                        }.padding(50)
                    )
            }
            
            .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
        }
        
    }
    
}

struct RegisterAvocatView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAvocatView()
    }
}
