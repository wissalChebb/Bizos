//
//  EditProfileUView.swift
//  Memorize
//
//  Created by Apple Esprit on 11/11/2022.
//

import SwiftUI

struct EditProfileUView: View {
    @State var username:String = UserViewModel.currentUser?.firstName ?? ""
    @State var  password:String =  UserViewModel.currentUser?.password ?? ""
    @ObservedObject var viewModel = UserViewModel()
    @State var   verifpassword:String=""
    @State var   lastname:String = UserViewModel.currentUser?.lastName ?? ""

    @State var   email:String = UserViewModel.currentUser?.email ?? ""
    @State var  description:String = ""
    @State private var image: String = ""
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var update : Bool = false
    @State var isdisabledEmail : Bool = true
    @State var activateSecurePwd : Bool = false
    @State var logout : Bool = false
    
    var body: some View {
        ZStack{
                VStack{
                    ZStack{
                        VStack{}.frame(maxWidth: .infinity,maxHeight: 190).background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
                        HStack() {
                            Image("cercle").resizable().scaledToFill().frame(width: 180,height: 180)
                            Spacer()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                    VStack(spacing: 16){
                        HStack{
                            VStack{
                                
                                ZStack{
                                    ZStack
                                    {
                                        //RoundedRectangle(cornerRadius:15).stroke(.gray).background(.green.opacity(0.06)).cornerRadius(15)
                                        
                                        ZStack{
                                            
                                            if let selectedImage = selectedImage {
                                                
                                                Image(uiImage:selectedImage).resizable().clipShape(Circle()).frame(maxWidth:.infinity,maxHeight: .infinity)
                                                 
                                                
                                            }else{
                                                Image("wissal").resizable().clipShape(Circle()).scaledToFit()
                                                
                                            }
                                            
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    Spacer()
                                                    Spacer()
                                                    Image(systemName: "camera").font(.system(size: 40, weight:.medium)).foregroundColor(.red).onTapGesture {
                                                        self.showImagePicker = true
                                                    }
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                    .onChange(of: self.selectedImage)
                                    { newVal in
                                        self.selectedImage = newVal
                                    }.onAppear
                                    {
                                        self.selectedImage = nil
                                    }
                                    
                                    
                                    
                                }.frame(width:350,height: 200)
                                
                            }
                           
                        }.padding(.top,55)
                      
                        
                        ScrollView{
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    
                                    TextField("", text: $username).disabled(isdisabledEmail).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50).padding(.top,16)
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if lastname.isEmpty {
                                        Text("lastname").foregroundColor(.red).padding()
                                    }
                                    TextField("", text: $lastname).disabled(isdisabledEmail).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if email.isEmpty {
                                        Text("email").foregroundColor(.red).padding()
                                    }
                                    TextField("", text: $email).disabled(isdisabledEmail).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if password.isEmpty {
                                        Text("passowrd").foregroundColor(.red).padding()
                                    }
                                    SecureField("", text: $password).disabled(isdisabledEmail).onChange(of: password, perform: { newValue in
                                        isChangedPwd(currentPwd:  UserViewModel.currentUser?.password ?? "", pwd: $password.wrappedValue)
                                    }).foregroundColor(Color.blue).padding()
                                    
                                    
                                    
                                    
                                }
                                
                            }.frame(width:350, height: 50)
                            if activateSecurePwd{
                                
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                    ZStack(alignment: .leading){
                                        
                                        
                                        SecureField("", text: $verifpassword).foregroundColor(Color.blue).padding()
                                        
                                        
                                        
                                    }
                                }.frame(width:350, height: 50)
                            }
                            
                            Button{   self.update = true
                                print(update)
                                isdisabledEmail.toggle()
                                if isdisabledEmail == true{
                                    UserViewModel.currentUser?.email = email
                                    UserViewModel.currentUser?.firstName = username
                                    UserViewModel.currentUser?.lastName = lastname
                                    UserViewModel.currentUser?.password = password
                                    
                                    viewModel.updateUser(user: UserViewModel.currentUser!, image: selectedImage!)
                                }
                                
                            }label:{Text("UPDATE").frame(width:350, height: 50).foregroundColor(.white).background(.gray).cornerRadius(15).shadow(radius: 3).padding()}
                            
                            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $logout ){
                                Button{
                                    UserViewModel.currentUser = nil
                                    logout=true
                                    
                                }label:{Text("LOG OUT").frame(width:350, height: 50).foregroundColor(.white).background(.gray).cornerRadius(15).shadow(radius: 3).padding()}
                            
                            
                            
                            
                            
                        }
                        }
                        
                    }
                
                
                
            }.frame(alignment: .leading).sheet(isPresented: $showImagePicker)
            {
                
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                
            }
        
        
        
        }
    
    func isChangedPwd(currentPwd:String,pwd:String)  {
        if !(currentPwd == pwd){
            activateSecurePwd = true
            
        }else{
            activateSecurePwd = false
            
        }
    }
    
    
    
    }



