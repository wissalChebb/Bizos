//
//  ProfileView.swift
//  Memorize
//
//  Created by Apple Esprit on 10/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ZStack{
            ZStack{
                VStack{
                    VStack{}.frame(maxWidth: .infinity,maxHeight: 230).background(Color(uiColor: UIColor(red: 0.97, green: 0.95, blue: 0.89, alpha: 1)))
                    Spacer()
                }
                VStack(){
                    HStack() {
                        Image("cercle").resizable().scaledToFill().frame(width: 180,height: 180).overlay(
                            VStack(){
                            }
                        )
                        Spacer()
                    }
                    Spacer()
                    
                }.ignoresSafeArea()
            }
                
                VStack{
                    ZStack{
                        VStack{}.frame(width: 350, height: 200,alignment:.center).background(.white).padding(.top,100).shadow(radius: 6)
                        //   .cornerRadius(20)
                        VStack{
                            Image("wissal").resizable().frame(width: 100,height: 100).border(Color.white,width: 3.0).cornerRadius(50).padding(.top,5)
                            
                            Text("Maitre Manai Houceme").bold().padding()
                            HStack{
                                Image(systemName: "location")
                                Text("Tunisia")
                            }
                        }.padding().frame(height: 300)
                        
                    }
                    
                    HStack{
                        Button{/*action*/}label: {
                            Text("Message").frame(width: 150,height:50).foregroundColor(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1))).background(.white).cornerRadius(5).shadow(radius: 6).padding()
                        }
                        Button{/*action*/}label:{Text("Apple").frame(width: 150,height: 50).foregroundColor(.white).background(Color(uiColor: UIColor(red: 0.88, green: 0.85, blue: 0.77, alpha: 1))).cornerRadius(5).shadow(radius: 3).padding()}
                        
                    }
                    VStack(alignment: .leading){
                        Text("About").bold().padding(.vertical)
                        Text("hgfdwrwxdfcgvhbjn,k,knbvjgcfkghcghlsdhbc vlbd vlbd fvlh lfjahvjmahrbfamj jfcigfcigcicycoytcycfckhckhfjae v")
                    }.padding()
                    Spacer()
                }
            
        }
    }
    
    
}
    

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


