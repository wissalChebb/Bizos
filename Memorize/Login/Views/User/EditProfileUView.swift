//
//  EditProfileUView.swift
//  Memorize
//
//  Created by Apple Esprit on 11/11/2022.
//

import SwiftUI

struct EditProfileUView: View {
    @State var firstName:String = UserViewModel.currentUser?.firstName ?? ""
    @State var  password:String =  UserViewModel.currentUser?.password ?? ""
    @ObservedObject var viewModel = UserViewModel()
    @State var   verifpassword:String=""
    @State var   lastname:String = UserViewModel.currentUser?.lastName ?? ""

    @State var   email:String = UserViewModel.currentUser?.email ?? ""
    @State var  description:String = ""
    @State private var image: String = ""
    @State var selectedImage: UIImage?
    @State var showImagePicker : Bool = false
    @State var update : Bool = true
    @State var isdisabledEmail : Bool = true
    @State var activateSecurePwd : Bool = false
    @State var logout : Bool = false
    
    var body: some View {
        ZStack{
                VStack{
                    ZStack{
                       
                        VStack{}.frame(maxWidth: .infinity,maxHeight: 190).background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
                    
                       
                    }
                    Spacer()
                }
            Image("cercle").resizable().scaledToFill().frame(width: 180,height: 180).position(x:100,y:30)
                    VStack(spacing: 16){
                        HStack{
                            VStack{
                                
                                ZStack{
                                    ZStack
                                    {
                                        //RoundedRectangle(cornerRadius:15).stroke(.gray).background(.green.opacity(0.06)).cornerRadius(15)
                                        
                                        ZStack{
                                            
                                            if let selectedImage = selectedImage {
                                                
                                                Image(uiImage:selectedImage) .resizable()
                                                    .cornerRadius(7)
                                                    .padding(1) // Width of the border
                                                    .background(Color.gray.opacity(0.10))
                                                    .cornerRadius(10)
                                                    
                                                    .clipShape(Circle())
                                                    
                                                    .scaledToFit()
                                                   
                                                    .frame(width: 600, height: 300)
                                                 
                                                
                                            }else{
                                              
                                                AsyncImage(url: URL(string: "http://172.17.1.190:5000/img/"+(UserViewModel.currentUser?.image ?? "image1.jpg")),
                                                    content:{ image in
                                                                   image
                                                        .resizable()
                                                        .cornerRadius(7)
                                                        .padding(1) // Width of the border
                                                        .background(Color.gray.opacity(0.10))
                                                        .cornerRadius(10)
                                                        
                                                        .clipShape(Circle())
                                                        
                                                        .scaledToFit()
                                                       
                                                        .frame(width: 600, height: 300)
                                                    
                                                        
                                                        
                                                        
                                                               },placeholder: { })
                                            }
                                            
                                            VStack {
                                                Spacer()
                                                HStack {
                                                    
                                                    Image(systemName: "camera").font(.system(size: 40, weight:.medium)).foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1))).onTapGesture {
                                                        self.showImagePicker = true
                                                    }.position(x:350,y: 230)
                                                  
                                                }
                                            }
                                        }.foregroundColor(Color(uiColor: UIColor(red: 1, green: 0.85, blue: 0.77, alpha: 1)))
                                    }
                                    .onChange(of: self.selectedImage)
                                    { newVal in
                                        self.selectedImage = newVal
                                    }.onAppear
                                    {
                                        self.selectedImage = nil
                                    }
                                    
                                    
                                    
                                }.frame(width:350,height: 200)
                                Menu {
                                    
                                    Button(action: {
                                       
                                           
                                               UserViewModel.currentUser?.email = email
                                               UserViewModel.currentUser?.firstName = firstName
                                               UserViewModel.currentUser?.lastName = lastname
                                  
                                        viewModel.updateUser(user: UserViewModel.currentUser!, image: selectedImage!)
                                           
                                           
                                       
                                       
                                    }) {
                                        Label {
                                            Text("Update")
                                        } icon: {
                                            Image(systemName: "arrow.up.to.line.circle")
                                        }
                                    }
                                    
                                    Button(action: {
                                       
                                        
                                    }) {
                                        Label {
                                            Text("Delete")
                                        } icon: {
                                            Image(systemName: "delete.backward")
                                        }
                                    }
                                    
                                } label: {
                                    Image(systemName: "menucard")
                                        .font(.title)
                                        .tint(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1)))
                                       
                                
                                } .position(x:350,y: -50)
                            }
                           
                        }.padding(.top,55)
                      
                        
                        ScrollView{
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray).background(Color.black.opacity(0.1)).cornerRadius(15)
                                ZStack(alignment: .leading){
                                    if lastname.isEmpty {
                                        Text("firstName").foregroundColor(.red).padding()
                                    }
                                    TextField("", text: $firstName).foregroundColor(Color.blue).padding()
                                }
                                
                            }.frame(width:350, height: 50).padding(.top,16)
                            ZStack{
                                RoundedRectangle(cornerRadius:15).stroke(Color.gray.opacity(0.5)).background(Color.black.opacity(0.1)).cornerRadius(15)
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
struct EditProfileUView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileUView()
    }
}



/*ZStack{
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
*/
