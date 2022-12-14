//
//  RegisterAvocatView.swift
//  Memorize
//
//  Created by Apple Esprit on 17/11/2022.
//

import SwiftUI
import RiveRuntime

struct RegisterAvocatView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State private var isShowingContentView = false
    @State private var isLogin = false
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var selectedItem = "" // 2
    @State var annee = ["0","1", "2", "3", "5"] // 1
    @State var SelectedItem = "0" // 2
    @State var experience = ""
    var currentUser: User?
    @State var logout : Bool = false
    @State var map : Bool = false
    @Binding var Location : String
    @ObservedObject  var categorieViewModel = CategorieViewModel()
    var body: some View {
        NavigationView{
            
        
            VStack(alignment: .leading ,spacing: 40){
                        VStack {
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
                                        Text(categorieViewModel.categories[item].name)
                                    }.padding(.trailing)
                                }.pickerStyle(.inline)
                                
                            }
                            HStack{
                                NavigationLink(destination:   Home().navigationBarBackButtonHidden(true), isActive: $map)
                                {
                                Button {
                                  map = true
                                } label: {
                                    Text("localisation :")
                                }   }
                            }
                            
                           
                            Button{
                                
                            } label: {
                                
                                HStack{
                                    
                                    Text("Upload Your CV  ").font(.title)
                                        .tint(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1)))
                                    Image(systemName: "tray.and.arrow.down.fill").font(.title)
                                        .tint(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).onTapGesture {
                                            self.showImagePicker = true
                                        }
                                }.frame(alignment: .leading).sheet(isPresented: $showImagePicker)
                                {
                                    
                                    ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                                    
                                }
                                
                            }
                                
                            
                        }.padding([.leading,.trailing],27)
                        
                        
                    
              
                
                // Bottom View
              
                        
                        HStack {
                            
                            Spacer()
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                                Button("Register", action: {
                                    UserViewModel.currentUser?.specialite = selectedItem
                                    UserViewModel.currentUser?.experience = Int(SelectedItem) ?? 0
                                    viewModel.updateAvocat(id: UserViewModel.currentUser?.id ?? "" , specialite: selectedItem, experience: UserViewModel.currentUser?.experience ?? 0,location: Location)
                                    UserViewModel.currentUser = nil

                                    logout = true
                                })
                                .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3).padding()
                                
                                
                            }
                            
                            
                        }.padding(50)
                    
            }
            .padding(40)
            .padding(.top, 40)
            .background(
                RiveViewModel(fileName: "new_file").view()
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .blur(radius: 30)
            )
            
        }
    }
    
    
}
struct CategorieView0: View {
    
    var categorie :Categorie
    
    var body: some View {
        
        VStack {
            
            Text(categorie.name)
        }
    }}
