//
//  UserAuthModel.swift
//  Memorize
//
//  Created by Apple Esprit on 6/12/2022.
//


import SwiftUI
import GoogleSignIn
import Alamofire
class UserAuthModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
        }
    }
    
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            
            self.checkStatus()
        }
    }
    
    func signIn(completionNeedSingIn: @escaping (String) -> Void){
            
           guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

            let signInConfig = GIDConfiguration.init(clientID: "488385230841-oqb9oo72kl63d5df082qvt1oa3dhprpj.apps.googleusercontent.com")
            GIDSignIn.sharedInstance.signIn(
                with: signInConfig,
                presenting: presentingViewController,
                callback: { [weak self] user, error in
                    print("Google Account: \(user?.profile?.name)")
                    print("Google Account: \(user?.profile?.email)")
                    print("Google Account: \(user?.profile?.hasImage)")
                    print("Google Account: \(user?.profile?.imageURL(withDimension: 64))")
                    if user != nil {
                        let newUser = User(firstname: user?.profile?.givenName ?? "", password: "Azerty123", email: user?.profile?.email ?? "", lastName: user?.profile?.familyName ?? "", image: user?.profile?.imageURL(withDimension: 64)?.absoluteString ?? "", role: "")
                        let parametres: [String: Any] = [
                            "first_name": newUser.firstName,
                            "last_name": newUser.lastName,
                            "email": newUser.email,
                            "password": newUser.password,
                            
                            
                        ]
                        AF.request("http://\(path().url)/user/compte" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
                            .validate(statusCode: 200..<500)
                            .validate(contentType: ["application/json"])
                            .responseData { response in
                                switch response.result {
                                case .success:
                                    print("success")
                                    completionNeedSingIn(newUser.email)
                                case let .failure(error):
                                    completionNeedSingIn(newUser.email)
                                }
                            }
                        
                    }
                    
                    if let error = error {
                        self?.errorMessage = "error: \(error.localizedDescription)"
                    }
                    self?.checkStatus()
                }
            )
        }
    
    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}


