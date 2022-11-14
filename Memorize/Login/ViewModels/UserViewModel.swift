import Foundation
import Alamofire

class UserViewModel: ObservableObject {
    var firstName : String = ""
    var lastName : String  = ""
    var password : String  = ""
    var email : String  = ""
    
    static let sharedInstance = UserViewModel()
    
    
    func LogIn(completed: @escaping (Bool, Any?) -> Void) {
        
        AF.request("http://172.17.3.247:5000/user/Signin" , method: .post, parameters: ["email": email,"password": password] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON {
                (response) in
                switch response.result {
                case .success(let JSON):
                    print("success \(JSON)")
                    onSuccess()

                case .failure(let error):
                    //print("request failed \(error)")
                    onError(error.localizedDescription)

                    //response in debugPrint(response)
                    if error != nil {
                        onError(error.localizedDescription)
                        return
                    
                }                }
            }
        // print("email : ",email)
        //print("password",password)
        
    }
    
    func SignUp(user: User) {
        print(user)
        let parametres: [String: Any] = [
            "name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            
        ]
        AF.request("http://172.17.3.247:5000/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
    func VerifyAccount(emailToken: String) {
            let parametres: [String: Any] = [
                "token":emailToken
            ]
            AF.request("http://172.17.8.25:3000/api/user/verifyAccount" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
                .responseJSON {
                    (response) in
                    switch response.result {
                    case .success(let JSON):
                        print("success \(JSON)")
                    case .failure(let error):
                        print("request failed \(error)")
                    }
                }
                
        }
    
    
}
