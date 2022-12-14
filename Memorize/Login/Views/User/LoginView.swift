//
//  LoginView.swift
//  Memorize
//
//  Created by Mac mini 8 on 7/11/2022.
//

import SwiftUI
import LocalAuthentication
struct LoginView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    @State private var isShowingContentView = false
    @State private var isLogin = false
    
    var currentUser: User?
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
                //ContentView()
                VStack{
                    NavigationLink(destination:ControlLogin() .navigationBarBackButtonHidden(true), isActive: $isLogin){
                        Button("Login", action: {
                            
                            viewModel.LogIn(email: viewModel.email, password: viewModel.password,complited: {(user ) in
                                if let  _ = user {
                                   
                                    print("logged in ")
                                    isLogin=true
                                }else{
                                    print("not loged in ")
                                    isLogin=false
                                }
                            })
                            
                        }
                        )
                        
                    }
                    .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3)
                 
//                    NavigationLink(destination:ControlLogin() .navigationBarBackButtonHidden(true), isActive: $isLogin){
//                        Button("FaceId", action: {
//                            
//                           
//                                let context = LAContext()
//                                var error: NSError? = nil
//                              if        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//                               let reason = "Identify yourself!"
//                               context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
//                                                      localizedReason: reason) {
//                                  success, authenticationError in
//                                   DispatchQueue.main.async {
//                                      guard success, error == nil else{
//                                      //Authentication failed, prompt an error message to the
//                                      //user
//                                     return
//                                   }
//                               //Authentication successful! Proceed to next app screen.
//                             isLogin = true
//                              }
//                             }
//                            } else {
//                                LoginView().alert(isPresented: $isLogin){
//                                    Alert(title: Text("Unvailable"),message: Text("face Id") ,dismissButton: nil)
//                                }
//                            //No biometrics available
//                            let alert = UIAlertController(title: "Unavailable", message: "FaceID Auth not available", preferredStyle: .alert)
//                            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//                            
//                            }
//                            
//                           
//                        }
//                        )
//                        
//                    }
                   
                    Spacer()
                    NavigationLink(destination: ForgetView()){
                        Text("forget ")
                            .foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1)))
                                                        .frame(width: 100, height: 40)
                                                       
                        
                        
                    }
                    
                }.position(x:180,y:30).padding(20)
                
                // Bottom View
                Image("bottomLogin")
                    .overlay (
                        
                        HStack {
                            Button{
                                    
                                
                                    
                                    viewModel.LogInGoogle(complited: {(user ) in
                                        if let  _ = user {
                                           
                                            print("logged in ")
                                            isLogin=true
                                        }else{
                                            print("not loged in ")
                                            isLogin=false
                                        }
                                    })
                                    
                                        }label: {
                                            Image("google")
                                                .resizable()
                                                .frame(width: 40,height: 40)
                                                .padding()
                                        }
                                        .clipShape(Circle())
                                        .padding()
                                        .position(x:20)
                            
                        
                            NavigationLink(destination: RegisterCView(),isActive: $isShowingRegisterView){
                                Button("Register", action: {
                                    
                                    isShowingRegisterView = true
                                })
                                .frame(width:100, height: 50).foregroundColor(Color(uiColor: UIColor(red: 0.235, green: 0.247, blue: 0.306, alpha: 1))).background(Color(uiColor: UIColor(red: 0.886, green: 0.851, blue: 0.765, alpha: 1))).cornerRadius(15).shadow(radius: 3).padding().position(x:100,y:35)
                                
                                
                            }
                            
                            
                        }.padding(50)
                    )
            }.padding([.leading,.trailing],200)
            
            .background(Color(uiColor: UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
        }.navigationBarBackButtonHidden(true)
        
        
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}




