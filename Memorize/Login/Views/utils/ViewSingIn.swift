//
//  ViewSingIn.swift
//  Memorize
//
//  Created by Apple Esprit on 6/12/2022.
//

import SwiftUI


/*struct ViewSingIn :View {
  //  @EnvironmentObject var vm: UserAuthModel
    
    fileprivate func SignInButton() -> Button<Text> {
        Button(action: {
            vm.signIn()
        }) {
            Text("Sign In")
        }
    }
    
    fileprivate func SignOutButton() -> Button<Text> {
        Button(action: {
            vm.signOut()
        }) {
            Text("Sign Out")
        }
    }
    
    fileprivate func ProfilePic() -> some View {
        AsyncImage(url: URL(string: vm.profilePicUrl))
            .frame(width: 100, height: 100)
    }
    
    fileprivate func UserInfo() -> Text {
        return Text(vm.givenName)
    }
    
    var body: some View {
        VStack{
            UserInfo()
            ProfilePic()
            if(vm.isLoggedIn){
                SignOutButton()
            }else{
                SignInButton()
            }
            Text(vm.errorMessage)
        }.navigationTitle("Login")
    }
}
*/
