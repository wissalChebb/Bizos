//
//  CategorieViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 25/11/2022.
//

import Foundation
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON

class CategorieViewModel: ObservableObject{
    @Published   var categories : [Categorie] = []
    var name : String = ""
    var image : String = ""
    
    let url = "172.17.4.206:5000"
    
    init() {
        getCategorie(complited: {(success , respnse)in
            if success{
                let categories = respnse!
                print("ahyaaaaa",categories)
            }else {
                print("error cant connect ")
            }
            
        })
    }
    
    func getCategorie(complited: @escaping(Bool, [Categorie]?) -> Void) {
      
        
        AF.request("http://\(url)/categorie" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    
               
                    for singleJsonItem in JSON(response.data!){
                      
                        self.categories.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    
                    complited(true,self.categories)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    
    func makeItem(jsonItem : JSON) -> Categorie {
        return Categorie (id: jsonItem["_id"].stringValue,
                          name: jsonItem["name"].stringValue,
                          image: jsonItem["image"].stringValue
        )

    }
     
   
}
