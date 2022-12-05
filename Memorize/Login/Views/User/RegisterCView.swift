//
//  RegisterCView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI

struct RegisterCView: View {
    @State var username:String = ""
   @State var   password:String = ""
    @State var   lastname:String = ""
    @State var   email:String = ""
    @State private var redirectLogin = false

    @ObservedObject var viewModel = UserViewModel()

    var body: some View {
        
        VStack(alignment: .leading ,spacing: 40){
            // Top View
            Image("headerLogin")
                .overlay(
                    
                    VStack( spacing: 10) {
                        Spacer(minLength: 500)
                        
                        Text("First Name")
                                .font(.callout)
                                .bold()
                                
                                
                        TextField("Enter first Name...", text:  $viewModel.firstName)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                        Text("Last Name")
                                .font(.callout)
                                .bold()
                                
                        TextField("Last name...", text:  $viewModel.lastName)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                        Text("Email")
                                .font(.callout)
                                .bold()
                                
                        TextField(" Email...", text: $viewModel.email)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                        
                        Text("Password")
                                .font(.callout)
                                .bold()
                                
                        SecureField("Enter password...", text: $viewModel.password)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                                .disableAutocorrection(true)
                        
                    }.padding([.leading,.trailing],27.5)
                    
                    
                )
            Spacer(minLength: 100)
            NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true),isActive: $redirectLogin){
             
                Button("Register", action: {
                    viewModel.SignUp(user: User(firstname: viewModel.firstName, password:viewModel.password, email: viewModel.email, lastName: viewModel.lastName))
                    
                        redirectLogin=true
                        
                    
                    
                })
                .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                                .position(x:180,y: 10)
                                .padding(20)
                
                
                
            }
            
            
            // Bottom View
            Image("bottomLogin")
                .overlay (
                    
                    HStack {
                        
                        Spacer()
                        
                      
                        
                    }.padding(50)
                )
        }
       
        .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()

    }
    
}

struct RegisterCView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterCView()
    }
}

