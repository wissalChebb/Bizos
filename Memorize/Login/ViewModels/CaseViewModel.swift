//
//  CaseViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 26/11/2022.
//

import Foundation



import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON

class CasesViewModel: ObservableObject{
    @Published   var cases : [Case] = []
    var name : String = ""
    var image : String = ""
    
    let url = "172.17.11.147:5000"
    
    init() {
        getCases(complited: {(success , respnse)in
            if success{
                let cases = respnse!
                print("ahyaaaaa",cases)
            }else {
                print("error cant connect ")
            }
            
        })
    }
    
    func getCases(complited: @escaping(Bool, [Case]?) -> Void) {
      
        
        AF.request("http://\(url)/case" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.cases.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.cases)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    
    func makeItem(jsonItem : JSON) -> Case {
        return Case(traite: jsonItem["traite"].boolValue,
                    description: jsonItem["description"].stringValue,
                    title: jsonItem["title"].stringValue,
                    name: jsonItem["nameUser"].stringValue,
                    prenom: jsonItem["LastnameUser"].stringValue)

    }
    
    func addCase(casee: Case) {
 
        let parametres: [String: Any] = [
            "nameUser": casee.name,
            "LastNameUser": casee.prenom,
            "description": casee.description,
            "title": casee.title
            
        ]
        AF.request("http://\(url)/Case/add" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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
    
     
   
}
