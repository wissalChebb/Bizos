import Foundation
import Alamofire
import UIKit
import AlamofireImage
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON
class UserViewModel: ObservableObject {
     var firstName : String = ""
    var lastName : String  = ""
    var password : String  = "123"
    var email : String  = "wissal.chebbi@esprit.tn"
    var resetCode : String = ""
    var validateCode : String = ""
    var newPassword : String = ""
    var confirmpass : String = ""
    @Published   var avocats : [User] = []
    @Published   var packs : [Pack] = []
    init() {
        getAllAvoat(complited: {(success , respnse)in
            if success{
                let avocats = respnse!
                print("ahyaaaaa", avocats)
            }else {
                print("error cant connect ")
            }
            
        })
        getPacks(complited: {(success , respnse)in
            if success{
                let packs = respnse!
                print("hethouma",packs)
            }else {
                print("error cant connect ")
            }
            
        })
    }
   
    
    static var currentUser: User?
    
 
    let url = path().url
    func addSignature(user: User,image: UIImage ) {
           print(user)
           let parametres: [String: Any] = [
              
               "image" : user.signature
               
           ]
           
           
           
           let imgData = image.jpegData(compressionQuality: 0.2)!
           
           
           
           AF.upload(multipartFormData: { multipartFormData in
               multipartFormData.append(imgData, withName: "image",fileName: "file.jpeg", mimeType: "image/jpeg")
               for ( key,value) in parametres {
                   
                   multipartFormData.append(  (value as! String).data(using: .utf8)!, withName: key)
               } //Optional for extra parameters
           },
                     to:"http://\(url)/user/addSignature/\(user.id ?? "")").responseData(completionHandler: { response in
               switch response.result {
               case .success:
                   
                   print("success image")
                   
               case .failure(let encodingError):
                   print(encodingError)
               }
           })
           
       }

    func LogIn(email: String,password: String, complited: @escaping(User?)-> Void )
    
    {
        
        AF.request("http://\(url)/user/Signin" , method: .post, parameters: ["email": email,"password": password] ,encoding: JSONEncoding.default)
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
                    let role = userResponse.object(forKey: "role")  as? String ?? ""
                    print("success  \(email )")
                    print("success  \(lastName )")
                    print("success  \(password )")
                    print("success  \(image )")
                    print("success  \(role )")
                    var currentUser = User(firstname: firstName, password: password, email: email, lastName: lastName, specialite: "", image: image, experience: 0, role: role)
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
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            
        ]
        AF.request("http://\(url)/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
            "image" : user.image
            
        ]
        
        
        
        let imgData = image.jpegData(compressionQuality: 0.2)!
        
        
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "image",fileName: "file.jpg", mimeType: "image/jpg")
            for ( key,value) in parametres {
                
                multipartFormData.append(  (value as! String).data(using: .utf8)!, withName: key)
            } //Optional for extra parameters
        },
                  to:"http://\(url)/user/updateUser/\(user.id ?? "")").responseData(completionHandler: { response in
            switch response.result {
            case .success:
                
                print("success image")
                
            case .failure(let encodingError):
                print(encodingError)
            }
        })
        
    }
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
        
    
//    func fgghhg(user: User) {
//        var url = URL(string: "http://\(url)/user/updateUser/\(user.id ?? "")")
//        print(url)
//        selectedImage.af.setImage(withURL: url!)
//
//    }
//
        
           
  
    
    func ResetPassword(email: String) {
            let parametres: [String: Any] = [
                "email": email
            ]
            AF.request("http://\(url)/user/resetpwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
            AF.request("http://\(url)/user/resetpassword" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
            AF.request("http://\(url)/user/changepwd" , method: .post,parameters: parametres,encoding: JSONEncoding.default)
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
    
    func getAllAvoat(complited: @escaping(Bool, [User]?) -> Void) {
      
        
        AF.request("http://\(url)/user/allAvocat" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
             
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.avocats.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    print(self.avocats)
                    
                    
                    complited(true,self.avocats)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    func makeItem(jsonItem : JSON) -> User {
        return User (id: jsonItem["_id"].stringValue,
                     firstname: jsonItem["first_name"].stringValue,
                     lastName:jsonItem["last_name"].stringValue,
                     specialite:  jsonItem["specialite"].stringValue,
                     experience:  jsonItem["experience"].intValue,
                     image:    jsonItem["image"].stringValue
                    
                     
        )

    }
    
    func updateAvocat(id: String ,specialite:String, experience:Int) {
       
        let parametres: [String: Any] = [
            "categorie": specialite,
            "experience": experience,
            
        ]
        
        AF.request("http://\(url)/user/UpdateAvocat/"+id , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseJSON {
                response in
                switch response.result {
                case .success:
                    print("success")
                case let .failure(error):
                    print(error)
                }
            }
    
        
        
    }
    
    func getPacks(complited: @escaping(Bool, [Pack]?) -> Void) {
      
        
        AF.request("http://\(url)/pack"  , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.packs.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.packs)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    func makeItem(jsonItem : JSON) -> Pack {
        return Pack(title: jsonItem["title"].stringValue,
                    name: jsonItem["name"].stringValue,
                    prix: jsonItem["prix"].floatValue,
                    description: jsonItem["description"].stringValue)

    }
}
