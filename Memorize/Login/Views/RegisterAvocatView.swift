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
// 1
     @State var selectedItem = "Swift" // 2
    @State var annee = ["0","1", "2", "3", "5"] // 1
    @State var SelectedItem = "0" // 2
    @State var experience = ""
    var currentUser: User?
    @State var logout : Bool = false
    @ObservedObject  var categorieViewModel = CategorieViewModel()
    var body: some View {
       
            VStack(alignment: .leading ,spacing: 40){
          
             
                // Top View
                Image("headerLogin")
                    .overlay(
                        
                        VStack( spacing: 0) {
                            Spacer()
                            Text("Became a Loyer").font(.title)
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
                                    ForEach(0..<categorieViewModel.categories.count,id: \.self ) { item in
                                        CategorieView0(categorie: categorieViewModel.categories[item])
                                    }.padding(.trailing)
                                }.pickerStyle(.inline)
                                
                            }
                                
                            
                        }.padding([.leading,.trailing],27.5)
                        
                        
                    )
              
                
                // Bottom View
                Image("bottomLogin")
                    .overlay (
                        
                        HStack {
                            
                            Spacer()
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                                Button("Register", action: {
                                    UserViewModel.currentUser?.specialite = selectedItem
                                    UserViewModel.currentUser?.experience = Int(SelectedItem) ?? 0
                                    viewModel.updateAvocat(id: UserViewModel.currentUser?.id ?? "" , specialite: UserViewModel.currentUser?.specialite ?? "", experience: UserViewModel.currentUser?.experience ?? 0)
                                    UserViewModel.currentUser = nil

                                    logout = true
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
struct CategorieView0: View {
    
    var categorie :Categorie
    
    var body: some View {
        
        VStack {
            
            Text(categorie.name)
        }
    }}
struct RegisterAvocatView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterAvocatView()
    }
}
