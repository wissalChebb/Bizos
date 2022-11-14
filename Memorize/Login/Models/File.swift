//
//  File.swift
//  Memorize
//
//  Created by Apple Esprit on 12/11/2022.
//

struct Login : View {
    @ObservedObject var viewModel = UserViewModel()
   
    @State var mail = ""
    @State var pass = ""
   
    var body : some View{
       
        VStack{
           
            VStack{
               
                HStack(spacing: 15){
                   
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                   
                    TextField("Enter Email Address", text: $viewModel.email)
                   
                }.padding(.vertical, 20)
               
                Divider()
               
                HStack(spacing: 15){
                   
                    Image(systemName: "lock")
                    .resizable()
                    .frame(width: 15, height: 18)
                    .foregroundColor(.black)
                   
                    SecureField("Password", text: $viewModel.password)
                   
                    Button(action: {
                       
                    }) {
                       
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                   
                }.padding(.vertical, 20)
               
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.top, 25)
           
           
            Button(action: {
                viewModel.LogIn(completed: { (success, reponse) in
                    
                    if success {
                      //  let utilisateur = reponse as! User
                        print("mailfgfg", mail)
                        
                       
                    } else {
                        print("ERROR CANT CONNECT")
                    }
                    
                })
             
               
            }) {
               
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
               
            }.background(
           
                LinearGradient(gradient: .init(colors: [Color.black,Color.black,Color.black]), startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(😎
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
    }
}
