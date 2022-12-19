//
//  PackViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 4/12/2022.
//

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

class PackViewModel: ObservableObject{
    @Published   var packs : [Pack] = []
 
    
    let url = path().url
    
    init() {
        getPacks(complited: {(success , respnse)in
            if success{
                let packs = respnse!
                print("hethouma",packs)
            }else {
                print("error cant connect ")
            }
            
        })
    }
    
    func getPacks(complited: @escaping(Bool, [Pack]?) -> Void) {
      
        
        AF.request("http://\(url)/pack" , method: .get ,encoding: JSONEncoding.default)
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
    
    func addPack(pack: Pack) {
 
        let parametres = [
            "name": pack.name,
            "title": pack.title,
            "description": pack.description,
            "prix": pack.prix,
            "id": pack.idUser
            
        ] as [String : Any]
        AF.request("http://\(url)/pack/add" , method: .post,parameters:parametres ,encoding: JSONEncoding.default)
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

