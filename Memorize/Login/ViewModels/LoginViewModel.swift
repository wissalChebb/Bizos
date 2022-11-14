//
//  LoginViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 12/11/2022.
//

import Foundation


import Alamofire

class LoginViewModel: ObservableObject {
    var firstName : String = ""
    var lastName : String = ""
    
    var password : String = ""
    var email : String = ""
  

    static let sharedInstance = LoginViewModel()
    
    func LogIn() {
        print(email)
      
        AF.request("http://172.17.1.190:5000/user/Signin" , method: .post,parameters: ["email": email,"password": password],encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                   // let jsondata = JSON(response.data)
                    print("success")
                    print(response)

                case let .failure(error):
                    print(response)
                    print(error)
                }
            
            }
      
            
    }
    
    func SignUp(user: User) {
        let parametres: [String: Any] = [
            "name": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "password": user.password,
          
        
        ]
        AF.request("http://127.0.0.1:5000/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
        
    }

}
