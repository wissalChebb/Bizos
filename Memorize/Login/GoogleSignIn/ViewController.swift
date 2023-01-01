

import UIKit
import GoogleSignIn
import Alamofire
class ViewController: UIViewController {
    static var CurrentUser: User?
    func SignUp(user: User) {
        print(user)
        let parametres: [String: Any] = [
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email,
            "password": user.password,
            
        ]
        AF.request("/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    let signInConfig = GIDConfiguration(clientID: "825384301124-e7qnedsdkv2rbqv7jsmfd17ubj1e3uoa.apps.googleusercontent.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func googleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            let emailAddress:String = user.profile?.email  ?? ""
            let fullName:String = user.profile?.name ?? ""
            let givenName:String = user.profile?.givenName ?? ""
            let familyName:String = user.profile?.familyName ?? ""
            print(emailAddress,fullName,givenName)
         
  
        }
    }
    
}
