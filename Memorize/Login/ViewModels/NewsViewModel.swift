//
//  NewsViewModel.swift
//  Memorize
//
//  Created by Apple Esprit on 28/11/2022.
//

import Foundation


import Foundation
import SDWebImageSwiftUI
import Alamofire
import SwiftyJSON

class NewsViewModel: ObservableObject{
    @Published   var news : [News] = []
    
    var search : String = ""
    var image : String = ""
    
    let url = "172.17.3.77:5000"
    
    init() {
        getNews(complited: {(success , respnse)in
            if success{
                let news = respnse!
                print("ahyaaaaa",news)
            }else {
                print("error cant connect ")
            }
            
        })
    }
    
    func getNews(complited: @escaping(Bool, [News]?) -> Void) {
      
        
        AF.request("http://\(url)/user/getNews" , method: .get ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                print(response)
                switch response.result {
                 
                case .success:
                    
             
                    for singleJsonItem in JSON(response.data!){
                      
                        self.news.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    print(self.news)
                    
                    complited(true,self.news)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    
    
    func getNewsRecherche(search : String ,complited: @escaping(Bool, [News]?) -> Void) {
      
        
        AF.request("http://\(url)/user/getnew" , method: .post, parameters:[ "search" : search] ,encoding: JSONEncoding.default)
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {
                response in
                print(response)
                switch response.result {
                 
                case .success:
                    
             
                    for singleJsonItem in JSON(response.data!){
                      
                        self.news.append(self.makeItem(jsonItem:singleJsonItem.1))
                    }
                    print(self.news)
                    
                    complited(true,self.news)
                case let .failure(error):
                    debugPrint(error)
                complited(false,nil)
                }
            }
        
    }
    
    func makeItem(jsonItem : JSON) -> News {
        return News(title: jsonItem["title"].stringValue,
                    date: jsonItem["date"].stringValue,
                    snippet: jsonItem["snippet"].stringValue,
                    thumbnail: jsonItem["thumbnail"].stringValue
        )
        

    }
     
   
}

