//
//  LoginView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI

struct ForgetView: View {
    
    @ObservedObject var vi = UserViewModel()
    @State private var email = ""
    
    @State private var isShowingRegisterView = false
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 40){
            // Top View
            Image("headerLogin")
                .overlay(
                    
                    VStack( spacing: 100) {
                        Spacer()
                        
                        Text("Email")
                                .font(.callout)
                                .bold()
                                
                        TextField("Enter Email...", text: $email)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        
                        
                    }.padding([.leading,.trailing],27.5)
                    
                    
                )
            HStack{
                NavigationLink(destination: ResetCodeView(email:$email).navigationBarBackButtonHidden(true),isActive: $isShowingRegisterView){
                    Button("enter", action: {
                        
                        vi.ResetPassword(email: email)
                        
                        
                        isShowingRegisterView = true
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

struct ForgetView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetView()
    }
}

