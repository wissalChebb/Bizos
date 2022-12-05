//
//  LoginView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI

struct ResetCodeView: View {
    @State var Code:String = ""
   
    @ObservedObject var viewModel = UserViewModel()
    @State private var isValidCode = false
    @Binding var email: String
    @State private var isShowingRegisterView = false
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 40){
            // Top View
            Image("headerLogin")
                .overlay(
                    
                    VStack( spacing: 100) {
                        Spacer()
                        
                        Text("Code")
                                .font(.callout)
                                .bold()
                                
                        TextField("Enter CODE...", text: $viewModel.validateCode)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        
                        
                    }.padding([.leading,.trailing],27.5)
                    
                    
                )
            HStack{
                NavigationLink(destination: ChangePasswordView(email:$email),isActive: $isValidCode){
                    Button("enter", action: {
                        
                        viewModel.ValideCode(code:viewModel.validateCode,complited: {(success ) in
                            if success {
                               
                                print("Valid email ")
                                isValidCode=true
                            }else{
                                print("try to write a valid email ")
                                isValidCode=false
                            }
                        })
                        
                    })
                    .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                                        .position(x:180,y: 10)
                                        .padding(20)
                    
                    
                }
                
                
            }
            
            // Bottom View
            Image("bottomLogin")
                
        }
       
        .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()

    }
    
}


