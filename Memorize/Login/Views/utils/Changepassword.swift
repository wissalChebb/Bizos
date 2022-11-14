//
//  Changepassword.swift
//  Memorize
//
//  Created by Apple Esprit on 14/11/2022.
//


import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State private var isShowingContentView = false
    
    
    @State private var isShowingRegisterView = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading ,spacing: 40){
                // Top View
                Image("headerLogin")
                    .overlay(
                        
                        VStack( spacing: 10) {
                            Spacer()
                            
                            Text("Username")
                                .font(.callout)
                                .bold()
                            
                            TextField("Enter username...",text:$viewModel.email)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            Text("Password")
                                .font(.callout)
                                .bold()
                            
                            SecureField("Enter password..." , text:$viewModel.password)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                        }.padding([.leading,.trailing],27.5)
                        
                        
                    )
                HStack{
                    NavigationLink(destination: LoginView()){
                        Button("Login", action: {
                            print(viewModel.email)
                            viewModel.LogIn(email: viewModel.email, password: viewModel.password,onSuccess: {
                                isShowingContentView = true
                                
                            } ,onError:    {
                                (errorMessage) in
                            }
                                            
                            )
                            
                        })}
                        .foregroundColor(.black)
                        .frame(width: 100, height: 40)
                        .border(.black,width: 2.0)
                        .padding(20)
                        
                 
                    
                    Spacer()
                    NavigationLink(destination: ForgetView()){
                        Text("forget ")
                            .foregroundColor(.blue)
                            .frame(width: 100, height: 40)
                            .padding(20)
                        
                        
                    }}
                
                // Bottom View
                Image("bottomLogin")
                    .overlay (
                        
                        HStack {
                            
                            Spacer()
                            NavigationLink(destination: RegisterCView(),isActive: $isShowingRegisterView){
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

