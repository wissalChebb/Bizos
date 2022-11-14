//
//  UserService.swift
//  Memorize
//
//  Created by Apple Esprit on 12/11/2022.
//

import Foundation
enum AuthenticationError : Error{
    case inavalidCreadentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable{
    let username: String
    let password: String
}

struct LoginResponse:Codable{
    let firstName: String
    let lastName: String
    let email :String
    let token: String
}


class UserService{
    func SignIn(username:String, password:String, completion: @escaping (Result<String,AuthenticationError>)->Void)
    {
        guard let url = URL(string: "http://localhost:5000/user/SingeIn") else {
            completion(.failure(.custom(errorMessage: "url invalid")))
       return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request){ (data , response , error) in
            guard let data = data , error == nil else{
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            guard let LoginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data ) else{
                completion(.failure(.inavalidCreadentials))
                return
            }
            
            
            
        }.resume()
        
        
        
    }
            
}

