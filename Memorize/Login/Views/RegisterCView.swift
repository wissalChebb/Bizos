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
                                
                        TextField("Enter first Name...", text: $username)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        Text("Last Name")
                                .font(.callout)
                                .bold()
                                
                        TextField("Last name...", text: $lastname)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        Text("Email")
                                .font(.callout)
                                .bold()
                                
                        TextField(" Email...", text: $email)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        Text("Password")
                                .font(.callout)
                                .bold()
                                
                           SecureField("Enter password...", text: $password)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        
                    }.padding([.leading,.trailing],27.5)
                    
                    
                )
            Spacer(minLength: 100)
            NavigationLink(destination: LoginView()){
                Button("Register", action: {
                    // To do
                    // action: navigate to Login page
                })
                .foregroundColor(.black)
                .frame(width: 100, height: 40)
                .border(.black,width: 2.0)
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

