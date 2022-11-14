//
//  File.swift
//  Memorize
//
//  Created by Apple Esprit on 14/11/2022.
//


//
//  SignInView.swift
//  clothy
//
//  Created by haithem ghattas on 4/11/2022.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @StateObject private var loginVM = LoginViewModel()

    @State var navigated = false
    @State var email = ""
    @State var password = ""
    @Binding var forgetpw : Bool

    @State var isLoading = false
    @Binding var showModal: Bool
    @Binding var showSignUp: Bool

    

    @Binding var show: Bool
  
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    
    func logIn() {
        
        
        
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            check.triggerInput("Check")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isLoading = false
            confetti.triggerInput("Trigger explosion")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
                showModal = false
                show = false
                
            }
            
            
        }
    }
  

    
    
    var body: some View {
     
        VStack(spacing: 24) {
           
            Text("Sign In")
                .customFont(.largeTitle)
       
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                TextField("", text: $loginVM.email)
                    .customTextField()
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                SecureField("", text: $loginVM.password)
                    .customTextField(image: Image("Icon Lock"))
            }
            
            Button {
                loginVM.connexion(completed: { (success, reponse) in
                    
                    if success {
                        //  let utilisateur = reponse as! User
                        
                        
                        logIn()
                    } else {
                        print("ERROR CANT CONNECT")
                    }
                    
                })
                
            }
              // loginVM.login()
                
         //      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
           //       loginVM.isAuthenticated ?
                    
                    
             //      logIn() : print("ERROR CANT CONNECT")

            //    }
              
            
                
                
            } label: {
                Label("Sign In", systemImage: "arrow.right")
                    .customFont(.headline)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundColor(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft])
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
            }
            HStack{
                Text("Forgot password?  Reset")
                    .customFont(.subheadline)
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        forgetpw = true ;
                      //  showModal = false
                        

                }
                
                
            }
         
            
         
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR").customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }
            Button {
                withAnimation {
                    
                    showSignUp = true
                    showModal = false
                }
           
                
                
            } label: {
                Label("Sign Up", systemImage: "arrow.right")
                    .customFont(.headline)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "F77D8E"))
                    .foregroundColor(.white)
                    .cornerRadius(20, corners: [.topRight, .bottomLeft, .bottomRight])
                    .cornerRadius(8, corners: [.topLeft])
                .shadow(color: Color(hex: "F77D8E").opacity(0.5), radius: 20, x: 0, y: 10)
            }
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                .customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Email, Apple or Google")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image("Logo Email")
                Spacer()
                Image("Logo Apple")
                Spacer()
                Image("Logo Google")
            }
        }.padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.😎, .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .padding()
        .overlay(
            ZStack {
         
                
                        if forgetpw {
                            withAnimation {
                                ForgotPWView( forgetpw: $forgetpw)
                               

                            }
                        }
                 
                if isLoading {
                    
                    check.view()
                        .frame(width: 100, height: 100)
                        .allowsHitTesting(false)
                }
                confetti.view()
                    .scaleEffect(3)
                    .allowsHitTesting(false)
            }
        )
    }
    


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(forgetpw: .constant(true), showModal: .constant(true), showSignUp: .constant(true),  show: .constant(true))    }
}



                                          
                                                 //
                                                 //  LoginViewModal.swift
                                                 //  clothy
                                                 //
                                                 //  Created by haithem ghattas on 7/11/2022.
                                                 //

                                                 import Foundation
                                                 import Alamofire
                                                 import SwiftyJSON


                                                 class LoginViewModel: ObservableObject {
                                                     
                                                     var email: String = ""
                                                     var password: String = ""
                                                     var firstname: String = ""
                                                     var lastname: String = ""
                                                     var phone: String = ""
                                                     var pseudo: String = ""
                                                     var prefrences: String = "hiphop"
                                                    // var  utilisateur = User()
                                                     




                                                     @Published var isAuthenticated: Bool = false
                                                     @Published var isAResgistred: Bool = false
                                                     
                                                     func inscription( completed: @escaping (Bool) -> Void) {
                                                         AF.request("http://localhost:9090/api/register",
                                                                    method: .post,
                                                                    parameters: [
                                                                     "email": email,
                                                                     "password": password,
                                                                     "firstname": firstname,
                                                                     "lastname":lastname,
                                                                     "phone": phone,
                                                                     "pseudo": pseudo,
                                                                     "preference": prefrences
                                                                     //"dateNaissance": DateUtils.formatFromDate(date: utilisateur.dateNaissance!) ,
                                                                     //"idPhoto": utilisateur.idPhoto!,
                                                                     //"sexe": utilisateur.sexe!,
                                                                     //"score": utilisateur.score!,
                                                                     //"bio": utilisateur.bio!
                                                                    ] ,encoding: JSONEncoding.default)
                                                             .validate(statusCode: 200..<300)
                                                             .validate(contentType: ["application/json"])
                                                             .responseData { response in
                                                                 switch response.result {
                                                                 case .success:
                                                                     print("Validation Successful")
                                                                     completed(true)
                                                                  
                                                                 case let .failure(error):
                                                                     print(error)
                                                                     completed(false)
                                                                 }
                                                             }
                                                     }

                                                     func connexion(completed: @escaping (Bool, Any?) -> Void)  {
                                                       
                                                         AF.request("http://localhost:9090/api/login",
                                                                    method: .post,
                                                                    parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
                                                             .validate(statusCode: 200..<300)
                                                             .validate(contentType: ["application/json"])
                                                             .responseData { [self] response in
                                                                 switch response.result {
                                                                    
                                                                 case .success:
                                                                     let jsonData = JSON(response.data!)
                                                                     print(jsonData)
                                                                     //User().pseudo = jsonData["pseudo"].stringValue
                                                                     let utilisateur = self.makeItem(jsonItem: jsonData["userr"])
                                                                     UserDefaults.standard.setValue(jsonData["token"].stringValue, forKey: "tokenConnexion")
                                                                     UserDefaults.standard.setValue(utilisateur._id, forKey: "id")
                                                              //       UserDefaults.standard.setValue(self.utilisateur.firstname, forKey: "firstname")

                                                                     
                                                                     
                                                                   //  print(utilisateur.firstname ?? "aaz")
                                                                     

                                                                     
                                                                    completed(true, utilisateur)
                                                                 case let .failure(error):
                                                                     debugPrint(error)
                                                                 completed(false, nil)
                                                                 }
                                                             }
                                                     }
                                                     
                                                    
                                                     
                                                     func login() {
                                                         
                                                         let defaults = UserDefaults.standard
                                                         
                                                         Webservice().login(email: email, password: password) { [self] result in
                                                             switch result {
                                                                 case .success(let token):
                                                                 print(token)
                                                                 print(firstname)
                                                                     defaults.setValue(token, forKey: "jsonwebtoken")
                                                                     DispatchQueue.main.async {
                                                                         self.isAuthenticated = true
                                                                         
                                                                       //  print(LoginResponse.firstname)
                                                                     }
                                                                 case .failure(let error):
                                                                     print(error.localizedDescription)
                                                             }
                                                         }
                                                     }
                                                     
                                                     func signout() {
                                                            
                                                            let defaults = UserDefaults.standard
                                                            defaults.removeObject(forKey: "jsonwebtoken")
                                                            DispatchQueue.main.async {
                                                                self.isAuthenticated = false
                                                            }
                                                            
                                                        }
                                                     /*
                                                     func register() {
                                                         
                                                       //  let defaults = UserDefaults.standard
                                                         
                                                         Webservice().register(email: email, password: password, firstname: firstname, lastname: lastname, phone: phone, pseudo: pseudo) { result in
                                                             switch result {
                                                                 case .success:
                                                                 print("registred")
                                                                 DispatchQueue.main.async {
                                                                     self.isAResgistred = true
                                                                     
                                                                 }
                                                                    
                                                                 case .failure(let error):
                                                                     print(error.localizedDescription)
                                                             }
                                                         }
                                                     }
                                                      */
                                                     
                                                     func forgorPW(email: String, completed: @escaping (Bool) -> Void) {
                                                         AF.request("http://localhost:9090/api/forgetpwd",
                                                                    method: .post,
                                                                    parameters: ["email": email], encoding: JSONEncoding.default)
                                                             .validate(statusCode: 200..<300)
                                                             .validate(contentType: ["application/json"])
                                                             .responseData { response in
                                                                 switch response.result {
                                                                 case .success:
                                                                     print("mail is sent")
                                                                     completed(true)
                                                                 case let .failure(error):
                                                                     print(error)
                                                                     completed(false)
                                                                 }
                                                             }
                                                     }
                                                     func EnterfpwCode(email: String,code: Int , completed: @escaping (Bool) -> Void) {
                                                         AF.request("http://localhost:9090/api/changepwcode",
                                                                    method: .post,
                                                                    parameters: ["email": email , "code": code], encoding: JSONEncoding.default)
                                                             .validate(statusCode: 200..<300)
                                                             .validate(contentType: ["application/json"])
                                                             .responseData { response in
                                                                 switch response.result {
                                                                 case .success:
                                                                     print("code is true")
                                                                     completed(true)
                                                                 case let .failure(error):
                                                                     print(error)
                                                                     completed(false)
                                                                 }
                                                             }
                                                     }

                                                     
                                                     
                                                     
                                                     
                                                     func makeItem(jsonItem: JSON) -> User {
                                                         
                                                    

                                                         
                                                         return User(
                                                             _id: jsonItem["_id"].stringValue,
                                                             pseudo: jsonItem["pseudo"].stringValue,
                                                             email: jsonItem["email"].stringValue,
                                                             password: jsonItem["password"].stringValue,
                                                             firstname: jsonItem["firstname"].stringValue,
                                                             lastname: jsonItem["lastname"].stringValue,
                                                             birthdate: DateUtils.formatFromString(string: jsonItem["dateNaissance"].stringValue)
                                                          //   idPhoto: jsonItem["idPhoto"].stringValue,
                                                           //  sexe: jsonItem["sexe"].boolValue,
                                                          //   score: jsonItem["score"].intValue,
                                                          //   bio: jsonItem["bio"].stringValue,
                                                         //    isVerified: jsonItem["isVerified"].boolValue,
                                                           
                                                         )
                                                     }
                                                  
                                                     struct LoginViewModel {
                                                         let user : User
                                                         var fnmae: String {
                                                             return self.user.firstname ?? "oppa ala ouropa"
                                                         }
                                                     }
                                                     
                                                 }
