import Foundation
import Alamofire
import UIKit

class UserViewModel: ObservableObject {
    var firstName : String = ""
    var lastName : String  = ""
    var password : String  = "wissal"
    var email : String  = "Hassenahmadi@ymail.com"
    var resetCode : String = ""
    var validateCode : String = ""
    var newPassword : String = ""
    static var currentUser: User?
    
    static let sharedInstance = UserViewModel()
    
    
    func LogIn(email: String,password: String, complited: @escaping(User?)-> Void )
    
    {
        
        AF.request("http://172.17.3.91:5000/user/Signin" , method: .post, parameters: ["email": email,"password": password] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON {
                (response) in
                switch response.result {
                    
                case .success(let JSON):
                    let response = JSON as! NSDictionary
                    let userResponse = response.object(forKey: "user") as! NSDictionary
                    let email = userResponse.object(forKey: "email") as? String ?? ""
                    let lastName = userResponse.object(forKey: "last_name") as? String ?? ""
                    let password = userResponse.object(forKey: "password") as? String ?? ""
                    let firstName = userResponse.object(forKey: "first_name") as? String ?? ""
                    let image = userResponse.object(forKey: "image") as? String ?? ""
                    let id = userResponse.object(forKey: "_id")  as? String ?? ""
                    print("success  \(email )")
                    print("success  \(lastName )")
                    print("success  \(password )")
                   var currentUser = User(firstname: firstName, password: password, email: email, lastName: lastName)
                    currentUser.id = id
                    currentUser.image = image
                    Self.currentUser = currentUser
                  
                    print("success \(JSON )")
                   
                    complited(currentUser)
                case .failure(let error):
                    print("request failed \(error)")
                    complited(nil)
                }
            }
  
    }
   
    
    func SignUp(user: User) {
        print(user)
        let parametres: [String: Any] = [
            "name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            
        ]
        AF.request("http://172.17.3.91:5000/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
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
    
    func updateUser(user: User,image: UIImage ) {
        print(user)
        let parametres: [String: Any] = [
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            
        ]
        
      
       
        let imgData = image.jpegData(compressionQuality: 0.2)!

       

        AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
                for ( key,value) in parametres {
                  
                    multipartFormData.append(  (value as! String).data(using: .utf8)!, withName: key)
                    } //Optional for extra parameters
            },
                  to:"http://172.17.3.91:5000/user/updateUser/\(user.id ?? "")").responseData(completionHandler: { response in
            switch response.result {
             case .success:

              print("success image")

             case .failure(let encodingError):
                 print(encodingError)
             }
        })
        
        
      /* AF.request("http://172.17.3.91:5000/user/updateUser/\(user.id ?? "")" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseJSON {
                (response) in
                switch response.result {
                    
                case .success(let JSON):
                    let response = JSON as! NSDictionary
                    let userResponse = response.object(forKey: "user") as! NSDictionary
                    let email = userResponse.object(forKey: "email") as? String ?? ""
                    let lastName = userResponse.object(forKey: "last_name") as? String ?? ""
                    let firstName = userResponse.object(forKey: "first_name") as? String ?? ""
                    let password = userResponse.object(forKey: "password") as? String ?? ""
                    let id = userResponse.object(forKey: "_id")  as? String ?? ""
                    print("success  \(email )")
                    print("success  \(lastName )")
                    print("success  \(password )")
                   var currentUser = User(firstname: firstName, password: password, email: email, lastName: lastName)
                    currentUser.id = id
                    Self.currentUser = currentUser
                  
                    print("success \(JSON )")
                   
                   
                case .failure(let error):
                    print("request failed \(error)")
               
                }
            }*/
        
    }
    
    func ResetPassword(email: String) {
            let parametres: [String: Any] = [
                "email": email
            ]
            AF.request("http://172.17.3.91:5000/user/resetpwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        print("email : ",email)
                    case .failure(let error):
                        print("request failed \(error)")
                    }
                }
            

        }
    
    func ValideCode(code :String,complited: @escaping(Bool)-> Void ) {
            let parametres: [String: Any] = [
                "code": code
            ]
            AF.request("http://172.17.3.91:5000/user/resetpassword" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        
                        complited(true)
                    case .failure(let error):
                        print("request failed \(error)")
                        complited(false)
                    }
                }
            

        }
    
    func changePassword(email:String,newPassword: String) {
            let parametres: [String: Any] = [
                "email": email,
                "password": newPassword
            ]
            AF.request("http://172.17.3.91:5000/user/changepwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                        print("email : ",email)
                        
                    case .failure(let error):
                        print("request failed \(error)")
                        
                    }
                }
            

        }
    
    
   
    
    
}
