//
//  EditProfileUView.swift
//  Memorize
//
//  Created by Apple Esprit on 11/11/2022.
//

import SwiftUI

struct EditProfileUView: View {
    @State var username:String = ""
    @State var  password:String = "kghfiy"
    @State var   verifpassword:String=""
    @State var   lastname:String = "msdi"
    @State var   email:String = "kjhf@gmail/com"
    @State var  description:String = ""
    @State private var image: String = ""
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var update : Bool = false

    
    
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
                                    if update == false{
                                        Text("wissal").foregroundColor(.red).padding()
                                    }else{
                                        TextField("", text: $username).foregroundColor(Color.blue).padding()}
                                }
                                
                            }.frame(width:350, height: 50).padding(.top,16)
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if lastname.isEmpty {
                                        Text("lastname").foregroundColor(.red).padding()
                                    }
                                    TextField("", text: $lastname).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if email.isEmpty {
                                        Text("email").foregroundColor(.red).padding()
                                    }
                                  TextField("", text: $email).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if description.isEmpty {
                                        VStack{
                                            Text("add your description").foregroundColor(.red).padding(.horizontal)
                                            
                                        }
                                    }
                                    TextField("", text: $description).foregroundColor(Color.blue)
                                }
                                
                            }.frame(width:350,height: 100)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if password.isEmpty {
                                        Text("passowrd").foregroundColor(.red).padding()
                                    }
                                    SecureField("", text: $password).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if verifpassword.isEmpty {
                                        Text("verify passowrd").foregroundColor(.red).padding()
                                    }
                                    SecureField("", text: $verifpassword).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50)
                            
                            Button{   self.update = true
                                print(update)
                                
                            }label:{Text("UPDATE").frame(width:350, height: 50).foregroundColor(.white).background(.gray).cornerRadius(15).shadow(radius: 3).padding()}
                            
                            
                            
                        }
                        
                    }
                
                
                
            }.frame(alignment: .leading).sheet(isPresented: $showImagePicker)
            {
                
                ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
                
            }
        }
    }





struct EditProfileUView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileUView()
    }
}
