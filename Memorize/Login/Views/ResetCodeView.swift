//
//  LoginView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI

struct ResetCodeView: View {
    @State var Code:String = ""
   
    
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
                                
                            TextField("Enter CODE...", text: $Code)
                                .padding()
                                .background()
                                .cornerRadius(20.0)
                        
                        
                    }.padding([.leading,.trailing],27.5)
                    
                    
                )
            HStack{
                NavigationLink(destination: ChangePasswordView(),isActive: $isShowingRegisterView){
                    Button("enter", action: {
                        isShowingRegisterView = true
                    })
                    .foregroundColor(.black)
                    .frame(width: 100, height: 40)
                    .border(.black,width: 2.0)
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

struct ResetCode_Previews: PreviewProvider {
    static var previews: some View {
        ResetCodeView()
    }
}

