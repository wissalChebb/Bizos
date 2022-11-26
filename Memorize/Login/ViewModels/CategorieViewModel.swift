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
    @Published   var categories : [Categorie]? = []
    var name : String = ""
    var image : String = ""
    
    let url = "172.17.4.74:5000"
    
    func getCategorie() {
      
        
        AF.request("http://\(url)/categorie" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                switch response.result {
                case .success:
                    let json = try! JSON (data : response.data!)
                    for i in json{
                      
                        self.categories?.append(Categorie(id: i.1["id"].stringValue, name: i.1["name"].stringValue, image: i.1["image"].stringValue))
                    }
                case let .failure(error):
                print(error)
                }
            }
        
    }
     
   
}
