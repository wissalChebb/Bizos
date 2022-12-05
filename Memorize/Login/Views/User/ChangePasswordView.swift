//
//  ChangePasswordView.swift
//  Memorize
//
//  Created by Apple Esprit on 14/11/2022.
//

//
//  LoginView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State private var isShowingContentView = false
    @State private var isShowingLoginR = false
    
    @State private var  Stringpass  = "";
    @Binding var email: String
    @State private var isShowingRegisterView = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading ,spacing: 40){
                // Top View
                Image("headerLogin")
                    .overlay(
                        
                        VStack( spacing: 10) {
                            Spacer()
                            
                            Text("your New password ")
                                .font(.callout)
                                .bold()
                            
                            SecureField("Enter your new password...",text:$viewModel.newPassword)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            Text("Confirm Password")
                                .font(.callout)
                                .bold()
                            
                            SecureField("Confirme password..." , text:$viewModel.confirmpass)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                            
                        }.padding([.leading,.trailing],27.5)
          
                    )
                HStack{
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $isShowingLoginR){
                        Button("confirm", action: {
                           
                                print(email);
                            viewModel.changePassword(email: email , newPassword: viewModel.newPassword)
                                isShowingLoginR = true
                            
                            
                        })
                        
                        
                        .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                                            .position(x:180,y: 10)
                                            .padding(20)
                        
                        
                        
                        Spacer()
                    }
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
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
}



